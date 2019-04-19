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
        <c:forEach items="${services}" var="services">
            <tr>
                <td>
                    <c:out value="${services.costo}" />                
                </td>
                <td>
                    <c:out value="${services.fecha}" />
                </td>
                <td>
                    <c:out value="${services.idFumigador}" />
                </td>
                <td>
                    <c:out value="${services.idCliente}" />
                </td>
                <td>
                    <form action="./modifyService.jsp">
                        <input type="text" name="id" value="${services.id}" style="display: none;" />
                        <input type="text" name="costo" value="${services.costo}" style="display: none;" />
                        <input type="text" name="fecha" value="${services.fecha}" style="display: none;" />
                        <input type="text" name="idFumigador" value="${services.idFumigador}" style="display: none;" />
                        <input type="text" name="idCliente" value="${services.idCliente}" style="display: none;" />
                        <input type="submit" value="Modificar" />
                    </form>

                    <form action="./deleteService.jsp">
                        <input type="text" name="serviceToDeleteId" value="${services.id}" style="display: none;" />
                        <input type="submit" value="Cancelar" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>