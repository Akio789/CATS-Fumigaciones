<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminación de Cliente</title>
    <link rel="stylesheet" href="css/delete.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
</head>
<body>
    <div id="box">
    <div class="w3-container" id="wrapper">
    <h1 id="titulo">Eliminar cliente</h1>
    </div>
    <div class="w3-container">
    <p id="ceromiedo">Estás seguro de eliminar al cliente ${param.clientToDeleteName}?</p>
    </div>
    <div class="w3-container">
        <div id="fondo">
    <form action="./client">
        <input type="submit" value="No" id="nel">    
    </form>

    <form action="./deleteClient" method="GET">
        <input type="text" name="clientToDeleteId" value="${param.clientToDeleteId}" style="display: none">
        <input type="submit" value="Si" id="simon">
    </form>
        </div>
    </div>
    </div>
</body>
</html>