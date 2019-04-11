<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminación de proveedor</title>
</head>
<body>
    <h1>Eliminar proveedor</h1>
    <p>Estás seguro de eliminar al proveedor ${param.providerToDeleteName}?</p>
    <form action="./providers">
        <input type="submit" value="No">    
    </form>

    <form action="./deleteProvider" method="GET">
        <input type="text" name="providerToDeleteId" value="${param.providerToDeleteId}" style="display: none">
        <input type="submit" value="Si">
    </form>
</body>
</html>