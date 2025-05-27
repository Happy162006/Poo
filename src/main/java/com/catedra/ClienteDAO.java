package com.catedra;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {
    // Método para obtener todos los clientes
    public List<Cliente> obtenerTodos() throws SQLException {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT * FROM clientes";

        try (Connection conn = Conexion.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Cliente cliente = new Cliente(
                        rs.getString("dui"),
                        rs.getString("nombre"),
                        rs.getString("telefono"),
                        rs.getString("tipo_persona"),
                        rs.getString("correo"),
                        rs.getString("direccion"),
                        rs.getString("estado").equals("Activo"),
                        rs.getString("creado_por"),
                        new Date(rs.getTimestamp("fecha_creacion").getTime()),
                        new Date(rs.getTimestamp("fecha_actualizacion").getTime()),
                        rs.getTimestamp("fecha_inactivacion") != null ?
                                new Date(rs.getTimestamp("fecha_inactivacion").getTime()) : null
                );
                clientes.add(cliente);
            }
        }
        return clientes;
    }

    // Método para obtener un cliente por DUI
    public Cliente obtenerPorDui(String dui) throws SQLException {
        String sql = "SELECT * FROM clientes WHERE dui = ?";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, dui);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new Cliente(
                            rs.getString("dui"),
                            rs.getString("nombre"),
                            rs.getString("telefono"),
                            rs.getString("tipo_persona"),
                            rs.getString("correo"),
                            rs.getString("direccion"),
                            rs.getString("estado").equals("Activo"),
                            rs.getString("creado_por"),
                            new Date(rs.getTimestamp("fecha_creacion").getTime()),
                            new Date(rs.getTimestamp("fecha_actualizacion").getTime()),
                            rs.getTimestamp("fecha_inactivacion") != null ?
                                    new Date(rs.getTimestamp("fecha_inactivacion").getTime()) : null
                    );
                }
            }
        }
        return null;
    }

    // Método para insertar un nuevo cliente
    public void insertar(Cliente cliente) throws SQLException {
        String sql = "INSERT INTO clientes (nombre, dui, tipo_persona, telefono, correo, "
                + "direccion, estado, creado_por) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, cliente.getNombre());
            pstmt.setString(2, cliente.getDui());
            pstmt.setString(3, cliente.getTipo());
            pstmt.setString(4, cliente.getTelefono());
            pstmt.setString(5, cliente.getCorreo());
            pstmt.setString(6, cliente.getDireccion());
            pstmt.setString(7, cliente.isEstado() ? "Activo" : "Inactivo");
            pstmt.setString(8, cliente.getCreadoPor());

            pstmt.executeUpdate();
        }
    }

    // Método para actualizar un cliente
    public void actualizar(Cliente cliente) throws SQLException {
        String sql = "UPDATE clientes SET nombre = ?, tipo_persona = ?, telefono = ?, "
                + "correo = ?, direccion = ?, estado = ?, fecha_actualizacion = CURRENT_TIMESTAMP, "
                + "fecha_inactivacion = ? WHERE dui = ?";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, cliente.getNombre());
            pstmt.setString(2, cliente.getTipo());
            pstmt.setString(3, cliente.getTelefono());
            pstmt.setString(4, cliente.getCorreo());
            pstmt.setString(5, cliente.getDireccion());
            pstmt.setString(6, cliente.isEstado() ? "Activo" : "Inactivo");
            pstmt.setDate(7, cliente.getFechaInactivo());
            pstmt.setString(8, cliente.getDui());

            pstmt.executeUpdate();
        }
    }

    // Método para cambiar estado del cliente (activar/desactivar)
    public void cambiarEstado(String dui, boolean activo) throws SQLException {
        String sql = "UPDATE clientes SET estado = ?, fecha_actualizacion = CURRENT_TIMESTAMP, "
                + "fecha_inactivacion = " + (activo ? "NULL" : "CURRENT_TIMESTAMP")
                + " WHERE dui = ?";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, activo ? "Activo" : "Inactivo");
            pstmt.setString(2, dui);

            pstmt.executeUpdate();
        }
    }
}