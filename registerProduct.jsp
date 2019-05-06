<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de producto</title>
    <link rel="stylesheet" href="css/Register.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
     <div id="box">
        <div id="wrapper">
    <h1 id="titulo">Registrar producto</h1>
         </div>
             <div class="w3-container" id="box2">
    <form action="./registerProduct" method="POST">
    	<input type="text" name="userId" style="display: none;" value="${sessionScope.currentUserId}">
        <p id="texto">Nombre:</p> <input type="text" name="nombre" id="nombre" placeholder="Nombre del producto" required>
        <br>
        <p id="texto">Costo: </p><input type="text" name="costo" id="costo" placeholder="Costo MXN" required>
        <br>
        <p id="texto">Cantidad inicial:</p> <input type="text" name="cant_disp" id="cant_disp" placeholder="Cantidad" required>
        <br>
        <p id="texto">Descripción: </p><input type="text" name="descr" id="descr" placeholder="Describa el producto" required>
        <br>
        <p id="texto">Proveedor: </p>
        <select name="nombre_proveedor" id="provider">
            <c:forEach items="${sessionScope.providers}" var="provider">
                <option value="${provider.nombre}">${provider.nombre}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Registrar" id="registrar2">
        <br>
    </form>
    <form action="./products" method="POST">
            <input type="hidden" name="${sessionScope.providers}">
            <input type="submit" value="Regresar" id="regresar3">
    </form>
         </div>
    </div>
</body>
</html>