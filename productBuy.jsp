<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventario</title>
</head>
<body>
    <h1>Producto ${param.nombre}</h1>
    <form action="./productBuy" method="POST">
        <input type="hidden" name="id" value="${param.id}">
        Cantidad: <input type="text" name="quantity" id="quantity" placeholder="100">
        <input type="submit" value="Aceptar">
    </form>

    <a href="./products">Regresar</a>
</body>
</html>