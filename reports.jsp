<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de servicios</title>
    <link rel="stylesheet" href="css/report.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
</head>
<body>
    <header>
        <div id="wrapper">
        <h1>CATS Fumigaciones</h1>
        <form action="./logout" method="POST">
            <input type="submit" value="Salir" id="salir">
        </form>
        </div>
        
        <div id="nav">
        <nav>
            <c:if test = "${sessionScope.isCurrentUserAdmin == 1}">
                <form action="./users">
                    <input type="submit" value="Usuarios" id="usuarios">    
                </form>
            </c:if>

            <form action="./services" method="POST">
                <input type="submit" value="Servicios" id="servicios">    
            </form>

            <form action="./products" method="POST">
                <input type="submit" value="Productos" id="productos">    
            </form>

            <form action="./fumigators">
                <input type="submit" value="Fumigadores" id="fumigadores">    
            </form>

            <form action="./client">
                <input type="submit" value="Clientes" id="clientes">    
            </form>

            <form action="./providers">
                <input type="submit" value="Proveedores" id="proveedores">
            </form>
            
            <form action="./reports">
		        <input type="submit" value="Reportes" id="reportes">
		    </form>
        </nav>
        </div>
    </header>

	    <div id="box">
            <div id="wrapper2">
            <center><h2>Reporte Ventas</h2></center>
            </div>
	   <center> <p id="sg">Servicios generados: ${serviceSize}</p></center> 
	    <center><p id="cts">Costo total servicios: ${serviceTotal} </p></center> 
	    <center><p id="ctp">Costo total productos: ${serviceCost} </p></center> 
    </div>
    </body>
</html>