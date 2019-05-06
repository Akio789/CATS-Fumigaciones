<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de proveedor</title>
    <link rel="stylesheet" href="css/Register.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <div id="box">
        <div id="wrapper">
    <h1 id="titulo">Registrar proveedor</h1>
        </div>
             <div class="w3-container" id="box2">
    <form action="./registerProvider" method="GET">


    	<input type="text" name="userId" style="display: none;" value="${sessionScope.currentUserId}">
         <p id="texto">Nombre:</p><input type="text" name="nombre" id="nombre" placeholder="Nombre del proveedor" required>
        <br>
        <p id="texto">Dirección:</p> <input type="text" name="direccion" id="direccion" placeholder="Dirección" required>
        <br>
        <p id="texto">Correo:</p> <input type="text" name="correo" id="correo" placeholder="Email" required>
        <input type="submit" value="Registrar" id="registrar">
        <br>
    </form>
    <form action="./providers">
            <input type="hidden" name="${sessionScope.fumigators}">
            <input type="submit" value="Regresar" id="regresar">
    </form>
        </div>
    </div>
</body>
</html>