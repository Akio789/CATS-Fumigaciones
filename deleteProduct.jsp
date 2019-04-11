<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminación de producto</title>
</head>
<body>
    <h1>Eliminar producto</h1>
    <p>Estás seguro de eliminar al producto ${param.productToDeleteName}?</p>
    <form action="./products">
        <input type="submit" value="No">    
    </form>

    <form action="./deleteProduct" method="GET">
        <input type="text" name="productToDeleteId" value="${param.productToDeleteId}" style="display: none">
        <input type="submit" value="Si">
    </form>
</body>
</html>