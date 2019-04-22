<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificación de Servicio</title>
    <link rel="stylesheet" href="css/modify.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
     <div id="box">
        <div class="w3-container">
    <h1 id="titulo">Modificar servicio</h1>
         </div>
         <div class="w3-container" id="box2">
    <form action="./modifyService" method="POST">
        <input type="text" name="id" value=${param.id} style="display: none;">
        <p id="texto">Costo: </p><input type="text" name="costo" value="${param.costo}">
        <br>
        <p id="texto">Fecha: </p><input type="date" name="fecha" value="${param.fecha}">
        <br>
        <p id="texto"> Fumigador:</p> 
        <select name="nombre_fumigador" id="fumigator">
            <c:forEach items="${sessionScope.fumigators}" var="fumigator">
                <option value="${fumigator.nombre}">${fumigator.nombre}</option>
            </c:forEach>
        </select>
        <br>
        <p id="texto">Cliente:</p> 
        <select name="nombre_cliente" id="cliente">
            <c:forEach items="${sessionScope.clients}" var="client">
                <option value="${client.nombre}">${client.nombre}</option>
            </c:forEach>
        </select>

        <input type="submit" value="Aceptar" id="aceptar4">
        <a href="./services.jsp" id="regresar">Regresar</a>
    </form>
         </div>
    </div>
</body>
</html>