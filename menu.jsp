<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bienvenido a CATS Fumigaciones</title>
</head>
<body>
    <h1>Bienvenido al sistema de CATS Fumigaciones</h1>
    <form action="./users">
        <input type="submit" value="Usuarios">    
    </form>

    <a href="./services.jsp">Servicios</a>
    <a href="./products.jsp">Productos</a>
    <a href="./fumigators.jsp">Fumigadores</a>
    <a href="./clients.jsp">Clientes</a>
</body>
</html>