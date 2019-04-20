<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de productos</title>
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

    <h1>Productos</h1>
    <form action="./registerProduct.jsp">
        <input type="hidden" name="${providers}">
        <input type="submit" value="Registar">
    </form>

    <form action="./consultProduct" method="POST">
        Nombre: <input type="text" name="productToConsult" />
        <input type="submit" value="Buscar">
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
                        <input type="submit" value="Modificar" />
                    </form>

                    <form action="./deleteProduct.jsp" method="POST">
                        <input type="text" name="productToDeleteName" value="${product.nombre}" style="display: none;" />
                        <input type="text" name="productToDeleteId" value="${product.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" />
                    </form>

                    <form action="./productBuy.jsp" method="POST">
                        <input type="text" name="id" value="${product.id}" style="display: none;" />
                        <input type="text" name="nombre" value="${product.nombre}" style="display: none;" />
                        <input type="submit" value="Comprar">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>