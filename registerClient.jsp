<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de Cliente</title>
</head>
<body>
    <h1>Registrar cliente</h1>
    <form action="./registerClient" method="GET">
        Nombre: <input type="text" name="nombre" id="nombre" placeholder="Nombre" required>
        <br>
        Telefono: <input type="text" name="telefono" id="telefono" placeholder="No. Telefonico" required>
        <br>
        Direccion: <input type="text" name="direccion" id="direccion" placeholder="Direccion" required>
        <br>
        Correo: <input type="text" name="correo" id="correo" placeholder="Correo Electronico" required>
        <input type="submit" value="Registrar">        
        <br>
        <a href="./products.jsp">Regresar</a>
    </form>
</body>
</html>