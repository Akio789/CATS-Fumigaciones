<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error de registro</title>
</head>
<body>
    <p>Hubo un error de llenado de la forma.</p>
    <a href="${lastPageForFailure}">Regresar a registro</a>
    <br>
    <a href="./menu.jsp">Regresar al menú</a>
</body>
</html>