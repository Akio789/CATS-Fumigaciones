<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminación de Cliente</title>
</head>
<body>
    <h1>Eliminar cliente</h1>
    <p>Estás seguro de eliminar al cliente ${param.clientToDeleteName}?</p>
    <form action="./client">
        <input type="submit" value="No">    
    </form>

    <form action="./deleteClient" method="GET">
        <input type="text" name="clientToDeleteId" value="${param.clientToDeleteId}" style="display: none">
        <input type="submit" value="Si">
    </form>
</body>
</html>