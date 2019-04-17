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

    <form action="./services">
        <input type="submit" value="Servicios">    
    </form>

    <form action="./products">
        <input type="submit" value="Productos">    
    </form>

    <form action="./fumigators">
        <input type="submit" value="Fumigadores">    
    </form>

    <form action="./client">
        <input type="submit" value="Clientes">    
    </form>

    <form action="./providers">
        <input type="submit" value="Proveedores">
    </form>
</body>
</html>