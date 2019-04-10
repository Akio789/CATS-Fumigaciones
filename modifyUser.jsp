<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificación de usuario</title>
</head>
<body>
    <h1>Modificar usuario</h1>

    <form action="./modifyUser">
        <input type="text" name="id" value=${param.id} style="display: none;">
        Nombre: <input type="text" name="name" value=${param.name}>
        <br>
        Username: <input type="text" name="username" value="${param.username}">
        <br>
        Puesto: <input type="text" name="job" value="${param.job}">
        <br>
        Número telefónico: <input type="text" name="phoneNum" value="${param.phoneNum}">
        <br>
        Email: <input type="text" name="email" value="${param.email}">
        <br>
        Dirección: <input type="text" name="address" value="${param.address}">

        <input type="submit" value="Aceptar">
        <a href="./users.jsp">Regresar</a>
    </form>
</body>
</html>