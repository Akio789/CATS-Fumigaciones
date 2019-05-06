<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inventario</title>
    <link rel="stylesheet" href="css/buy.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
    <div id="box">
        <div id="wrapper">
    <h1 id="titulo">Producto ${param.nombre}</h1>
        </div>
        
             <div class="w3-container" id="box2">
    <form action="./productBuy" method="POST">
        <input type="hidden" name="id" value="${param.id}">
        <p id="texto">Cantidad:</p> <input type="text" name="quantity" id="quantity" placeholder="100">
        <input type="submit" value="Aceptar" id="aceptar">
    </form>

    <form action="./products" method="POST">
        <input type="submit" value="Regresar" id="regresar">
    </form>
        </div>
    </div>
</body>
</html>