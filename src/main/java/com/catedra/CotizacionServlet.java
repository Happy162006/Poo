package com.catedra;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/cotizaciones")
public class CotizacionServlet extends HttpServlet {

    private CotizacionDAO cotizacionDAO;
    private ClienteDAO clienteDAO; // Para listar clientes en formulario

    @Override
    public void init() throws ServletException {
        cotizacionDAO = new CotizacionDAO();
        clienteDAO = new ClienteDAO(); // Asumo que ya tienes este DAO
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");
        try {
            if (accion == null || accion.equals("listar")) {
                listarCotizaciones(request, response);
            } else if (accion.equals("nuevo")) {
                mostrarFormulario(request, response);
            } else {
                listarCotizaciones(request, response);
            }
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    private void listarCotizaciones(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<CotizacionDTO> cotizaciones = cotizacionDAO.obtenerTodosConDui();
        request.setAttribute("cotizaciones", cotizaciones);
        request.getRequestDispatcher("/cotizaciones.jsp").forward(request, response);
    }


    private void mostrarFormulario(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        // Para que en el formulario puedas elegir cliente
        request.setAttribute("clientes", clienteDAO.obtenerTodos());
        request.getRequestDispatcher("/WEB-INF/cotizaciones/formulario.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String clienteDui = request.getParameter("clienteId");
            Cotizacion c = new Cotizacion();
            c.setClienteDui(clienteDui);
            cotizacionDAO.insertar(c);


            response.sendRedirect("cotizaciones");
        } catch (SQLException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
