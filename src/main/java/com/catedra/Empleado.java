package com.catedra;

import java.sql.Date;

public class Empleado extends Persona {
    private String contrato;

    public Empleado(String dui, String nombre, String telefono, String tipo, String correo,
                    String direccion, boolean estado, String creadoPor, Date fechaCreado,
                    Date fechaActualizado, Date fechaInactivo, String contrato) {
        super(dui, nombre, telefono, tipo, correo, direccion, estado, creadoPor, fechaCreado, fechaActualizado, fechaInactivo);
        this.contrato = contrato;
    }

    public String getContrato() {
        return contrato;
    }

    public void setContrato(String contrato) {
        this.contrato = contrato;
    }
}

