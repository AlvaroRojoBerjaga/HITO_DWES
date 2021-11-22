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
    List<String> matriculadosPorAsignatura_as;
    List<Alumno> alumnoPorAsignatura_al;
    alumnoPorAsignatura_al = null;
    String asignatura_gui = "";
%>

<%    if (cursos_al != null) {
%>
<div class="caja">
    <h2>Alumnos de cada asignatura</h2>
    <div class="caja2">
        <form>
            <p><input type="submit" value="Ver alumnos" name="accion"></p>
        </form>

        <%    if (request.getParameter("accion") != null) {

                try {

                    for (int i = 0; i < cursos_al.size(); i++) {

                        String codigoClase = cursos_al.get(i).getCodigoClase();
                        String asignatura = cursos_al.get(i).getNombre();
                        matriculadosPorAsignatura_as = new ArrayList<String>();

                        for (int j = 0; j < matricula_al.size(); j++) {

                            if (codigoClase.equalsIgnoreCase(matricula_al.get(j).getCodigoClase())) {

                                matriculadosPorAsignatura_as.add(matricula_al.get(j).getCodigoAlumno());

                            }
                        }
                        alumnoPorAsignatura_al = new ArrayList<Alumno>();

                        for (int x = 0; x < matriculadosPorAsignatura_as.size(); x++) {
                            String codigoAlumnoMatricula = matriculadosPorAsignatura_as.get(x);
                            for (int z = 0; z < alumnos_al.size(); z++) {
                                String codigoAlumno = alumnos_al.get(z).getCodigo();
                                if (codigoAlumnoMatricula.equalsIgnoreCase(codigoAlumno)) {
                                    alumnoPorAsignatura_al.add(alumnos_al.get(z));
                                }
                            }
                        }
        %>
        <center>
            <h3><%=asignatura%></h3>
            <table class="tabla" cellspacing="7">
                <tr>
                    <td><b>Código</b></td>
                    <td><b>Nombre</b></td>
                    <td><b>Apellidos</b></td>
                    <td><b>Fecha Nacimento</b></td>
                    <td><b>Sexo(M/F)</b></td>
                </tr>
                <%
                    for (int w = 0; w < alumnoPorAsignatura_al.size(); w++) {
                        Alumno a = alumnoPorAsignatura_al.get(w);
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
                        } catch (Exception e) {
                            mensajeError = "No hay alumnos matriculados";
                        }
                    }
                %>
            
        <p class="error"><%=mensajeError%></p>  
    </div>
</div>
<%
    }
%>

