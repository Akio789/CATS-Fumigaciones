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

            <form action="./services">
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

    <h1>Clientes</h1>
    <a href="./registerClient.jsp">Registrar</a>
    <a href="./menu.jsp">Menú</a>
    <form action="./consultClient">
        Nombre: <input type="text" name="clientToConsult" />
        <input type="submit" value="Buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
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
                        <input type="text" name="clientToDeleteName" value="${client.nombre}" style="display: none;" />
                        <input type="text" name="clientToDeleteId" value="${client.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>