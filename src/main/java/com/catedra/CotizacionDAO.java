package com.catedra;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CotizacionDAO {

    // Obtener lista con DUI para mostrar en tabla
    public List<CotizacionDTO> obtenerTodosConDui() throws SQLException {
        List<CotizacionDTO> lista = new ArrayList<>();
        String sql = "SELECT c.id, cl.dui, c.fecha_creacion FROM cotizaciones c " +
                "JOIN clientes cl ON c.cliente_dui = cl.dui";

        try (Connection con = Conexion.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String dui = rs.getString("dui");
                Timestamp fecha = rs.getTimestamp("fecha_creacion");
                lista.add(new CotizacionDTO(id, dui, new java.sql.Date(fecha.getTime())));
            }
        }
        return lista;
    }

    // Insertar cotizacion
    public void insertar(Cotizacion cotizacion) throws SQLException {
        String sql = "INSERT INTO cotizaciones (cliente_dui) VALUES (?)";

        try (Connection conn = Conexion.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, cotizacion.getClienteDui());

            pstmt.executeUpdate();
        }
    }

    public Cotizacion obtenerPorId(int id) throws SQLException {
        String sql = "SELECT * FROM cotizaciones WHERE id = ?";
        try (Connection con = Conexion.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Cotizacion c = new Cotizacion();
                    c.setId(rs.getInt("id"));
                    c.setClienteDui(rs.getString("cliente_dui"));
                    c.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
                    return c;
                }
            }
        }
        return null;
    }
}
