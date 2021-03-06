<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de clientes</title>
        <link rel="stylesheet" href="css/client.css">
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
    
    <h2>Clientes</h2>
    <div id="intento">
        <center><a href="./registerClient.jsp" id="registrar">Registrar</a></center>
    </div>
        <form action="./consultClient">
        <p id="nom">Nombre: </p><input type="text" name="clientToConsult" id="clienttoconsult"/>
        <input type="submit" value="Buscar" id="buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Telefono</th>
            <th>Direccion</th>
            <th>Correo</th>
            <th>Opciones</th>
        </thead>
   <c:forEach items="${clients}" var="client">
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
                        <input type="submit" value="Modificar" id="modificar" />
                    </form>

                    <form action="./deleteClient.jsp">
                        <input type="text" name="clientToDeleteName" value="${client.nombre}" style="display: none;" />
                        <input type="text" name="clientToDeleteId" value="${client.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" id="eliminar"/>
                    </form>
                </td>
            </tr>
       </c:forEach>
    </table>
</body>
</html>