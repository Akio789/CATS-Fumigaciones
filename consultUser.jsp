<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de usuarios</title>
</head>
<body>
    <h1>Usuario consultado</h1>
    <a href="./users">Regresar a usuarios</a>
    <a href="./menu.jsp">Menú</a>
    <form action="./consultUser">
        Nombre de usuario: <input type="text" name="userToConsult" />
        <input type="submit" value="Buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Username</th>
            <th>Puesto</th>
            <th>Teléfono</th>
            <th>Correo</th>
            <th>Dirección</th>
        </thead>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>
                    <c:out value="${user.name}" />
                </td>
                <td>
                    <c:out value="${user.username}" />                
                </td>
                <td>
                    <c:out value="${user.job}" />
                </td>
                <td>
                    <c:out value="${user.phoneNum}" />
                </td>
                <td>
                    <c:out value="${user.email}" />
                </td>
                <td>
                    <c:out value="${user.address}" />
                </td>
                <td>
                    <form action="./modifyUser.jsp">
                        <input type="text" name="id" value="${user.id}" style="display: none;" />
                        <input type="text" name="name" value="${user.name}" style="display: none;" />
                        <input type="text" name="username" value="${user.username}" style="display: none;" />
                        <input type="text" name="job" value="${user.job}" style="display: none;" />
                        <input type="text" name="phoneNum" value="${user.phoneNum}" style="display: none;" />
                        <input type="text" name="email" value="${user.email}" style="display: none;" />
                        <input type="text" name="address" value="${user.address}" style="display: none;" />
                        <input type="submit" value="Modificar" />
                    </form>

                    <form action="./deleteUser.jsp">
                        <input type="text" name="userToDeleteUsername" value="${user.username}" style="display: none;" />
                        <input type="text" name="userToDeleteId" value="${user.id}" style="display: none;" />
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