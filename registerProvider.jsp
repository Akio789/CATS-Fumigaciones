<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de proveedor</title>
    <link rel="stylesheet" href="css/Register.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <div id="box">
        <div class="w3-container" id="box2">
    <h1 id="titulo">Registrar proveedor</h1>
    <form action="./registerProvider" method="GET">
        <p id="texto">Nombre: </p><input type="text" name="nombre" id="nombre" placeholder="Nombre del proveedor" required>
        <br>
        <p id="texto">Dirección:</p> <input type="text" name="direccion" id="direccion" placeholder="Dirección" required>
        <br>
        <p id="texto">Correo:</p> <input type="text" name="correo" id="correo" placeholder="Email" required>
        <input type="submit" value="Registrar" id="registrar">
        <br>
        <a href="./providers.jsp" id="regresar2">Regresar</a>
    </form>
        </div>
    </div>
</body>
</html>