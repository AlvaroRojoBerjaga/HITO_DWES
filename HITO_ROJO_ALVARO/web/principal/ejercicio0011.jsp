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
    List<Alumno> alumnos_al = Metodos.getListaAlumnosFromArchivo(nra);
    List<Alumno> alumnosBisiesto_al = null;

%>

<%    if (request.getParameter("accion") != null) {

        try {
            alumnosBisiesto_al = Metodos.esBisiesto(alumnos_al);

        } catch (Exception e) {
            error = "No hay alumnos con fecha de nacimiento en año bisiesto";
        }
    }
%>
<div class="caja">
    <h2>Mostrar alumnos que nacieron un año bisiesto</h2>
    <div class="caja2">
        <form>
            <input class="boton1" type="submit" value="Ver alumnos" name="accion">
        </form>
        <%
            if (alumnosBisiesto_al != null) {

        %>
        <center><table class="tabla" cellspacing="7">
                <tr>
                    <td><b>Código</b></td>
                    <td><b>Nombre</b></td>
                    <td><b>Apellidos</b></td>
                    <td><b>Fecha Nacimento</b></td>
                    <td><b>Sexo(M/F)</b></td>
                </tr>
                <%            for (int x = 0; x < alumnosBisiesto_al.size(); x++) {
                %>
                <tr>
                    <td><%=alumnosBisiesto_al.get(x).getCodigo()%></td>
                    <td><%=alumnosBisiesto_al.get(x).getNombre()%></td>
                    <td><%=alumnosBisiesto_al.get(x).getApellido()%></td>
                    <td><%=alumnosBisiesto_al.get(x).getFechaNacimiento()%></td>
                    <td><%=alumnosBisiesto_al.get(x).getSexo()%></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
                <p class="error"><b><%=error%></b></p>
        </center>
    </div>
</div>
