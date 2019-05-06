<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificación de usuario</title>
     <link rel="stylesheet" href="css/modify.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
    <div id="boxnene">
        <div id="wrapper">
    <h1 id="titulo2">Modificar usuario</h1>
            </div>
<div class="w3-container" id="box2">
    <form action="./modifyUser">
        <input type="text" name="id" value=${param.id} style="display: none;">
        <p id="texto"> Nombre: </p><input type="text" name="name" value=${param.name}>
        <br>
        <p id="texto">Username: </p><input type="text" name="username" value="${param.username}">
        <br>
        <p id="texto">Puesto: </p><input type="text" name="job" value="${param.job}">
        <br>
        <p id="texto">Número telefónico:</p> <input type="text" name="phoneNum" value="${param.phoneNum}">
        <br>
        <p id="texto">Email: </p><input type="text" name="email" value="${param.email}">
        <br>
        <p id="texto">Dirección:</p> <input type="text" name="address" value="${param.address}">

        <input type="submit" value="Aceptar" id="aceptar3">
    </form>
    <form action="./users">
            <input type="hidden" name="${sessionScope.fumigators}">
            <input type="submit" value="Regresar" id="regresar">
    </form>
              </div>
    </div>
</body>
</html>