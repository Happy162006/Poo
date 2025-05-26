<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

<div class="flex h-screen">
    <aside class="w-64 text-white h-full">
        <?php include './templates/sidebar.php'; ?>
    </aside>

    <main class="flex-1">
        <div class="flex flex-col h-screen">
            <header class="bg-white shadow-sm p-4">
                <h1 class="text-xl font-bold text-gray-800">Sistema de Empleados</h1>
            </header>

            <main class="flex-1 overflow-auto">
                <section class="bg-white rounded-lg shadow mx-4 my-6">
                    <div
                            class="flex justify-between items-center p-6 border-b sticky top-0 bg-white z-10">
                        <h2 class="text-2xl font-bold text-gray-800">Empleados</h2>
                        <button
                                class="flex items-center bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition-colors"
                                aria-label="Agregar nuevo empleado">
                            Nuevo Empleado
                        </button>
                    </div>

                    <div class="divide-y">
                        <div
                                class="grid grid-cols-12 gap-4 p-4 bg-gray-50 font-medium text-gray-600 sticky top-16 bg-white z-10">
                            <div class="col-span-1"></div>
                            <div class="col-span-4">Nombre</div>
                            <div class="col-span-3">Última Fecha</div>
                            <div class="col-span-4 text-right">Acciones</div>
                        </div>

                        <div
                                class="grid grid-cols-12 gap-4 p-4 items-center hover:bg-gray-50 cursor-pointer">
                            <div class="col-span-1">
                                <div
                                        class="w-10 h-10 rounded-full bg-gray-300 flex items-center justify-center">
                                    <span class="text-gray-600">LH</span>
                                </div>
                            </div>
                            <div class="col-span-4 font-medium">Luis Hernandez</div>
                            <div class="col-span-3 text-gray-500">September 9, 2013</div>
                            <div class="col-span-4 flex justify-end space-x-2">
                                <button
                                        class="text-blue-600 hover:text-blue-800 px-3 py-1 rounded hover:bg-blue-50 transition-colors"
                                        aria-label="Editar empleado Luis Hernandez">
                                    Editar
                                </button>
                                <button
                                        class="text-red-600 hover:text-red-800 px-3 py-1 rounded hover:bg-red-50 transition-colors"
                                        aria-label="Eliminar empleado Luis Hernandez">
                                    Eliminar
                                </button>
                            </div>
                        </div>

                        <div
                                class="grid grid-cols-12 gap-4 p-4 items-center hover:bg-gray-50 cursor-pointer">
                            <div class="col-span-1">
                                <div
                                        class="w-10 h-10 rounded-full bg-gray-300 flex items-center justify-center">
                                    <span class="text-gray-600">LH</span>
                                </div>
                            </div>
                            <div class="col-span-4 font-medium">Luis Hernandez</div>
                            <div class="col-span-3 text-gray-500">August 2, 2013</div>
                            <div class="col-span-4 flex justify-end space-x-2">
                                <button
                                        class="text-blue-600 hover:text-blue-800 px-3 py-1 rounded hover:bg-blue-50 transition-colors"
                                        aria-label="Editar empleado Luis Hernandez">
                                    Editar
                                </button>
                                <button
                                        class="text-red-600 hover:text-red-800 px-3 py-1 rounded hover:bg-red-50 transition-colors"
                                        aria-label="Eliminar empleado Luis Hernandez">
                                    Eliminar
                                </button>
                            </div>
                        </div>
                    </div>

                    <div
                            class="flex justify-between items-center p-4 border-t sticky bottom-0 bg-white">
                        <div class="text-sm text-gray-500">1/12</div>
                        <div class="flex space-x-2">
                            <button
                                    class="px-3 py-1 border rounded text-gray-600 hover:bg-gray-100"
                                    aria-label="Página anterior">
                                Anterior
                            </button>
                            <button
                                    class="px-3 py-1 border rounded bg-blue-600 text-white"
                                    aria-label="Página 1">
                                1
                            </button>
                            <button
                                    class="px-3 py-1 border rounded text-gray-600 hover:bg-gray-100"
                                    aria-label="Página siguiente">
                                Siguiente
                            </button>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </main>
</div>
</body>

</html>
