<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de clientes</title>
</head>
<body>
    <h1>Clientes</h1>
    <a href="./registerClient.jsp">Registrar</a>
    <a href="./menu.jsp">Menú</a>
    <form action="./consultClient">
        Nombre: <input type="text" name="clientToConsult" />
        <input type="submit" value="Buscar">
    </form>

    <table border="1">
        <thead>
            <th>Id</th>
            <th>Telefono</th>
            <th>Direccion</th>
            <th>Correo</th>
        </thead>
        <c:forEach items="${client}" var="client">
            <tr>
                <td>
                    <c:out value="${client.nombre}" />                
                </td>
                <td>
                    <c:out value="${client.telefono}" />
                </td>
                <td>
                    <c:out value="${client.direccion}" />
                </td>
                <td>
                    <c:out value="${client.correo}" />
                </td>
                <td>
                    <form action="./modifyClient.jsp">
                        <input type="text" name="id" value="${client.id}" style="display: none;" />
                        <input type="text" name="nombre" value="${client.nombre}" style="display: none;" />
                        <input type="text" name="telefono" value="${client.telefono}" style="display: none;" />
                        <input type="text" name="direccion" value="${client.direccion}" style="display: none;" />
                        <input type="text" name="correo" value="${client.correo}" style="display: none;" />
                        <input type="submit" value="Modificar" />
                    </form>

                    <form action="./deleteClient.jsp">
                        <input type="text" name="clientToDeleteName" value="${product.nombre}" style="display: none;" />
                        <input type="text" name="clientToDeleteId" value="${product.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>