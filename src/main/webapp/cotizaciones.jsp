<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <title>Lista de Cotizaciones</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex">
<!-- Sidebar -->
<aside class="w-64 bg-gradient-to-b ">
    <%@ include file="/templates/sidebar.jsp" %>
</aside>

<!-- Contenido principal -->
<main class="flex-1 p-6 overflow-auto">
    <h1 class="text-3xl font-bold mb-6">Cotizaciones</h1>

    <a href="cotizaciones?accion=nuevo"
       class="inline-block bg-blue-600 text-white px-5 py-2 rounded hover:bg-blue-700 transition mb-6">
        Nueva Cotización
    </a>

    <div class="overflow-x-auto bg-white rounded shadow">
        <table class="min-w-full">
            <thead class="bg-gray-200">
            <tr>
                <th class="p-3 text-left">ID</th>
                <th class="p-3 text-left">Cliente DUI</th>
                <th class="p-3 text-left">Fecha de Creación</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="cotizacion" items="${cotizaciones}">
                <tr class="border-b hover:bg-gray-100">
                    <td class="p-3">${cotizacion.id}</td>
                    <td class="p-3">${cotizacion.duiCliente}</td>
                    <td class="p-3">
                        <fmt:formatDate value="${cotizacion.fechaCreacion}" pattern="dd/MM/yyyy HH:mm:ss"/>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
</body>

</html>
