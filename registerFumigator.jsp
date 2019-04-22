<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de fumigador</title>
      <link rel="stylesheet" href="css/Register.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
     <div id="box">
        <div class="w3-container" id="box2">
    <h1 id="titulo">Registrar fumigador</h1>
    <form action="./registerFumigator" method="GET">  
        <p id="texto">  Nombre: </p><input type="text" name="nombre" id="nombre" placeholder="Nombre del fumigador" required>
        <br>
        <p id="texto"> Dirección: </p><input type="text" name="direccion" id="direccion" placeholder="Dirección" required>
        <br>
        <p id="texto"> Correo: </p><input type="text" name="correo" id="correo" placeholder="Email" required>
        <input type="submit" value="Registrar" id="registrar">
        <br>
        <a href="./fumigators" id="regresar2">Regresar</a>
    </form>
         </div>
    </div>
</body>
</html>