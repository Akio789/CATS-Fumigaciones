<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificación de Producto</title>
</head>
<body>
    <h1>Modificar producto</h1>

    <form action="./modifyProduct" method="POST">
        <input type="text" name="id" value=${param.id} style="display: none;">
        Nombre: <input type="text" name="nombre" value="${param.nombre}">
        <br>
        Costo: <input type="text" name="costo" value="${param.costo}">
        <br>
        Proveedor: <input type="text" name="idProveedor" value="${param.idProveedor}">

        <input type="submit" value="Aceptar">
        <a href="./products.jsp">Regresar</a>
    </form>
</body>
</html>