<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error de registro</title>
     <link rel="stylesheet" href="css/Register.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
     <div id="box">
        <div class="w3-container" id="box2">
    <h1 id="titulo">Hubo un error de llenado de la forma.</h1>
            <div id="box3">
    <a href="${lastPageForFailure}" id="regresarR">Regresar a registro</a>
    <br>
    <a href="./menu.jsp" id="regresarM">Regresar al menú</a>
            </div>
         </div>
    </div>
</body>
</html>