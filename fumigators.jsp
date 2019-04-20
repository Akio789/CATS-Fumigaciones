<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de fumigadores</title>
</head>
<body>
    <header>
        <h2>CATS Fumigaciones</h2>
        <form action="./logout" method="POST">
            <input type="submit" value="Salir">
        </form>

        <nav>
            <c:if test = "${sessionScope.isCurrentUserAdmin == 1}">
                <form action="./users">
                    <input type="submit" value="Usuarios">    
                </form>
            </c:if>

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

    <h1>Fumigadores</h1>
    <a href="./registerFumigator.jsp">Registrar</a>
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
                        <input type="text" name="fumigatorToDeleteName" value="${fumigator.nombre}" style="display: none;" />
                        <input type="text" name="fumigatorToDeleteId" value="${fumigator.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" />
                    </form>
                    <%-- <a href="modifyUser.jsp?id=${user.id}&name=${user.name}&username=${user.username}&job=${user.job}&phoneNum=${user.phoneNum}&email=${user.email}&address=${user.address}">Modificar</a>
                    <a href="deleteUser.jsp?userToDeleteUsername=${user.username}&userToDeleteId=${user.id}">Eliminar</a> --%>
                </td>
            </tr>
        </c:forEach>