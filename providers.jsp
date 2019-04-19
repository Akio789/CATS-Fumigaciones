<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de proveedores</title>
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

    <h1>Proveedores</h1>
    <a href="./registerProvider.jsp">Registrar</a>
    <form action="./consultProvider">
        Nombre: <input type="text" name="providerToConsult" />
        <input type="submit" value="Buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Correo</th>
        </thead>
        <c:forEach items="${providers}" var="provider">
            <tr>
                <td>
                    <c:out value="${provider.nombre}" />
                </td>
                <td>
                    <c:out value="${provider.direccion}" />                
                </td>
                <td>
                    <c:out value="${provider.correo}" />
                </td>
                <td>
                    <form action="./modifyProvider.jsp">
                        <input type="text" name="id" value="${provider.id}" style="display: none;" />
                        <input type="text" name="nombre" value="${provider.nombre}"}" style="display: none;" />
                        <input type="text" name="direccion" value="${provider.direccion}" style="display: none;" />
                        <input type="text" name="correo" value="${provider.correo}" style="display: none;" />
                        <input type="submit" value="Modificar" />
                    </form>

                    <form action="./deleteProvider.jsp">
                        <input type="text" name="providerToDeleteName" value="${provider.nombre}" style="display: none;" />
                        <input type="text" name="providerToDeleteId" value="${provider.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>