<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminación de usuario</title>
</head>
<body>
    <h1>Eliminar usuario</h1>
    <p>Estás seguro de eliminar al usuario ${param.userToDeleteUsername}?</p>
    <form action="./users">
        <input type="submit" value="No">    
    </form>

    <a href="delUser?userToDeleteId=${param.userToDeleteId}">Si</a>
</body>
</html>