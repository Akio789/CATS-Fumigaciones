<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de fumigadores</title>
        <link rel="stylesheet" href="css/fumigator.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

</head>
<body>
    <header>
        <div id="wrapper">
        <h1>CATS Fumigaciones</h1>
        <form action="./logout" method="POST">
            <input type="submit" value="Salir" id="salir">
        </form>
        </div>
        
        <div id="nav">
        <nav>
            <c:if test = "${sessionScope.isCurrentUserAdmin == 1}">
                <form action="./users">
                    <input type="submit" value="Usuarios" id="usuarios">    
                </form>
            </c:if>

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
            
            <form action="./reports">
		        <input type="submit" value="Reportes" id="reportes">
		    </form>
        </nav>
        </div>
    </header>

    <h2>Fumigadores</h2>
    <div id="intento">
    <center><a href="./registerFumigator.jsp" id="registrar">Registrar</a></center>
    </div>
        <form action="./consultFumigator">
        <p id="nom">Nombre:</p> <input type="text" name="fumigatorToConsult" id="fumigatortoconsult"/>
        <input type="submit" value="Buscar" id="buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Correo</th>
            <th>Opciones</th>
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
                        <input type="submit" value="Modificar" id="modificar"/>
                    </form>

                    <form action="./deleteFumigator.jsp">
                        <input type="text" name="fumigatorToDeleteName" value="${fumigator.nombre}" style="display: none;" />
                        <input type="text" name="fumigatorToDeleteId" value="${fumigator.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" id="eliminar" />
                    </form>
                    <%-- <a href="modifyUser.jsp?id=${user.id}&name=${user.name}&username=${user.username}&job=${user.job}&phoneNum=${user.phoneNum}&email=${user.email}&address=${user.address}">Modificar</a>
                    <a href="deleteUser.jsp?userToDeleteUsername=${user.username}&userToDeleteId=${user.id}">Eliminar</a> --%>
                </td>
            </tr>
        </c:forEach>
                                                                                                            </table>
    </div>
</body>
</html>
                                                                                                            