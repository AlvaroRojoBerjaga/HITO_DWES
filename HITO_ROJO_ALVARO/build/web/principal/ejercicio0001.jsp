<%@page import="misrc.*"%>
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
</style>
<%
    String codigo_gui = "";
    String nombre_gui = "";
    String apellido_gui = "";
    String fecha_gui = "";
    String sexo_gui = "";
    String mensajeError="";
    String nra = "C:\\Users\\Campus FP\\Documents\\NetBeansProjects\\HITO_ROJO_ALVARO\\datos\\alumno.txt";
    List<Alumno> alumnos_al = Metodos.getListaAlumnosFromArchivo(nra);
%>

<%
    if (request.getParameter("accion") != null) {
        try{         
        
        String codigo = request.getParameter("cboCodigo");
        Alumno alumno = Metodos.getAlumno(codigo, alumnos_al);
        codigo_gui = alumno.getCodigo();
        nombre_gui = alumno.getNombre();
        apellido_gui = alumno.getApellido();
        fecha_gui = alumno.getFechaNacimiento();
        sexo_gui = String.valueOf(alumno.getSexo());
        
        } catch (Exception e){
            mensajeError="No has seleccionado ningún código";
        }
    }
%>

<%
    if (alumnos_al != null) {
%>

<div class="caja">
    <h2>Buscar alumno por código</h2>
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
        <input type="text" value="<%=nombre_gui%>" placeholder="Nombre">
        <input type="text" value="<%=apellido_gui%>" placeholder="Apellido">
        <input type="text" value="<%=fecha_gui%>" placeholder="Fecha de nacimiento">
        <input type="texr" value="<%=sexo_gui%>" placeholder="Sexo (M/F)">
        <p class="error"><b><%=mensajeError%></b></p>
        <%
            }
        %>
    </div>
</div>