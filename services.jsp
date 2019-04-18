<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de servicios</title>
</head>
<body>
    <h1>Servicios</h1>
    <a href="./preRegisterService.jsp">Pre-Registrar</a>
    <a href="./menu.jsp">Menú</a>
    
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