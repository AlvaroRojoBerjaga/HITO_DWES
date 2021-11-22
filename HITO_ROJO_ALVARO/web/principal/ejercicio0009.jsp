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
    String nra = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\matricula.txt";
    String nra2 = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\alumno.txt";
    String nra3 = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\curso.txt";
    String mensajeError = "";
    String mensaje = "";
    List<Curso> cursos_al = Metodos.getListaCursoFromArchivo(nra3);
    List<Matricula> matricula_al = Metodos.getListaMatriculas(nra);
    List<Alumno> alumnos_al = Metodos.getListaAlumnosFromArchivo(nra2);
    String codigoCurso = "";
    List<String> listaCodigos_al = new ArrayList<String>();
    List<Alumno> alumnoMatriculado_al = new ArrayList<Alumno>();
    alumnoMatriculado_al = null;
    String asignatura_gui = "";
%>

<%    if (request.getParameter("accion") != null) {

        try {
            String asignatura = request.getParameter("cboAsignatura");

            if (asignatura != null && !asignatura.equalsIgnoreCase("Seleccionar")) {
                asignatura_gui = asignatura;
                for (int i = 0; i < cursos_al.size(); i++) {
                    if (asignatura.equalsIgnoreCase(cursos_al.get(i).getNombre())) {
                        codigoCurso = cursos_al.get(i).getCodigoClase();
                    }
                }

                for (int j = 0; j < matricula_al.size(); j++) {
                    if (codigoCurso.equalsIgnoreCase(matricula_al.get(j).getCodigoClase())) {
                        listaCodigos_al.add(matricula_al.get(j).getCodigoAlumno());
                    }
                }

                alumnoMatriculado_al = Metodos.getListaAlumnoPorCodigo(listaCodigos_al, alumnos_al);

                request.setAttribute("asignatura_a", asignatura_gui);

            } else {
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
    <h2>Ver aumnos matriculados en una asignatura</h2>
    <div class="caja2">
        <form>
            <p>Seleccionar asignatura:</p>
            <select name="cboAsignatura" size="1">
                <option selected>Seleccionar</option>

                <%      for (int i = 0; i < cursos_al.size(); i++) {
                        Curso c = cursos_al.get(i);
                        if (c.getNombre().equalsIgnoreCase(asignatura_gui)) {
                %>
                <option value="<%=c.getNombre()%>" selected><%=c.getNombre()%></option>

                <%
                } else {
                %>
                <option value="<%=c.getNombre()%>"><%=c.getNombre()%></option>
                <%
                        }
                    }
                %>
            </select>
            <p><input type="submit" value="Enviar" name="accion"></p>
        </form>

        <%
            if (alumnoMatriculado_al != null) {
        %>
        <center><table class="tabla" cellspacing="7">
            <tr>
                <td><b>Código</b></td>
                <td><b>Nombre</b></td>
                <td><b>Apellidos</b></td>
                <td><b>Fecha Nacimento</b></td>
                <td><b>Sexo(M/F)</b></td>
            </tr>
            <%
                for (int x = 0; x < alumnoMatriculado_al.size(); x++) {
                    Alumno a = alumnoMatriculado_al.get(x);
            %>
            <tr>
                <td><%=a.getCodigo()%></td>
                <td><%=a.getNombre()%></td>
                <td><%=a.getApellido()%></td>
                <td><%=a.getFechaNacimiento()%></td>
                <td><%=a.getSexo()%></td>
            </tr>
            <%
                }
            %>
        </table>
        </center>
        <%
            }
        %>
        <p class="error"><b><%=mensajeError%></b></p>
        <%
            }
        %>
    </div>
</div>