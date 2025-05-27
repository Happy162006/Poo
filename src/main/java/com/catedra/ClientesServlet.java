package com.catedra;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/clientes")
public class ClientesServlet extends HttpServlet {
    private ClienteDAO clienteDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        clienteDAO = new ClienteDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion");

            if (accion == null) {
                // Listar todos los clientes
                listarClientes(request, response);
            } else {
                switch (accion) {
                    case "nuevo":
                        mostrarFormulario(request, response, null);
                        break;
                    case "editar":
                        editarCliente(request, response);
                        break;
                    case "cambiarEstado":
                        cambiarEstadoCliente(request, response);
                        break;
                    default:
                        listarClientes(request, response);
                }
            }
        } catch (SQLException | NumberFormatException e) {
            manejarError(request, response, "Error al procesar la solicitud: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String dui = request.getParameter("dui");

            Cliente cliente = new Cliente(
                    dui,
                    request.getParameter("nombre"),
                    request.getParameter("telefono"),
                    request.getParameter("tipo"),
                    request.getParameter("correo"),
                    request.getParameter("direccion"),
                    "on".equals(request.getParameter("estado")),
                    request.getRemoteUser(), // Usuario autenticado
                    new Date(System.currentTimeMillis()), // Fecha actual
                    new Date(System.currentTimeMillis()), // Fecha actual
                    null // Fecha inactivación (se manejará según estado)
            );

            if (clienteDAO.obtenerPorDui(dui) == null) {
                // Insertar nuevo cliente
                clienteDAO.insertar(cliente);
            } else {
                // Actualizar cliente existente
                clienteDAO.actualizar(cliente);
            }

            response.sendRedirect("clientes");
        } catch (SQLException e) {
            manejarError(request, response, "Error al guardar el cliente: " + e.getMessage());
        }
    }

    private void listarClientes(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Cliente> clientes = clienteDAO.obtenerTodos();
        request.setAttribute("clientes", clientes);
        request.getRequestDispatcher("/clientes.jsp").forward(request, response);
    }

    private void mostrarFormulario(HttpServletRequest request, HttpServletResponse response, Cliente cliente)
            throws ServletException, IOException {
        request.setAttribute("cliente", cliente);
        request.setAttribute("tiposPersona", new String[]{"Natural", "Jurídica"});
        request.getRequestDispatcher("/WEB-INF/clientes/formulario.jsp").forward(request, response);
    }

    private void editarCliente(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String dui = request.getParameter("dui");
        Cliente cliente = clienteDAO.obtenerPorDui(dui);

        if (cliente == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Cliente no encontrado");
            return;
        }

        mostrarFormulario(request, response, cliente);
    }

    private void cambiarEstadoCliente(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String dui = request.getParameter("dui");
        boolean activar = "true".equals(request.getParameter("activar"));

        clienteDAO.cambiarEstado(dui, activar);
        response.sendRedirect("clientes");
    }

    private void manejarError(HttpServletRequest request, HttpServletResponse response, String mensaje)
            throws ServletException, IOException {
        request.setAttribute("error", mensaje);
        request.getRequestDispatcher("/WEB-INF/vistas/error.jsp").forward(request, response);
    }
}