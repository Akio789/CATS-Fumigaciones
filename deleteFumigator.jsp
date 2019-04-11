<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Eliminación de fumigador</title>
</head>
<body>
    <h1>Eliminar fumigador</h1>
    <p>Estás seguro de eliminar al fumigador ${param.fumigatorToDeleteName}?</p>
    <form action="./fumigators">
        <input type="submit" value="No">    
    </form>

    <form action="./deleteFumigator" method="GET">
        <input type="text" name="fumigatorToDeleteId" value="${param.fumigatorToDeleteId}" style="display: none">
        <input type="submit" value="Si">
    </form>
</body>
</html>