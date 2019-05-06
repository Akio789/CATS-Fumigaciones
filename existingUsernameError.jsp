<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error de registro</title>
     <link rel="stylesheet" href="css/error.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
     <div id="box">
        <div class="w3-container" id="wrapper">
    <h1>El username ingresado ya está en uso</h1>
            <div id="intento">
    <center><a href="${lastPageForSuccess}" id="regresar">Regresar</a></center>
            </div>
         </div>
    </div>
</body>
</html>