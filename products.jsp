<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sistema de productos</title>
</head>
<body>
    <h1>Productos</h1>
    <a href="./registerProduct.jsp">Registrar</a>
    <a href="./menu.jsp">Menú</a>
    <form action="./consultProduct">
        Nombre: <input type="text" name="productToConsult" />
        <input type="submit" value="Buscar">
    </form>

    <table border="1">
        <thead>
            <th>Id</th>
            <th>Nombre</th>
            <th>Costo</th>
            <th>Cantidad</th>
            <th>Proveedor</th>
        </thead>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>
                    <c:out value="${product.id}" />
                </td>
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
                    <c:out value="${product.idProveedor}" />
                </td>
                <td>
                    <form action="./modifyProduct.jsp">
                        <input type="text" name="id" value="${product.id}" style="display: none;" />
                        <input type="text" name="nombre" value="${product.nombre}" style="display: none;" />
                        <input type="text" name="costo" value="${product.costo}" style="display: none;" />
                        <input type="text" name="cant_disp" value="${product.cant_disp}" style="display: none;" />
                        <input type="text" name="idProveedor" value="${product.idProveedor}" style="display: none;" />
                        <input type="submit" value="Modificar" />
                    </form>

                    <form action="./consultProduct.jsp">
                        <input type="text" name="productToDeleteName" value="${product.nombre}" style="display: none;" />
                        <input type="text" name="productToDeleteId" value="${product.id}" style="display: none;" />
                        <input type="submit" value="Eliminar" />
                    </form>

                    <form action="./productBuy.jsp">
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