package com.catedra;

import java.sql.Date;

public class Cliente extends Persona {
    public Cliente(String dui, String nombre, String telefono, String tipo, String correo, String direccion, boolean estado, String creadoPor, Date fechaCreado, Date fechaActualizado, Date fechaInactivo) {
        super(dui, nombre, telefono, tipo, correo, direccion, estado, creadoPor, fechaCreado, fechaActualizado, fechaInactivo);
    }

    public String getId() {
        return getDui();
    }

}
