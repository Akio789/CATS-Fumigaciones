<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
     <link rel="stylesheet" href="css/Register.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
     <div id="box">
        <div class="w3-container" id="box2">
    <h1 id="titulo">Registro exitoso!</h1>
    <form action="${lastPageForSuccess}" method="${method}">
        <input type="submit" value="Regresar" id="regresar4">    
    </form>
         </div>
    </div>
</body>
</html>