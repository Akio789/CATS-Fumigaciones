<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de proveedores</title>
    <link rel="stylesheet" href="css/provider.css">
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
        </nav>
        </div>
    </header>
    
    <div class="w3-container">
    <h2>Proveedores</h2>
    <a href="./registerProvider.jsp" id="registrar">Registrar</a>
    <form action="./consultProvider">
        Nombre: <input type="text" name="providerToConsult" id="providertoconsult"/>
        <input type="submit" value="Buscar" id="buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Correo</th>
            <th>Opciones</th>
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
                                                             </div>
</body>
</html>