package com.catedra;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/empleados")
public class EmpleadoServlet extends HttpServlet {
    private EmpleadoDAO empleadoDAO;

    @Override
    public void init() throws ServletException {
        empleadoDAO = new EmpleadoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String accion = request.getParameter("accion");

            if (accion == null) {
                listarEmpleados(request, response);
            } else {
                switch (accion) {
                    case "nuevo":
                        mostrarFormulario(request, response, null);
                        break;
                    case "editar":
                        editarEmpleado(request, response);
                        break;
                    case "cambiarEstado":
                        cambiarEstadoEmpleado(request, response);
                        break;
                    case "eliminar":
                        eliminarEmpleado(request, response);
                        break;
                    default:
                        listarEmpleados(request, response);
                }
            }
        } catch (SQLException e) {
            manejarError(request, response, "Error en GET: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String dui = request.getParameter("dui");

            Empleado emp = new Empleado(
                    dui,
                    request.getParameter("nombre"),
                    request.getParameter("telefono"),
                    request.getParameter("tipo"),
                    request.getParameter("correo"),
                    request.getParameter("direccion"),
                    "on".equals(request.getParameter("estado")),
                    request.getRemoteUser(),
                    new Date(System.currentTimeMillis()),
                    new Date(System.currentTimeMillis()),
                    null,
                    request.getParameter("contrato")
            );

            if (empleadoDAO.obtenerPorDui(dui) == null) {
                empleadoDAO.insertar(emp);
            } else {
                empleadoDAO.actualizar(emp);
            }

            response.sendRedirect("empleados");
        } catch (SQLException e) {
            manejarError(request, response, "Error en POST: " + e.getMessage());
        }
    }

    private void listarEmpleados(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Empleado> empleados = empleadoDAO.obtenerTodos();
        request.setAttribute("empleados", empleados);
        request.getRequestDispatcher("/empleados.jsp").forward(request, response); // Usa tu vista principal
    }

    private void mostrarFormulario(HttpServletRequest request, HttpServletResponse response, Empleado emp)
            throws ServletException, IOException {
        request.setAttribute("empleado", emp);
        request.setAttribute("tiposPersona", new String[]{"Natural", "Jurídica"});
        request.setAttribute("tiposContrato", new String[]{"Permanente", "Por Horas"});
        request.getRequestDispatcher("/WEB-INF/empleados/formulario.jsp").forward(request, response);
    }

    private void editarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String dui = request.getParameter("dui");
        Empleado emp = empleadoDAO.obtenerPorDui(dui);

        if (emp == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Empleado no encontrado");
            return;
        }

        mostrarFormulario(request, response, emp);
    }

    private void cambiarEstadoEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String dui = request.getParameter("dui");
        boolean activar = "true".equals(request.getParameter("activar"));
        empleadoDAO.cambiarEstado(dui, activar);
        response.sendRedirect("empleados");
    }

    private void eliminarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String dui = request.getParameter("dui");
        if (dui != null) {
            empleadoDAO.eliminar(dui);
        }
        response.sendRedirect("empleados?accion=listar");
    }


    private void manejarError(HttpServletRequest request, HttpServletResponse response, String mensaje)
            throws ServletException, IOException {
        request.setAttribute("error", mensaje);
        request.getRequestDispatcher("/WEB-INF/vistas/error.jsp").forward(request, response);
    }
}
