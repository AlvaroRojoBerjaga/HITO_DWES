<%@page import="java.time.LocalDate"%>
<%@page import="java.util.*"%>
<%@page import="misrc.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .caja{
        margin-left: 450px;
        margin-right: 450px;
        text-align: center;
    }
    .caja2{
        border: solid blue 2px;
        padding-bottom: 10px;
        background-color: azure;
    }
    h2 {
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .error{
        color: red;
    }
    .tabla{
        text-align: center;
    }
</style>
<%
    String fechas_gui = "";
    String fechas_gui2 = "";
    String mensajeError = "";
    List<String> codigos_al = null;
    String nra = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\matricula.txt";
    String nra2 = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\alumno.txt";
    List<Alumno> alumnos_al = Metodos.getListaAlumnosFromArchivo(nra2);
    List<Matricula> matricula_al = Metodos.getListaMatriculas(nra);
    List<String> fechas_al = Metodos.getListaMatriculasDistintas(matricula_al);
    List<LocalDate> listaFechasAMostrar = null;
    List<String> listaFechasOrdenadas = null;
    List<Alumno> alumnoMatriculado_al = null;
%>

<%    if (request.getParameter("accion") != null) {

        try {
            String f1 = request.getParameter("cboFecha");
            String f2 = request.getParameter("cboFecha2");
            fechas_gui = f1;
            fechas_gui2 = f2;

            String[] p1 = f1.split("/");
            String[] p2 = f2.split("/");

            LocalDate ld1 = LocalDate.of(Integer.parseInt(p1[2]),
                    Integer.parseInt(p1[1]),
                    Integer.parseInt(p1[0]));
            LocalDate ld2 = LocalDate.of(Integer.parseInt(p2[2]),
                    Integer.parseInt(p2[1]),
                    Integer.parseInt(p2[0]));

            if (ld2.isBefore(ld1)) {
                mensajeError = "La segunda fecha debe ser posterior o igual a la primera.";
            } else {

                listaFechasAMostrar = Metodos.getFechasAMostrar(ld1, ld2, fechas_al);

                listaFechasOrdenadas = Metodos.getFechasAMostrarOrdenadas(listaFechasAMostrar);

                codigos_al = Metodos.getCodigoPorFecha2(listaFechasOrdenadas, matricula_al);

                alumnoMatriculado_al = Metodos.getListaAlumnoPorCodigo(codigos_al, alumnos_al);
            }
        } catch (Exception e) {
            mensajeError = "Debe seleccionar dos fechas";
        }
    }
%>

<div class="caja">
    <h2>Buscar alumnos matriculados entre 2 fechas</h2>

    <div class="caja2">    
        <form>
            <p>Selecciona dos fechas:</p>
            <select name="cboFecha" size="1">
                <option selected>Seleccionar</option>

                <%
                    for (int i = 0; i < fechas_al.size(); i++) {
                        String f = fechas_al.get(i);
                        if (f.equalsIgnoreCase(fechas_gui)) {
                %>
                <option value="<%=f%>" selected><%=f%></option>

                <%
                } else {
                %>
                <option value="<%=f%>"><%=f%></option>
                <%
                        }
                    }
                %>

            </select>
            <select name="cboFecha2" size="1">
                <option selected>Seleccionar</option>

                <%
                    for (int i = 0; i < fechas_al.size(); i++) {

                        String f2 = fechas_al.get(i);
                        if (f2.equalsIgnoreCase(fechas_gui2)) {
                %>
                <option value="<%=f2%>" selected><%=f2%></option>

                <%
                } else {
                %>
                <option value="<%=f2%>"><%=f2%></option>
                <%
                        }
                    }
                %>

            </select>
            <input type="submit" name="accion" value="Buscar">
        </form>
        <%
            if (alumnoMatriculado_al != null) {

        %>

        <center><table class="tabla" cellspacing="7" >
                <tr>
                    <td><b>Código</b></td>
                    <td><b>Nombre</b></td>
                    <td><b>Apellidos</b></td>
                    <td><b>Fecha Nacimento</b></td>
                    <td><b>Sexo(M/F)</b></td>
                </tr>

                <%            
                    for (int i = 0; i < alumnoMatriculado_al.size(); i++) {
                %>
                <tr>
                    <td><%=alumnoMatriculado_al.get(i).getCodigo()%></td>
                    <td><%=alumnoMatriculado_al.get(i).getNombre()%></td>
                    <td><%=alumnoMatriculado_al.get(i).getApellido()%></td>
                    <td><%=alumnoMatriculado_al.get(i).getFechaNacimiento()%></td>
                    <td><%=alumnoMatriculado_al.get(i).getSexo()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </table></center>
        <p class="error"><b><%=mensajeError%></b></p>
    </div>
