<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cancelación de servicio</title>
</head>
<body>
    <h1>Cancelar Servicio</h1>
    <p>Estás seguro cancelar el servicio?</p>
    <form action="./services">
        <input type="submit" value="No">    
    </form>

    <form action="./deleteService" method="POST">
        <input type="text" name="serviceToDeleteId" value="${param.serviceToDeleteId}" style="display: none">
        <input type="submit" value="Si">
    </form>
</body>
</html>