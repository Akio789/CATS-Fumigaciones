<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificación de Cliente</title>
    <link rel="stylesheet" href="css/modify.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
    <div id="box">
        <div id="wrapper">
    <h1 id="titulo">Modificar cliente</h1>
        </div>
<div class="w3-container" id="box2">
    <form action="./modifyClient">
        <input type="text" name="id" value=${param.id} style="display: none;">
        <p id="texto">Nombre:</p> <input type="text" name="nombre" value="${param.nombre}" id="nombre">
        <br>
        <p id="texto">Telefono:</p> <input type="text" name="telefono" value="${param.telefono}" id="telefono">
        <br>
        <p id="texto">Direccion:</p> <input type="text" name="direccion" value="${param.direccion}" id="direccion">
        <br>
        <p id="texto">Correo:</p><input type="text" name="correo" value="${param.correo}" id="correo"> 

        <input type="submit" value="Aceptar" id="aceptar">
      
        
           
    </form>

    <form action="./client">
            <input type="hidden" name="${sessionScope.fumigators}">
            <input type="submit" value="Regresar" id="regresar">
    </form>
        </div>
    </div>
</body>
</html>