<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de producto</title>
</head>
<body>
    <h1>Registrar producto</h1>
    <form action="./registerProduct" method="POST">
        Nombre: <input type="text" name="nombre" id="nombre" placeholder="Nombre del producto" required>
        <br>
        Costo: <input type="text" name="costo" id="costo" placeholder="Costo MXN" required>
        <br>
        Cantidad inicial: <input type="text" name="cant_disp" id="cant_disp" placeholder="Cantidad" required>
        <br>
        Descripción: <input type="text" name="descr" id="descr" placeholder="Describa el producto" required>
        <br>
        Proveedor: 
        <select name="nombre_proveedor" id="provider">
            <c:forEach items="${sessionScope.providers}" var="provider">
                <option value="${provider.nombre}">${provider.nombre}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Registrar">
        <br>
    </form>
    <form action="./products" method="POST">
            <input type="hidden" name="${sessionScope.providers}">
            <input type="submit" value="Regresar">
    </form>
</body>
</html>