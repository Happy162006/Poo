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
        <h1 class="text-2xl font-semibold mb-6">Clientes</h1>
        <section class="bg-white rounded-lg shadow overflow-hidden">
            <div class="flex justify-between items-center p-4 border-b">
                <h2 class="font-bold text-lg">Clientes</h2>
                <div class="flex space-x-4">
                    <div class="relative">
                        <input type="text" placeholder="Buscar cliente..."
                               class="pl-10 pr-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <button
                            class="flex items-center bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition-colors">
                        Nuevo Cliente
                    </button>
                </div>
            </div>

            <div class="p-4">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Estado
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Nombre
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Edad
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Hora
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Fecha
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Acciones
                        </th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                        Activo
                                    </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">Juan Jose Galdamez</td>
                        <td class="px-6 py-4 whitespace-nowrap">18</td>
                        <td class="px-6 py-4 whitespace-nowrap">10 am</td>
                        <td class="px-6 py-4 whitespace-nowrap">11.06.2019</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">/</td>
                    </tr>
                    <tr>
                        <td class="px-6 py-4 whitespace-nowrap">
                                    <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">
                                        Pendiente
                                    </span>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap">Juan Jose Galdamez</td>
                        <td class="px-6 py-4 whitespace-nowrap">18</td>
                        <td class="px-6 py-4 whitespace-nowrap">2 pm</td>
                        <td class="px-6 py-4 whitespace-nowrap">12.02.2019</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">/</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
</div>
</body>
</html>
