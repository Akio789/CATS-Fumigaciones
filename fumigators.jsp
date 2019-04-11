<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de fumigadores</title>
</head>
<body>
    <h1>Fumigadores</h1>
    <a href="./registerFumigator.jsp">Registrar</a>
    <a href="./menu.jsp">Menú</a>
    <form action="./consultFumigator">
        Nombre: <input type="text" name="fumigatorToConsult" />
        <input type="submit" value="Buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Correo</th>
        </thead>
        <c:forEach items="${fumigators}" var="fumigator">
            <tr>
                <td>
                    <c:out value="${fumigator.nombre}" />
                </td>
                <td>
                    <c:out value="${fumigator.direccion}" />                
                </td>
                <td>
                    <c:out value="${fumigator.correo}" />
                </td>
                <td>
                    <form action="./modifyFumigator.jsp">
                        <input type="text" name="id" value="${fumigator.id}" style="display: none;" />
                        <input type="text" name="nombre" value="${fumigator.nombre}"}" style="display: none;" />
                        <input type="text" name="direccion" value="${fumigator.direccion}" style="display: none;" />
                        <input type="text" name="correo" value="${fumigator.correo}" style="display: none;" />
                        <input type="submit" value="Modificar" />
                    </form>

                    <form action="./deleteFumigator.jsp">
                        <input type="text" name="providerToDeleteName" value="${fumigator.nombre}" style="display: none;" />
                        <input type="text" name="providerToDeleteId" value="${fumigator.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" />
                    </form>
                    <%-- <a href="modifyUser.jsp?id=${user.id}&name=${user.name}&username=${user.username}&job=${user.job}&phoneNum=${user.phoneNum}&email=${user.email}&address=${user.address}">Modificar</a>
                    <a href="deleteUser.jsp?userToDeleteUsername=${user.username}&userToDeleteId=${user.id}">Eliminar</a> --%>
                </td>
            </tr>
        </c:forEach>