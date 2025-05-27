<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-red-100 flex items-center justify-center min-h-screen">
<div class="bg-white border border-red-400 text-red-700 px-6 py-4 rounded shadow max-w-md w-full text-center">
    <h1 class="text-2xl font-bold mb-4">¡Ha ocurrido un error!</h1>
    <p class="mb-4">
        <c:choose>
            <c:when test="${not empty error}">
                ${error}
            </c:when>
            <c:otherwise>
                Ocurrió un problema inesperado. Por favor, intente de nuevo más tarde.
            </c:otherwise>
        </c:choose>
    </p>

    <a href="index.jsp" class="text-blue-600 hover:underline">Volver al inicio</a>
</div>
</body>
</html>
