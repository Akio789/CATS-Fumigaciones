<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pre-Registro de servicio</title>
    <link rel="stylesheet" href="css/preregister.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <div id="box">
        <div class="w3-container">
    <h1 id="titulo">Pre-Registrar Servicio</h1>
        </div>
        <div class="w3-container" id="box2">
    <form action="./preRegisterService" method="POST">
        <p id="texto">Costo:</p> <input type="text" name="costo" id="costo" placeholder="Costo MXN del servicio" required id="cuadro">
        <br>
        <p id="texto">Fecha:</p> <input type="date" name="fecha" id="fecha" placeholder="Fecha del Servicio" required id="cuadro">
        <br>
        <p id="texto">Fumigador:</p> 
        <select name="nombre_fumigador" id="opcion">
            <c:forEach items="${sessionScope.fumigators}" var="fumigator">
                <option value="${fumigator.nombre}">${fumigator.nombre}</option>
            </c:forEach>
        </select>
        <br>
        <p id="texto">Cliente:</p> 
        <select name="nombre_cliente" id="opcion2">
            <c:forEach items="${sessionScope.clients}" var="client">
                <option value="${client.nombre}" >${client.nombre}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Pre-Registrar" id="preregistrar">
        <br>
    </form>
    <form action="./products" method="POST">
            <input type="hidden" name="${sessionScope.fumigators}">
            <input type="submit" value="Regresar" id="regresar">
                </form>
        
        </div>
    </div>
</body>
</html>