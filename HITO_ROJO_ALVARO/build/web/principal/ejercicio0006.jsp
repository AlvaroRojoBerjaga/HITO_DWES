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
    .boton1{
        margin-top: 10px;
    }
</style>
<%
    String error = "";
    String nra = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\alumno.txt";
    String nra2 = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\matricula.txt";
    List<Alumno> alumnos_al = Metodos.getListaAlumnosFromArchivo(nra);
    List<Matricula> matricula_al = Metodos.getListaMatriculas(nra2);
    List<Alumno> alumnosNoMatr_al = null;

%>

<%    if (request.getParameter("accion") != null) {

        try {
            alumnosNoMatr_al = new ArrayList<Alumno>();
            for (int j = 0; j < matricula_al.size(); j++) {
                String codigo = alumnos_al.get(j).getCodigo();
                boolean estaMatriculado = Metodos.estaMatriculado(matricula_al, codigo);
                if (!estaMatriculado) {
                    alumnosNoMatr_al.add(alumnos_al.get(j));
                }
            }

        } catch (Exception e) {
            error = "No hay alumnos no matriculados";
        }
    }
%>
<div class="caja">
    <h2>Mostrar alumnos no matriculados</h2>
    <div class="caja2">
        <form>
            <input class="boton1" type="submit" value="Ver alumnos" name="accion">
        </form>
        <%
            if (alumnosNoMatr_al != null) {
        %>
        <center><table class="tabla" cellspacing="7">
                <tr>
                    <td><b>Código</b></td>
                    <td><b>Nombre</b></td>
                    <td><b>Apellidos</b></td>
                    <td><b>Fecha Nacimento</b></td>
                    <td><b>Sexo(M/F)</b></td>
                </tr>
                <%            for (int x = 0; x < alumnosNoMatr_al.size(); x++) {
                %>
                <tr>
                    <td><%=alumnosNoMatr_al.get(x).getCodigo()%></td>
                    <td><%=alumnosNoMatr_al.get(x).getNombre()%></td>
                    <td><%=alumnosNoMatr_al.get(x).getApellido()%></td>
                    <td><%=alumnosNoMatr_al.get(x).getFechaNacimiento()%></td>
                    <td><%=alumnosNoMatr_al.get(x).getSexo()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </table></center>
    </div>
</div>