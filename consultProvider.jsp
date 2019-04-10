<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de proveedores</title>
</head>
<body>
    <h1>Proveedor consultado</h1>
    <a href="./providers">Regresar a proveedores</a>
    <a href="./menu.jsp">Menú</a>
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
                        <input type="text" name="costo" value="${provider.direccion}" style="display: none;" />
                        <input type="text" name="cant_disp" value="${provider.correo}" style="display: none;" />
                        <input type="submit" value="Modificar" />
                    </form>

                    <form action="./consultProvider.jsp">
                        <input type="text" name="providerToDeleteName" value="${provider.nombre}" style="display: none;" />
                        <input type="text" name="providerToDeleteId" value="${provider.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" />
                    </form>
                    <%-- <a href="modifyUser.jsp?id=${user.id}&name=${user.name}&username=${user.username}&job=${user.job}&phoneNum=${user.phoneNum}&email=${user.email}&address=${user.address}">Modificar</a>
                    <a href="deleteUser.jsp?userToDeleteUsername=${user.username}&userToDeleteId=${user.id}">Eliminar</a> --%>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>