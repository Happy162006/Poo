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

        <main class="flex-1 p-8 overflow-auto">
            <div class="max-w-3xl">
                <div class="flex  items-center mb-8">
                    <h1 class="text-3xl font-semibold text-gray-800">Actividad</h1>
                    <button class="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 transition-colors">
                        Agregar
                    </button>
                </div>
                
                <div class="mb-6">
                    <h2 class="text-xl font-medium text-gray-800 mb-4">Cotización 1</h2>
                    
                    <div class="pl-4 border-l-2 border-gray-200">
                        <h3 class="text-lg font-normal text-gray-700 mb-1">Subtarea 1</h3>
                        <p class="text-sm text-gray-500">Description: Primera cotización</p>
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>

</html>