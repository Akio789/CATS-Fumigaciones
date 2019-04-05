<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registrar usuario</title>
</head>
<body>
    <h1>Registrar usuario</h1>
    <form action="./registerUser" method="GET">
        Cuenta: <input type="text" name="username" id="username" placeholder="Usuario" required>
        <br>
        Contraseña: <input type="password" name="password" id="password" placeholder="Contraseña" required>
        <br>
        Repetir Contraseña: <input type="password" name="password2" id="password2" placeholder="Constraseña" required>
        <br>
        Nombre: <input type="text" name="name" id="name" placeholder="Nombre" required>
        <br>
        Puesto: <input type="text" name="position" id="position" placeholder="Puesto" required>
        <br>
        Telefono: <input type="text" name="phoneNum" id="phoneNum" placeholder="Telefono" required>
        <br>
        Correo: <input type="email" name="email" id="email" placeholder="Correo electrónico" required>
        <br>
        Dirección: <input type="text" name="address" id="address" placeholder="Dirección" required>
        <br>
        <input type="submit" value="Registrar">
        <br>
        <a href="./index.html">Regresar</a>
    </form>
</body>
</html>