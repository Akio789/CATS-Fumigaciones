<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de servicios</title>
    <link rel="stylesheet" href="css/service.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <header>
        <div class="w3-container">
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
        </nav>
        </div>
    </header>

    <div class="w3-container">
    <h1>Servicios</h1>
    <a href="./preRegisterService.jsp">Pre-Registrar</a>
    
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
                        <input type="submit" value="Mostrar productos" />
                    </form>
                </td>
                <td>
                    <form action="./modifyService.jsp">
                        <input type="text" name="id" value="${service.id}" style="display: none;" />
                        <input type="text" name="costo" value="${service.costo}" style="display: none;" />
                        <input type="text" name="fecha" value="${service.fecha}" style="display: none;" />
                        <input type="text" name="idFumigador" value="${service.idFumigador}" style="display: none;" />
                        <input type="text" name="idCliente" value="${service.idCliente}" style="display: none;" />
                        <input type="submit" value="Modificar" />
                    </form>
                    
                    <form action="./addProduct.jsp" method="post">
                        <input type="text" name="serviceToAddId" value="${service.id}" style="display: none;" />
                        <input type="submit" value="Agregar Producto" />
                    </form>

                    <form action="./deleteService.jsp">
                        <input type="text" name="serviceToDeleteId" value="${service.id}" style="display: none;" />
                        <input type="submit" value="Cancelar" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>