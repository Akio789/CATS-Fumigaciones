<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminación de producto</title>
    <link rel="stylesheet" href="css/delete.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <div id="box">
        <div class="w3-container">
    <h1 id="titulo">Eliminar producto</h1>
        </div>
        <div id="w3-container">
    <p id="ceromiedo">Estás seguro de eliminar al producto ${param.productToDeleteName}?</p>
        </div>
        <div class="w3-container">
            <div id="fondo">
    <form action="./products" method="POST">
        <input type="submit" value="No" id="nel">    
    </form>

    <form action="./deleteProduct" method="POST">
        <input type="text" name="productToDeleteId" value="${param.productToDeleteId}" style="display: none">
        <input type="submit" value="Si" id="simon">
    </form>
            </div>
        </div>
    </div>
</body>
</html>