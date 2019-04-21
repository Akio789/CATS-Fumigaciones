<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Añadir producto</title>
</head>
<body>
    <h1>Añadir producto</h1>
    <form action="./addProduct" method="POST">
        <input type="text" name="id" style="display: none;" value=${param.serviceToAddId}>
        Producto: 
        <select name="nombre_producto" id="product">
            <c:forEach items="${sessionScope.products}" var="product">
                <option value="${product.nombre}">${product.nombre}</option>
            </c:forEach>
        </select>
        <br>
        Cantidad Utilizada: <input type="text" name="cantidad" id="cantidad" placeholder="Cantidad utilizada" required>
        <br>
        <input type="submit" value="Registrar">
        <br>
		<a href="./services.jsp">Regresar</a>
    </form>
</body>
</html>