<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificación de Fumigador</title>
</head>
<body>
    <h1>Modificar Fumigador</h1>

    <form action="./modifyFumigator">
        <input type="text" name="id" value=${param.id} style="display: none;">
        Nombre: <input type="text" name="nombre" value="${param.nombre}">
        <br>
        Dirección: <input type="text" name="direccion" value="${param.direccion}">
        <br>
        Correo: <input type="text" name="correo" value="${param.correo}">

        <input type="submit" value="Aceptar">
        <a href="./fumigators">Regresar</a>
    </form>
</body>
</html>