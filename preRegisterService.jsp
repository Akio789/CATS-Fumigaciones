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
        Fecha: <input type="date" name="fecha" id="fecha" placeholder="Fecha del Servicio" required>
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
        <br>
        Tipos de productos: <input type="text" name="length" id="length" placeholder="Número de productos en el servico" required>
        
        <br>
        Producto utilizado: 
        <select name="nombre_product" id="product">
            <c:forEach items="${sessionScope.products}" var="product">
                <option value="${product.nombre}">${product.nombre}</option>
            </c:forEach>
        </select>
        <br>
        <input type="submit" value="Pre-Registrar">
        <br>
    </form>
    <form action="./products" method="POST">
            <input type="hidden" name="${sessionScope.fumigators}">
            <input type="submit" value="Regresar">
    </form>
</body>
</html>