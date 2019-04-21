<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bienvenido a CATS Fumigaciones</title>
    <link rel="stylesheet" href="css/menu.css"<>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <h1>Bienvenido al sistema de CATS Fumigaciones</h1>
        <c:if test = "${sessionScope.isCurrentUserAdmin == 1}">
            <form action="./users">
                <input type="submit" value="Usuarios" id="usuarios">    
            </form>
        </c:if>

    <form action="./services">
        <input type="submit" value="Servicios" id="servicios">    
    </form>

    <form action="./products" method="POST">
        <input type="submit" value="Productos" id="productos">    
    </form>

    <form action="./fumigators">
        <input type="submit" value="Fumigadores" id="fumigadores">    
    </form>

    <form action="./client">
        <input type="submit" value="Clientes" id="clientes">    
    </form>

    <form action="./providers">
        <input type="submit" value="Proveedores" id="proveedores">
    </form>
    <img src="img/logo.jpeg" id="logo">
</body>
</html>