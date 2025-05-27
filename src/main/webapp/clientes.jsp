<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <aside class="w-64 text-white h-full">
        <%@ include file="/templates/sidebar.jsp" %>
    </aside>

    <main class="flex-1 p-6 overflow-auto">
        <h1 class="text-2xl font-semibold mb-6">Gestión de Clientes</h1>
        <section class="bg-white rounded-lg shadow overflow-hidden">
            <div class="flex justify-between items-center p-4 border-b">
                <h2 class="font-bold text-lg">Listado de Clientes</h2>
                <div class="flex space-x-4">
                    <div class="relative">
                        <input type="text" placeholder="Buscar cliente..."
                               class="pl-10 pr-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <a href="clientes?accion=nuevo"
                       class="flex items-center bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition-colors">
                        Nuevo Cliente
                    </a>
                </div>
            </div>

            <div class="p-4 overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            DUI
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Nombre
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Tipo
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Teléfono
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Estado
                        </th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                            Acciones
                        </th>
                    </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                    <c:forEach items="${clientes}" var="cliente">
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">${cliente.dui}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${cliente.nombre}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${cliente.tipo}</td>
                            <td class="px-6 py-4 whitespace-nowrap">${cliente.telefono}</td>
                            <td class="px-6 py-4 whitespace-nowrap">
                                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full
                                    ${cliente.estado ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}">
                                        ${cliente.estado ? 'Activo' : 'Inactivo'}
                                </span>
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                <div class="flex space-x-2">
                                    <a href="clientes?accion=editar&dui=${cliente.dui}"
                                       class="text-blue-600 hover:text-blue-900">Editar</a>
                                    <c:choose>
                                        <c:when test="${cliente.estado}">
                                            <a href="clientes?accion=cambiarEstado&dui=${cliente.dui}&activar=false"
                                               class="text-yellow-600 hover:text-yellow-900">Desactivar</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="clientes?accion=cambiarEstado&dui=${cliente.dui}&activar=true"
                                               class="text-green-600 hover:text-green-900">Activar</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
</div>
</body>
</html>