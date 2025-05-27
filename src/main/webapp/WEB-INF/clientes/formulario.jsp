<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${cliente == null ? 'Nuevo Cliente' : 'Editar Cliente'}</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <aside class="w-64 text-white h-full">
        <%@ include file="/templates/sidebar.jsp" %>
    </aside>

    <main class="flex-1 p-6 overflow-auto">
        <h1 class="text-2xl font-semibold mb-6">${cliente == null ? 'Nuevo Cliente' : 'Editar Cliente'}</h1>

        <section class="bg-white rounded-lg shadow p-6">
            <form action="clientes" method="post" class="space-y-4">
                <c:if test="${cliente != null}">
                    <input type="hidden" name="dui" value="${cliente.dui}">
                </c:if>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <!-- Columna 1 -->
                    <div class="space-y-4">
                        <div>
                            <label for="dui" class="block text-sm font-medium text-gray-700">DUI *</label>
                            <input type="text" id="dui" name="dui" value="${cliente.dui}" required
                                   class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                        </div>

                        <div>
                            <label for="nombre" class="block text-sm font-medium text-gray-700">Nombre *</label>
                            <input type="text" id="nombre" name="nombre" value="${cliente.nombre}" required
                                   class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                        </div>

                        <div>
                            <label for="tipo" class="block text-sm font-medium text-gray-700">Tipo de Persona *</label>
                            <select id="tipo" name="tipo" required
                                    class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                                <option value="">Seleccione...</option>
                                <option value="Natural" ${cliente.tipo == 'Natural' ? 'selected' : ''}>Natural</option>
                                <option value="Jurídica" ${cliente.tipo == 'Jurídica' ? 'selected' : ''}>Jurídica</option>
                            </select>
                        </div>
                    </div>

                    <!-- Columna 2 -->
                    <div class="space-y-4">
                        <div>
                            <label for="telefono" class="block text-sm font-medium text-gray-700">Teléfono</label>
                            <input type="text" id="telefono" name="telefono" value="${cliente.telefono}"
                                   class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                        </div>

                        <div>
                            <label for="correo" class="block text-sm font-medium text-gray-700">Correo Electrónico</label>
                            <input type="email" id="correo" name="correo" value="${cliente.correo}"
                                   class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500">
                        </div>

                        <div class="flex items-center">
                            <input type="checkbox" id="estado" name="estado" ${cliente.estado ? 'checked' : ''}
                                   class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded">
                            <label for="estado" class="ml-2 block text-sm text-gray-700">Activo</label>
                        </div>
                    </div>
                </div>

                <div>
                    <label for="direccion" class="block text-sm font-medium text-gray-700">Dirección</label>
                    <textarea id="direccion" name="direccion" rows="3"
                              class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm py-2 px-3 focus:outline-none focus:ring-blue-500 focus:border-blue-500">${cliente.direccion}</textarea>
                </div>

                <div class="flex justify-end space-x-3 pt-4">
                    <a href="clientes" class="bg-gray-300 hover:bg-gray-400 text-gray-800 py-2 px-4 rounded">
                        Cancelar
                    </a>
                    <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded">
                        Guardar Cliente
                    </button>
                </div>
            </form>
        </section>
    </main>
</div>
</body>
</html>