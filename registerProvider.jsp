<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de proveedor</title>
</head>
<body>
    <h1>Registrar proveedor</h1>
    <form action="./registerProvider" method="GET">
        Nombre: <input type="text" name="nombre" id="nombre" placeholder="Nombre del proveedor" required>
        <br>
        Dirección: <input type="text" name="direccion" id="direccion" placeholder="Dirección" required>
        <br>
        Correo: <input type="text" name="correo" id="correo" placeholder="Email" required>
        <input type="submit" value="Registrar">
        <br>
        <a href="./providers.jsp">Regresar</a>
    </form>
</body>
</html>