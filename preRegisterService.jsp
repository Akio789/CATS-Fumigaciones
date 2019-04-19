<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pre-Registro de servicio</title>
</head>
<body>
    <h1>Pre-Registrar Servicio</h1>
    <form action="./preRegisterService" method="POST">
        Costo: <input type="text" name="costo" id="costo" placeholder="Costo MXN del servicio" required>
        <br>
        Fecha: <input type="text" name="fecha" id="fecha" placeholder="Fecha del Servicio" required>
        <br>
        Fumigador: 
        <select name="nombre_fumigador" id="fumigator">
            <c:forEach items="${sessionScope.fumigators}" var="fumigator">
                <option value="${fumigator.nombre}">${fumigator.nombre}</option>
            </c:forEach>
        </select>
        <br>
        Cliente: 
        <select name="nombre_cliente" id="cliente">
            <c:forEach items="${sessionScope.cliente}" var="cliente">
                <option value="${cliente.nombre}">${cliente.nombre}</option>
            </c:forEach>
        </select>
        <br>
        <br>
    </form>
    <form action="./products.jsp">
            <input type="hidden" name="${fumigators}">
            <input type="submit" value="Regresar">
    </form>
</body>
</html>