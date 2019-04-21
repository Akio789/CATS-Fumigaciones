<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Añadir producto</title>
</head>
<body>
    <h1>Productos Servicio ${param.serviceToShow}</h1>
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
	<a href="./services.jsp">Regresar</a>
</body>
</html>