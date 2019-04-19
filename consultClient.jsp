<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de clientes</title>
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

    <h1>Cliente consultado</h1>
    <a href="./client.jsp">Regresar a clientes</a>
    <form action="./consultClient">
        Nombre: <input type="text" name="clientToConsult" />
        <input type="submit" value="Buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Telefono</th>
            <th>Dirección</th>
            <th>Correo</th>
        </thead>
        <c:forEach items="${client}" var="clientItem">
            <tr>
                <td>
                    <c:out value="${clientItem.nombre}" />                
                </td>
                <td>
                    <c:out value="${clientItem.telefono}" />
                </td>
                <td>
                    <c:out value="${clientItem.direccion}" />
                </td>
                <td>
                    <c:out value="${clientItem.correo}" />
                </td>
                <td>
                    <form action="./modifyClient.jsp">
                        <input type="text" name="id" value="${clientItem.id}" style="display: none;" />
                        <input type="text" name="nombre" value="${clientItem.nombre}" style="display: none;" />
                        <input type="text" name="telefono" value="${clientItem.telefono}" style="display: none;" />
                        <input type="text" name="direccion" value="${clientItem.direccion}" style="display: none;" />
                        <input type="text" name="correo" value="${clientItem.correo}" style="display: none;" />
                        <input type="submit" value="Modificar" />
                    </form>

                    <form action="./consultClient.jsp">
                        <input type="text" name="clientToDeleteName" value="${clientItem.nombre}" style="display: none;" />
                        <input type="text" name="clientToDeleteId" value="${clientItem.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>