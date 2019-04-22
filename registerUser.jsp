<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de usuario</title>
    <link rel="stylesheet" href="css/Register.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <div id="box3">
        <div class="w3-container" id="box2">
    <h1 id="titulo">Registrar usuario</h1>
    <form action="./registerUser" method="GET">
        <p id="texto">Cuenta: </p><input type="text" name="username" id="username" placeholder="Usuario" required>
        <br>
        <p id="texto">Contraseña: </p><input type="password" name="password" id="password" placeholder="Contraseña" required>
        <br>
        <p id="texto">Repetir Contraseña:</p> <input type="password" name="password2" id="password2" placeholder="Constraseña" required>
        <br>
        <p id="texto">Nombre: </p><input type="text" name="name" id="name" placeholder="Nombre" required>
        <br>
        <p id="texto">Puesto: </p><input type="text" name="position" id="position" placeholder="Puesto" required>
        <br>
        <p id="texto">Telefono: </p><input type="text" name="phoneNum" id="phoneNum" placeholder="Telefono" required>
        <br>
        <p id="texto">Correo:</p> <input type="email" name="email" id="email" placeholder="Correo electrónico" required>
        <br>
        <p id="texto">Dirección:</p> <input type="text" name="address" id="address" placeholder="Dirección" required>
        <br>
        <input type="submit" value="Registrar" id="registrar3">
        <br>
        <a href="./users.jsp" id="regresar5">Regresar</a>
    </form>
        </div>
    </div>
</body>
</html>