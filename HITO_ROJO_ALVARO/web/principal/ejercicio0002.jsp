<%@page import="misrc.*"%>
<%@page import="java.util.List"%>
<%@page import="misrc.Alumno"%>
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
    String mensajeError = "";
    String nra = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\matricula.txt";
    String nra2 = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\alumno.txt";
    List<Matricula> matricula_al = Metodos.getListaMatriculas(nra);
    List<String> codigos_al;
    List<Alumno> alumnos_al = Metodos.getListaAlumnosFromArchivo(nra2);
    List<Alumno> alumnoMatriculado_al = null;
    List<String> fechas_al = Metodos.getListaMatriculasDistintas(matricula_al);
%>

<%    if (request.getParameter("accion") != null) {

        try {

            fechas_gui = request.getParameter("cboFecha");
            if(!fechas_gui.equalsIgnoreCase("seleccionar")) {

            codigos_al = Metodos.getCodigoPorFecha(fechas_gui, matricula_al);

            alumnoMatriculado_al = Metodos.getListaAlumnoPorCodigo(codigos_al, alumnos_al);
            
            }else {
                mensajeError = "Debes selecionar una fecha";
            }

        } catch (Exception e) {
            mensajeError = "Debes selecionar una fecha";
        }
    }
%>

<div class="caja">
    <h2>Buscar alumnos matriculados en una fecha</h2>
    <div class="caja2">    
        <form>
            <p>Selecciona una fecha:</p>
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

            <%            for (int i = 0; i < alumnoMatriculado_al.size(); i++) {

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
</div>