<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de servicios</title>
</head>
<body>
    <header>
        <h2>CATS Fumigaciones</h2>
        <nav>
            <form action="./users">
                <input type="submit" value="Usuarios">    
            </form>

            <form action="./services" method="POST">
                <input type="submit" value="Servicios">    
            </form>

            <form action="./products" method="POST">
                <input type="submit" value="Productos">    
            </form>

            <form action="./fumigators">
                <input type="submit" value="Fumigadores">    
            </form>

            <form action="./client">
                <input type="submit" value="Clientes">    
            </form>

            <form action="./providers">
                <input type="submit" value="Proveedores">
            </form>
        </nav>
    </header>

    <h1>Servicios</h1>
    <a href="./preRegisterService.jsp">Pre-Registrar</a>
    
    <table border="1">
        <thead>
            <th>Costo</th>
            <th>Fecha</th>
            <th>Fumigador</th>
            <th>Cliente</th>
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
                    <c:out value="${service.idFumigador}" />
                </td>
                <td>
                    <c:out value="${service.nombreCliente}" />
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