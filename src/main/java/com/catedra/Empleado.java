package com.catedra;

import java.sql.Date;

public class Empleado extends Persona {
    private static String contrato;


    public Empleado(String dui, String nombre, String telefono, String tipo, String correo, String direccion, boolean estado, String creadoPor, Date fechaCreado, Date fechaActualizado, Date fechaInactivo, String contrato) {
        super(dui, nombre, telefono, tipo, correo, direccion, estado, creadoPor, fechaCreado, fechaActualizado, fechaInactivo);
        this.contrato = contrato;
    }

    public static String getContrato() {
        return contrato;
    }

    public static void setContrato(String contrato) {
        Empleado.contrato = contrato;
    }
}
