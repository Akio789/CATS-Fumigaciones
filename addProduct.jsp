<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Añadir producto</title>
     <link rel="stylesheet" href="css/Ap.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">s
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <div id="box">
        <div id="wrapper">
    <h1 id="titulo">Añadir producto</h1>
        </div>
              <div class="w3-container" id="box2">
    <form action="./addProduct" method="POST">
        <input type="text" name="id" style="display: none;" value=${param.serviceToAddId}>
        <p id="texto"> Producto:</p> 
        <select name="nombre_producto" id="product">
            <c:forEach items="${sessionScope.products}" var="product">
                <option value="${product.nombre}">${product.nombre}</option>
            </c:forEach>
        </select>
        <br>
        <p id="texto">Cantidad Utilizada:</p> <input type="text" name="cantidad" id="cantidad" placeholder="Cantidad utilizada" required>
        <br>
        <input type="submit" value="Registrar" id="registrar">
        <br>
		
    </form>
    <form action="./services">
            <input type="hidden" name="${sessionScope.fumigators}">
            <input type="submit" value="Regresar" id="regresar">
    </form>
        </div>
    </div>
</body>
</html>