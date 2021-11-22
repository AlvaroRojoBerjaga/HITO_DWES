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
    String codigo_gui = "";
    String mensajeError = "";
    String nra = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\alumno.txt";
    String nra2 = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\matricula.txt";
    String nra3 = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\curso.txt";
    List<Curso> cursos_al = Metodos.getListaCursoFromArchivo(nra3);
    List<Alumno> alumnos_al = Metodos.getListaAlumnosFromArchivo(nra);
    List<Matricula> matricula_al = Metodos.getListaMatriculas(nra2);
    List<String> listaAsignaturas_al = new ArrayList<String>();
    List<Curso> listaAsignaturasCurso_al = null;

    int creditosTotales = 0;
    String textoCreditos = "";

%>

<%    if (request.getParameter("accion") != null) {

        try {
            String codigo = request.getParameter("cboCodigo");
            if (!codigo.equalsIgnoreCase("Seleccionar")) {

                codigo_gui = codigo;

                boolean estaMatriculado = Metodos.estaMatriculado(matricula_al, codigo);
                if (estaMatriculado) {
                    for (int i = 0; i < matricula_al.size(); i++) {
                        if (codigo.equalsIgnoreCase(matricula_al.get(i).getCodigoAlumno())) {
                            listaAsignaturas_al.add(matricula_al.get(i).getCodigoClase());
                        }
                    }
                    listaAsignaturasCurso_al = new ArrayList<Curso>();
                    for (int j = 0; j < listaAsignaturas_al.size(); j++) {
                        for (int x = 0; x < cursos_al.size(); x++) {
                            if (listaAsignaturas_al.get(j).equalsIgnoreCase(cursos_al.get(x).getCodigoClase())) {

                                listaAsignaturasCurso_al.add(cursos_al.get(x));
                                creditosTotales = creditosTotales + cursos_al.get(x).getCreditos();
                                textoCreditos = "Créditos totales: " + creditosTotales;
                            }
                        }
                    }
                } else {
                    mensajeError = "Alumno no matriculado";
                }
            } else {
                mensajeError = "Debes seleccionar un alumno";
            }
        } catch (Exception e) {
            mensajeError = "Debes seleccionar un alumno";
        }
    }
%>

<div class="caja">
    <h2>Ver asignaturas y créditos de un alumno</h2>
    <div class="caja2">
        <form>
            <p>Selecciona un código:</p>
            <select name="cboCodigo" size="1">
                <option selected>Seleccionar</option>

                <%            for (int i = 0; i < alumnos_al.size(); i++) {
                        Alumno a = alumnos_al.get(i);
                        if (a.getCodigo().equalsIgnoreCase(codigo_gui)) {
                %>
                <option value="<%=a.getCodigo()%>" selected><%=a.getCodigo()%></option>

                <%
                } else {
                %>
                <option value="<%=a.getCodigo()%>"><%=a.getCodigo()%></option>
                <%
                        }
                    }
                %>
            </select>
            <input type="submit" name="accion" value="Buscar">
        </form>
        <%
            if (listaAsignaturasCurso_al != null) {
        %>
        <center><table class="tabla" cellspacing="7">
                <tr>
                    <td><b>Código clase</b></td>
                    <td><b>Nombre</b></td>
                    <td><b>Créditos</b></td>
                </tr>
                <%
                    for (int z = 0; z < listaAsignaturasCurso_al.size(); z++) {
                %>
                <tr>
                    <td><%=listaAsignaturasCurso_al.get(z).getCodigoClase()%></td>
                    <td><%=listaAsignaturasCurso_al.get(z).getNombre()%></td>
                    <td><%=listaAsignaturasCurso_al.get(z).getCreditos()%></td>
                </tr>
                <%
                    }
                %>
        </center></table>
        <%
            }
        %>
        <p><%=textoCreditos%></p>
        <p class="error"><b><%=mensajeError%></b></p>
    </div>
</div>