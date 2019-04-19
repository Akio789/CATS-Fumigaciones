<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
</head>
<body>
    <h1>Registro exitoso!</h1>
    <form action="${lastPageForSuccess}" method="${method}">
        <input type="submit" value="Regresar">    
    </form>

</body>
</html>