<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modificación de Servicio</title>
</head>
<body>
    <h1>Modificar servicio</h1>

    <form action="./modifyService">
        <input type="text" name="id" value=${param.id} style="display: none;">
        Costo: <input type="text" name="costo" value="${param.costo}">
        <br>
        Fecha: <input type="text" name="fecha" value="${param.fecha}">
        <br>
        Fumigador: <input type="text" name="idFumigador" value="${param.idFumigador}">
        <br>
        Cliente: <input type="text" name="idCliente" value="${param.idCliente}">

        <input type="submit" value="Aceptar">
        <a href="./services.jsp">Regresar</a>
    </form>
</body>
</html>