<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de usuarios</title>
    <link rel="stylesheet" href="css/consult.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
    <header>
        <div class="w3-container">
        <h1>CATS Fumigaciones</h1>
        <form action="./logout" method="POST">
            <input type="submit" value="Salir" id="salir">
        </form>
        </div>
        <div id="nav">
        <nav>
            <form action="./users">
                <input type="submit" value="Usuarios" id="usuarios">    
            </form>

            <form action="./services" method="POST">
                <input type="submit" value="Servicios" id="servicios">    
            </form>

            <form action="./products" method="POST">
                <input type="submit" value="Productos" id="productos">    
            </form>

            <form action="./fumigators">
                <input type="submit" value="Fumigadores" id="fumigadores">    
            </form>

            <form action="./client">
                <input type="submit" value="Clientes" id="clientes">    
            </form>

            <form action="./providers">
                <input type="submit" value="Proveedores" id="proveedores">
            </form>
        </nav>
        </div>
    </header>
    
    <div class="w3-container">
    <h2>Usuario consultado</h2>
    <a href="./users" id="regresar">Regresar a usuarios</a>
    <form action="./consultUser">
        <p id="nom">Nombre: </p><input type="text" name="userToConsult" id="usertoconsult" />
        <input type="submit" value="Buscar" id="buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Username</th>
            <th>Puesto</th>
            <th>Teléfono</th>
            <th>Correo</th>
            <th>Dirección</th>
            <th>Opciones</th>
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
                </td>
            </tr>
        </c:forEach>
    </table>
    </div>
</body>
</html>