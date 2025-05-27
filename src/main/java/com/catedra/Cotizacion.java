package com.catedra;

import java.util.Date;

public class Cotizacion {
    private int id;
    private String clienteDui;
    private Date fechaCreacion;

    public Cotizacion() {
    }

    public Cotizacion(int id, String clienteDui, Date fechaCreacion) {
        this.id = id;
        this.clienteDui = clienteDui;
        this.fechaCreacion = fechaCreacion;
    }

    // getters y setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getClienteDui() {
        return clienteDui;
    }

    public void setClienteDui(String clienteDui) {
        this.clienteDui = clienteDui;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}
