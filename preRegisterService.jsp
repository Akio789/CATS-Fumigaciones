<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pre-Registro de servicio</title>
</head>
<body>
    <h1>Pre-Registrar Servicio</h1>
    <form action="./preRegisterService" method="GET">
        Costo: <input type="text" name="costo" id="costo" placeholder="Costo MXN del servicio" required>
        <br>
        Fecha: <input type="date" name="cant_disp" id="cant_disp" placeholder="Fecha del Servicio" required>
        <br>
        Fumigador: <input type="text" name="idFumigador" id="idFumigador" placeholder="Fumigador" required>
        <br>
        Cliente: <input type="text" name="idCliente" id="idCliente" placeholder="Cliente" required>
        <input type="submit" value="Pre-Registrar">
        <br>
        <a href="./services.jsp">Regresar</a>
    </form>
</body>
</html>