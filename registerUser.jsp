<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registrar usuario</title>
</head>
<body>
    <form action="./registerUser" method="GET">
        Cuenta: <input type="text" name="username" id="username" placeholder="Usuario" required>
        Contraseña: <input type="password" name="password" id="password" placeholder="Contraseña" required>
        Repetir Contraseña: <input type="password" name="password2" id="password2" placeholder="Constraseña" required>
        Nombre: <input type="text" name="name" id="name" placeholder="Nombre" required>
        Puesto: <input type="text" name="position" id="position" placeholder="Puesto" required>
        Telefono: <input type="text" name="phoneNum" id="phoneNum" placeholder="Telefono" required>
        Correo: <input type="email" name="email" id="email" placeholder="Correo electrónico" required>
        Dirección: <input type="text" name="address" id="address" placeholder="Dirección" required>
        <input type="submit" value="Registrar">
    </form>
</body>
</html>