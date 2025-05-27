<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario Empleado</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

<div class="flex min-h-screen">

    <aside class="w-64 bg-gray-800 text-white min-h-screen">
        <%@ include file="/templates/sidebar.jsp" %>
    </aside>

    <main class="flex-1 p-10">
        <div class="max-w-xl mx-auto bg-white p-6 rounded-lg shadow">
            <h2 class="text-xl font-semibold mb-4">Formulario de Empleado</h2>

            <form method="post" action="empleados">
                <input type="hidden" name="accion" value="${empleado == null ? 'nuevo' : 'editar'}"/>

                <div class="mb-4">
                    <label class="block text-sm font-medium">DUI</label>
                    <input type="text" name="dui" value="${empleado.dui}" required class="w-full border p-2 rounded"/>
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium">Nombre</label>
                    <input type="text" name="nombre" value="${empleado.nombre}" required
                           class="w-full border p-2 rounded"/>
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium">Tipo de Persona</label>
                    <select name="tipo" class="w-full border p-2 rounded">
                        <option value="Natural" ${empleado.tipo == 'Natural' ? 'selected' : ''}>Natural</option>
                        <option value="Jurídica" ${empleado.tipo == 'Jurídica' ? 'selected' : ''}>Jurídica</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium">Tipo de Contratación</label>
                    <select name="contrato" class="w-full border p-2 rounded">
                        <option value="Permanente" ${empleado.contrato == 'Permanente' ? 'selected' : ''}>Permanente
                        </option>
                        <option value="Por Horas" ${empleado.contrato == 'Por Horas' ? 'selected' : ''}>Por Horas
                        </option>
                    </select>
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium">Teléfono</label>
                    <input type="text" name="telefono" value="${empleado.telefono}" class="w-full border p-2 rounded"/>
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium">Correo</label>
                    <input type="email" name="correo" value="${empleado.correo}" class="w-full border p-2 rounded"/>
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium">Dirección</label>
                    <textarea name="direccion" class="w-full border p-2 rounded">${empleado.direccion}</textarea>
                </div>

                <div class="mb-4">
                    <label class="inline-flex items-center">
                        <input type="checkbox" name="estado" ${empleado.estado ? 'checked' : ''} class="mr-2"/>
                        Activo
                    </label>
                </div>

                <div class="flex justify-end">
                    <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
                        Guardar
                    </button>
                </div>
            </form>
        </div>
    </main>
</div>

</body>
</html>
