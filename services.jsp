<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de servicios</title>
    <link rel="stylesheet" href="css/service.css">
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

    <h2>Servicios</h2>
    <div id="intento">
   <center><a href="./preRegisterService.jsp" id="preregistrar">Pre-Registrar</a></center>
    </div>
    <br>
      <br>
      <br>
    <table border="1">
        <thead>
            <th>Costo</th>
            <th>Fecha</th>
            <th>Fumigador</th>
            <th>Cliente</th>
            <th>Productos</th>
            <th>Opciones</th>
        </thead>
        <c:forEach items="${services}" var="service">
            <tr>
                <td>
                    <c:out value="${service.costo}" />                
                </td>
                <td>
                    <c:out value="${service.fecha}" />
                </td>
                <td>
                    <c:out value="${service.nombreFumigador}" />
                </td>
                <td>
                    <c:out value="${service.nombreCliente}" />
                </td>
                <td>
                	<form action="./productsServices"">
                        <input type="text" name="serviceToShow" value="${service.id}" style="display: none;" />
                        <input type="submit" value="Mostrar productos" id="mostrar"/>
                    </form>
                </td>
                <td>
                    <form action="./modifyService.jsp">
                        <input type="text" name="id" value="${service.id}" style="display: none;" />
                        <input type="text" name="costo" value="${service.costo}" style="display: none;" />
                        <input type="text" name="fecha" value="${service.fecha}" style="display: none;" />
                        <input type="text" name="idFumigador" value="${service.idFumigador}" style="display: none;" />
                        <input type="text" name="idCliente" value="${service.idCliente}" style="display: none;" />
                        <input type="submit" value="Modificar" id=""modificar/>
                    </form>
                    
                    <form action="./addProduct.jsp" method="post">
                        <input type="text" name="serviceToAddId" value="${service.id}" style="display: none;" />
                        <input type="submit" value="Agregar Producto" id="agregar"/>
                    </form>

                    <form action="./deleteService.jsp">
                        <input type="text" name="serviceToDeleteId" value="${service.id}" style="display: none;" />
                        <input type="submit" value="Cancelar" id="cancelar" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>