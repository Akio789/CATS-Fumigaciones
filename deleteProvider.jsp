<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminación de proveedor</title>
    <link rel="stylesheet" href="css/delete.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
    <div id="box">
        <div class="w3-container" id="wrapper">
    <h1 id="titulo">Eliminar proveedor</h1>
        </div>
        <div class="w3-container">
    <p id="ceromiedo">Estás seguro de eliminar al proveedor ${param.providerToDeleteName}?</p>
        </div>
        <div class="w3-container">
            <div class="fondo">
    <form action="./providers">
        <input type="submit" value="No" id="nel">    
    </form>

    <form action="./deleteProvider" method="GET">
        <input type="text" name="providerToDeleteId" value="${param.providerToDeleteId}" style="display: none">
        <input type="submit" value="Si" id="simon">
    </form>
            </div>
        </div>
    </div>
</body>
</html>