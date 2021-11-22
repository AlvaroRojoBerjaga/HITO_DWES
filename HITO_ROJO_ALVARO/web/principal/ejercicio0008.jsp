<%@page import="misrc.*"%>
<%@page import="java.util.*"%>
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
    String nra = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\curso.txt";
    String mensajeError = "";
    List<Curso> cursos_al = Metodos.getListaCursoFromArchivo(nra);
    String[] asignaturas_as = null;

%>



<%    if (request.getParameter("accion") != null) {

        try {
            
            asignaturas_as = request.getParameterValues("txtAsignatura");
            if (asignaturas_as == null){
               mensajeError = "Selecciona una asignatura"; 
            }
            

        } catch (Exception e) {
            mensajeError = "Selecciona una asignatura";
        }
    }
%>

<%    if (cursos_al != null) {
%>
<div class="caja">
    <h2>Información de asignaturas</h2>
    <div class="caja2">
        <form>
            <p>Seleccionar asignatura/s:</p>
            <%      for (int i = 0; i < cursos_al.size(); i++) {
                    Curso c = cursos_al.get(i);
            %>
            <label><%=c.getNombre()%> </label><input type="checkbox" name="txtAsignatura" value="<%=c.getNombre()%>" />
                <%
                    }
                %>
            <p><input type="submit" value="Enviar" name="accion"></p>
        </form>

        <%
            if (asignaturas_as != null) {
        %>
        <center><table class="tabla" cellspacing="7">
                <tr>
                    <td><b>Código</b></td>
                    <td><b>Nombre</b></td>
                    <td><b>Créditos</b></td>

                </tr>
                <%
                    for (int i = 0; i <asignaturas_as.length ; i++) {

                        for (int j = 0; j < cursos_al.size() ; j++) {
                            
                           if(cursos_al.get(j).getNombre().equalsIgnoreCase(asignaturas_as[i]) ) {
                        
                %>
                <tr>
                    <td><%=cursos_al.get(j).getCodigoClase()%></td>
                    <td><%=cursos_al.get(j).getNombre()%></td>
                    <td><%=cursos_al.get(j).getCreditos()%></td>
                </tr>
                <% 
                        }
                    }
}

                %>
            </table>
        </center>
        <%            }
        %>
        <p class="error"><b><%=mensajeError%></b></p>
                <%
                    }
                %>


    </div>
</div>

