<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Empleados</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

<div class="flex h-screen">
    <aside class="w-64 text-white h-full">
        <%@ include file="/templates/sidebar.jsp" %>
    </aside>

    <main class="flex-1">
        <div class="flex flex-col h-screen">
            <header class="bg-white shadow-sm p-4">
                <h1 class="text-xl font-bold text-gray-800">Sistema de Empleados</h1>
            </header>

            <main class="flex-1 overflow-auto">
                <section class="bg-white rounded-lg shadow mx-4 my-6">
                    <div class="flex justify-between items-center p-6 border-b sticky top-0 bg-white z-10">
                        <h2 class="text-2xl font-bold text-gray-800">Empleados</h2>
                        <a href="empleados?accion=nuevo"
                           class="flex items-center bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition-colors">
                            Nuevo Empleado
                        </a>
                    </div>

                    <div class="divide-y">
                        <div class="grid grid-cols-12 gap-4 p-4 bg-gray-50 font-medium text-gray-600 sticky top-16 bg-white z-10">
                            <div class="col-span-1"></div>
                            <div class="col-span-4">Nombre</div>
                            <div class="col-span-3">Fecha Actualización</div>
                            <div class="col-span-4 text-right">Acciones</div>
                        </div>

                        <c:forEach var="empleado" items="${empleados}">
                            <div class="grid grid-cols-12 gap-4 p-4 items-center hover:bg-gray-50 cursor-pointer">
                                <div class="col-span-1">
                                    <div class="w-10 h-10 rounded-full bg-gray-300 flex items-center justify-center">
                                        <span class="text-gray-600">
                                            <c:out value="${empleado.nombre.substring(0, 2)}"/>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-span-4 font-medium">
                                    <c:out value="${empleado.nombre}"/>
                                </div>
                                <div class="col-span-3 text-gray-500">
                                    <fmt:formatDate value="${empleado.fechaActualizado}" pattern="dd/MM/yyyy"/>
                                </div>
                                <div class="col-span-4 flex justify-end space-x-2">
                                    <a href="empleados?accion=editar&dui=${empleado.dui}"
                                       class="text-blue-600 hover:text-blue-800 px-3 py-1 rounded hover:bg-blue-50 transition-colors">
                                        Editar
                                    </a>
                                    <a href="empleados?accion=eliminar&dui=${empleado.dui}"
                                       onclick="return confirm('¿Estás seguro de eliminar este empleado?')"
                                       class="text-red-600 hover:text-red-800 px-3 py-1 rounded hover:bg-red-50 transition-colors">
                                        Eliminar
                                    </a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="flex justify-between items-center p-4 border-t sticky bottom-0 bg-white">
                        <div class="text-sm text-gray-500">Total: <c:out value="${empleados.size()}"/></div>
                        <div class="flex space-x-2">
                            <!-- Aquí podrías agregar paginación real -->
                            <button class="px-3 py-1 border rounded text-gray-600 hover:bg-gray-100">Anterior</button>
                            <button class="px-3 py-1 border rounded bg-blue-600 text-white">1</button>
                            <button class="px-3 py-1 border rounded text-gray-600 hover:bg-gray-100">Siguiente</button>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </main>
</div>

</body>
</html>
