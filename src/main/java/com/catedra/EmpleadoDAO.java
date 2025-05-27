package com.catedra;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    public List<Empleado> obtenerTodos() throws SQLException {
        List<Empleado> empleados = new ArrayList<>();
        String sql = "SELECT * FROM empleados";

        try (Connection con = Conexion.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                empleados.add(mapearEmpleado(rs));
            }
        }
        return empleados;
    }

    public Empleado obtenerPorDui(String dui) throws SQLException {
        String sql = "SELECT * FROM empleados WHERE dui = ?";
        try (Connection con = Conexion.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, dui);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapearEmpleado(rs);
                }
            }
        }
        return null;
    }

    public void insertar(Empleado e) throws SQLException {
        String sql = "INSERT INTO empleados (nombre, dui, tipo_persona, tipo_contratacion, telefono, correo, direccion, estado, creado_por, fecha_creacion, fecha_actualizacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = Conexion.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, e.getNombre());
            stmt.setString(2, e.getDui());
            stmt.setString(3, e.getTipo());
            stmt.setString(4, e.getContrato());
            stmt.setString(5, e.getTelefono());
            stmt.setString(6, e.getCorreo());
            stmt.setString(7, e.getDireccion());
            stmt.setString(8, e.isEstado() ? "Activo" : "Inactivo");
            stmt.setString(9, e.getCreadoPor());
            stmt.setDate(10, e.getFechaCreado());
            stmt.setDate(11, e.getFechaActualizado());
            stmt.executeUpdate();
        }
    }

    public void actualizar(Empleado e) throws SQLException {
        String sql = "UPDATE empleados SET nombre=?, tipo_persona=?, tipo_contratacion=?, telefono=?, correo=?, direccion=?, estado=?, fecha_actualizacion=? WHERE dui=?";

        try (Connection con = Conexion.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, e.getNombre());
            stmt.setString(2, e.getTipo());
            stmt.setString(3, e.getContrato());
            stmt.setString(4, e.getTelefono());
            stmt.setString(5, e.getCorreo());
            stmt.setString(6, e.getDireccion());
            stmt.setString(7, e.isEstado() ? "Activo" : "Inactivo");
            stmt.setDate(8, e.getFechaActualizado());
            stmt.setString(9, e.getDui());
            stmt.executeUpdate();
        }
    }

    public void cambiarEstado(String dui, boolean activar) throws SQLException {
        String sql = "UPDATE empleados SET estado = ?, fecha_inactivacion = ? WHERE dui = ?";
        try (Connection con = Conexion.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, activar ? "Activo" : "Inactivo");
            stmt.setDate(2, activar ? null : new Date(System.currentTimeMillis()));
            stmt.setString(3, dui);
            stmt.executeUpdate();
        }
    }

    public void eliminar(String dui) throws SQLException {
        String sql = "DELETE FROM empleados WHERE dui = ?";
        try (Connection conn = Conexion.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, dui);
            pstmt.executeUpdate();
        }
    }


    private Empleado mapearEmpleado(ResultSet rs) throws SQLException {
        return new Empleado(rs.getString("dui"), rs.getString("nombre"), rs.getString("telefono"), rs.getString("tipo_persona"), rs.getString("correo"), rs.getString("direccion"), "Activo".equals(rs.getString("estado")), rs.getString("creado_por"), rs.getDate("fecha_creacion"), rs.getDate("fecha_actualizacion"), rs.getDate("fecha_inactivacion"), rs.getString("tipo_contratacion"));
    }
}
