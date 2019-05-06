<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de productos</title>
    <link rel="stylesheet" href="css/product.css">
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
    
    
    <h2>Productos</h2>
    <form action="./registerProduct.jsp">
        <input type="hidden" name="${providers}">
        <center><input type="submit" value="Registrar" id="registrar"></center>
    </form>

    <form action="./consultProduct" method="POST">
        <p id="nom">Nombre: </p><input type="text" name="productToConsult" id="producttoconsult"/>
        <input type="submit" value="Buscar" id="buscar">
    </form>

    <table border="1">
        <thead>
            <th>Nombre</th>
            <th>Costo</th>
            <th>Cantidad</th>
            <th>Proveedor</th>
            <th>Opciones</th>
        </thead>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>
                    <c:out value="${product.nombre}" />                
                </td>
                <td>
                    <c:out value="${product.costo}" />
                </td>
                <td>
                    <c:out value="${product.cant_disp}" />
                </td>
                <td>
                    <c:out value="${product.nombreProveedor}" />
                </td>
                <td>
                    <form action="./modifyProduct.jsp" method="POST">
                        <input type="text" name="id" value="${product.id}" style="display: none;" />
                        <input type="text" name="nombre" value="${product.nombre}" style="display: none;" />
                        <input type="text" name="costo" value="${product.costo}" style="display: none;" />
                        <input type="text" name="cant_disp" value="${product.cant_disp}" style="display: none;" />
                        <input type="text" name="idProveedor" value="${product.idProveedor}" style="display: none;" />
                        <input type="submit" value="Modificar" id="modificar"/>
                    </form>

                    <form action="./deleteProduct.jsp" method="POST">
                        <input type="text" name="productToDeleteName" value="${product.nombre}" style="display: none;" />
                        <input type="text" name="productToDeleteId" value="${product.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" id="eliminar"/>
                    </form>

                    <form action="./productBuy.jsp" method="POST">
                        <input type="text" name="id" value="${product.id}" style="display: none;" />
                        <input type="text" name="nombre" value="${product.nombre}" style="display: none;" />
                        <input type="submit" value="Comprar" id="comprar">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    
</body>
</html>