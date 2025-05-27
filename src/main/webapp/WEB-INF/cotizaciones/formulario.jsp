<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <title>Nueva Cotización</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="flex min-h-screen">
    <aside class="w-64 bg-gray-800 text-white">
        <%@ include file="/templates/sidebar.jsp" %>
    </aside>

    <main class="flex-1 p-6">
        <h1 class="text-2xl font-bold mb-4">Crear Cotización</h1>

        <form action="cotizaciones" method="post" class="max-w-md bg-white p-6 rounded shadow">
            <label for="clienteId" class="block font-medium mb-2">Cliente</label>
            <select name="clienteId" id="clienteId" required class="w-full border p-2 rounded mb-4">
                <option value="">-- Seleccione Cliente --</option>
                <c:forEach var="cliente" items="${clientes}">
                    <option value="${cliente.dui}">${cliente.nombre}</option>
                </c:forEach>
            </select>

            <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Guardar</button>
        </form>
    </main>

</div>
</body>

</html>
