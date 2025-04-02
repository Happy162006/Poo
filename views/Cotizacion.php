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
            <?php include './templates/sidebar.php'; ?>
        </aside>

        <main class="flex-1 p-6 overflow-auto">
            <div class="bg-white rounded-lg shadow-md p-6">
                <h1 class="text-2xl font-bold text-gray-800 mb-4">Cotizacion</h1>
                <h2 class="text-lg font-semibold text-gray-700 mb-6">Total: 110</h2>

                <div class="overflow-x-auto">
                    <table class="min-w-full border-collapse">
                        <thead>
                            <tr class="bg-gray-200 text-gray-700">
                                <th class="py-2 px-4 border">N</th>
                                <th class="py-2 px-4 border">Pvt4</th>
                                <th class="py-2 px-4 border">Octora</th>
                                <th class="py-2 px-4 border">Octora totales</th>
                                <th class="py-2 px-4 border">Fecha</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="border-b hover:bg-gray-50">
                                <td class="py-2 px-4 border">425</td>
                                <td class="py-2 px-4 border">Juan</td>
                                <td class="py-2 px-4 border">$90</td>
                                <td class="py-2 px-4 border">$90</td>
                                <td class="py-2 px-4 border">12.02.2013</td>
                            </tr>
                            <tr class="border-b hover:bg-gray-50">
                                <td class="py-2 px-4 border">SM</td>
                                <td class="py-2 px-4 border">Juan</td>
                                <td class="py-2 px-4 border">$90</td>
                                <td class="py-2 px-4 border">$90</td>
                                <td class="py-2 px-4 border">21.04.2014</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="flex justify-between items-center p-4 border-t sticky bottom-0 bg-white">
                        <div class="text-sm text-gray-500"> 1/12</div>
                        <div class="flex space-x-2">
                            <button class="px-3 py-1 border rounded text-gray-600 hover:bg-gray-100">Anterior</button>
                            <button class="px-3 py-1 border rounded bg-blue-600 text-white">1</button>
                            <button class="px-3 py-1 border rounded text-gray-600 hover:bg-gray-100">Siguiente</button>
                        </div>
                    </div>
                </div>

            </div>

        </main>
    </div>
</body>

</html>