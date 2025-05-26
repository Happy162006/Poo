<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

<div class="flex h-screen">
    <aside class="w-64 text-white h-full">
        <%@ include file="/templates/sidebar.jsp" %>
    </aside>

    <main class="flex-1 p-6">
        <h1 class="text-2xl font-semibold">Inicio</h1>

        <section class="mt-6">
            <h2 class="font-bold text-lg">CLIENTES</h2>
            <div class="space-y-4">
                <div class="flex items-center justify-between bg-white p-4 rounded-lg shadow">
                    <div class="flex items-center space-x-3">
                        <img src="${pageContext.request.contextPath}/resources/profile1.jpg" class="w-10 h-10 rounded-full" alt="">
                        <span>Prof Magno</span>
                    </div>
                    <span class="font-semibold text-blue-500">galdamezsoto@gmail.com</span>
                    <span class="text-green-500">Activo</span>
                </div>
            </div>
        </section>

        <section class="grid grid-cols-4 gap-4 mt-6">
            <div class="bg-white p-4 rounded-lg shadow text-center">
                <h3 class="text-gray-500">Clientes</h3>
                <p class="text-2xl font-bold">150</p>
                <span class="text-green-500">+15%</span>
            </div>
            <div class="bg-white p-4 rounded-lg shadow text-center">
                <h3 class="text-gray-500">Empleados</h3>
                <p class="text-2xl font-bold">16</p>
                <span class="text-red-500">-3.5%</span>
            </div>
            <div class="bg-white p-4 rounded-lg shadow text-center">
                <h3 class="text-gray-500">Cotizaciones</h3>
                <p class="text-2xl font-bold">115</p>
                <span class="text-green-500">+15%</span>
            </div>
            <div class="bg-white p-4 rounded-lg shadow text-center">
                <h3 class="text-gray-500">En total</h3>
                <p class="text-2xl font-bold">50</p>
                <span class="text-green-500">+10%</span>
            </div>
        </section>

        <h1 class="text-2xl font-semibold mb-6">Empleados</h1>

        <section class="bg-white rounded-lg shadow p-6 mb-6">
            <div class="flex items-center space-x-4">
                <div class="w-12 h-12 rounded-full bg-blue-100 flex items-center justify-center">
                    <span class="text-blue-600 font-semibold text-lg">JJ</span>
                </div>
                <div>
                    <h2 class="font-bold text-lg">Juan Jose</h2>
                    <p class="text-gray-500">galdamezsoto@gmail.com</p>
                </div>
            </div>
        </section>
    </main>
</div>

</body>
</html>
