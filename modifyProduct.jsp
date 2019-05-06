<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificación de Producto</title>
    <link rel="stylesheet" href="css/modify.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
    <div id="box">
        <div id="wrapper">
    <h1 id="titulo">Modificar producto</h1>
            </div>
<div class="w3-container" id="box2">
    <form action="./modifyProduct" method="POST">
        <input type="text" name="id" value=${param.id} style="display: none;">
        <p id="texto">Nombre:</p> <input type="text" name="nombre" value="${param.nombre}">
        <br>
        <p id="texto">Costo:</p> <input type="text" name="costo" value="${param.costo}">
        <br>
        <p id="texto">Proveedor:</p> 
        <select name="nombre_proveedor" id="provider">
            <c:forEach items="${sessionScope.providers}" var="provider">
                <option value="${provider.nombre}">${provider.nombre}</option>
            </c:forEach>
        </select>

        <input type="submit" value="Aceptar" id="aceptar2">
        <a href="./products.jsp"id="regresar5">Regresar</a>
    </form>
        </div>
    </div>
</body>
</html>