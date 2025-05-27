package com.catedra;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Conexion {
    //variables de conexion
    private static final String URL = "jdbc:mysql://localhost:3306/catedra";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException {
        try {
            //inicio del drivger
            Class.forName("com.mysql.cj.jdbc.Driver");

            //retornar la conexion
            return DriverManager.getConnection(URL, USER, PASSWORD);

        } catch (ClassNotFoundException e) {
            //devolver erroers
            throw new SQLException("Driver JDBC no encontrado :V", e);
        }
    }

     //cerrar conexion
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }


}
