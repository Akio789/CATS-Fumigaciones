<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Añadir producto</title>
      <link rel="stylesheet" href="css/Ps.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
     <div id="box">
        <div class="w3-container" id="box2">
    <h1 id="titulo">Productos Servicio ${param.serviceToShow}</h1>
   <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Cantidad</th>
        </thead>
        <c:forEach items="${productsServices}" var="productService">
            <tr>
                <td>
                    <c:out value="${productService.productName}" />                
                </td>
                <td>
                    <c:out value="${productService.cantidad}" />
                </td>
            </tr>
        </c:forEach>
    </table>
	<form action="./services" method="POST">
        <input type="submit" value="Regresar" id="regresar">
    </form>
         </div>
    </div>
</body>
</html>