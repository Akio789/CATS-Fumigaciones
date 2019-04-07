<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de usuarios</title>
</head>
<body>
    <h1>Usuarios</h1>
    <a href="./registerUser.jsp">Registrar</a>
    <a href="./menu.jsp">Menú</a>
    <a href="./modifyUser.jsp">Modificar</a>
    <a href="./deleteUser.jsp">Eliminar</a>
    <a href="./consultUser">Consultar</a>

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
                    <form action="./modifyUser">
                        <input type="submit" method="POST" value="Modify">
                    </form>
                    <a href="deleteUser.jsp?userToDeleteUsername=${user.username}&userToDeleteId=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>