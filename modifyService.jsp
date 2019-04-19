<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificación de Servicio</title>
</head>
<body>
    <h1>Modificar servicio</h1>

    <form action="./modifyService" method="POST">
        <input type="text" name="id" value=${param.id} style="display: none;">
        Costo: <input type="text" name="costo" value="${param.costo}">
        <br>
        Fecha: <input type="text" name="fecha" value="${param.fecha}">
        <br>
        Fumigador: 
        <select name="nombre_fumigador" id="fumigator">
            <c:forEach items="${sessionScope.fumigators}" var="fumigator">
                <option value="${fumigator.nombre}">${fumigator.nombre}</option>
            </c:forEach>
        </select>
        <br>
        Cliente: 
        <select name="nombre_cliente" id="client">
            <c:forEach items="${sessionScope.clients}" var="client">
                <option value="${client.nombre}">${client.nombre}</option>
            </c:forEach>
        </select>

        <input type="submit" value="Aceptar">
        <a href="./services.jsp">Regresar</a>
    </form>
</body>
</html>