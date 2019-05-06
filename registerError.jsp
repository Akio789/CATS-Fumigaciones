<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error de registro</title>
     <link rel="stylesheet" href="css/Register.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
     <div id="boxerror">
        <div class="w3-container" id="box2">
    <h1>Hubo un error de llenado de la forma.</h1>
            <br>
            <br>
            <br>
            <div id="intento">
   <center><a href="${lastPageForFailure}" id="regresarR">Regresar a registro</a></center>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
          
            <div id="intento">
    <center><a href="${lastPageForSuccess}" id="regresarM">Regresar al menú</a></center>
            </div>
         </div>
    </div>
</body>
</html>