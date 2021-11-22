<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            a{
                text-decoration: none;
                color: blue;
            }
            .t{
                color: black;
            }
            .caja{
                border: solid blue 2px;
                background-color: azure;
                margin-right: 400px;
                margin-left: 400px;
                padding: 10px;
            }
            h2{
                text-align: center;
                margin-top: 30px;
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body>
        <h2>HITO 1 - TRABAJAR CON ALUMNOS</h2> 
        <div class="caja">
            <table>
                <tr><td><a href='ejercicio0001.jsp' target="myframe"><span class="t">01. </span>Seleccionar un código de un combobox y mostrar los datos de dicho alumno.</a></td></tr>
                <tr><td><a href='ejercicio0002.jsp' target="myframe"><span class="t">02. </span>Seleccionar una fecha de un combobox y se mostrará todos los alumnos matriculados en dicha fecha.</a></td></tr>
                <tr><td><a href='ejercicio0003.jsp' target="myframe"><span class="t">03. </span>Seleccionar dos fechas de combobox y se mostrará todos los alumnos matriculados entre dichas fechas.</a></td></tr>
                <tr><td><a href='ejercicio0004.jsp' target="myframe"><span class="t">04. </span>Seleccionar una asignatura de un botonradio y mostrará todos los alumnos matriculados en dicha asignatura.</a></td></tr>
                <tr><td><a href='ejercicio0005.jsp' target="myframe"><span class="t">05. </span>Seleccionar un código de alumno de un combobox y mostrará las asignaturas en la que está matriculado dicho alumno con los créditos de cada asignatura y el total de créditos matriculados.</a></td></tr>
                <tr><td><a href='ejercicio0006.jsp' target="myframe"><span class="t">06. </span>Mostrar todos los alumnos que no se han matriculado en ninguna asignatura.</a></td></tr>
                <tr><td><a href='ejercicio0007.jsp' target="myframe"><span class="t">07. </span>Mostrar todos los alumnos que son menor de edad y estén matriculados.</a></td></tr>
                <tr><td><a href='ejercicio0008.jsp' target="myframe"><span class="t">08. </span>Seleccionar una o más asignaturas de checkbox y mostrar los datos de dichas asignaturas, es decir, código y sus créditos.</a></td></tr>
                <tr><td><a href='ejercicio0009.jsp' target="myframe"><span class="t">09. </span>Seleccionar un curso de un combobox y se mostrará todos los alumnos matriculados en dicho curso.</a></td></tr>
                <tr><td><a href='ejercicio0010.jsp' target="myframe"><span class="t">10. </span>Mostrar un listado de los alumnos matriculados en cada uno de los cursos.</a></td></tr>
                <tr><td><a href='ejercicio0011.jsp' target="myframe"><span class="t">11. </span>Mostrar los alumnos que hayan nacido en un año bisiesto.</a></td></tr>
                <tr><td><a href='javascript:close()'><span class="t">00. </span>Salir</a></td></tr>  
            </table>
        </div>

    </body>
</html>