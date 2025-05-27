package com.catedra;

import java.util.Date;

public class CotizacionDTO {
    private int id;
    private String duiCliente;
    private Date fechaCreacion;

    public CotizacionDTO(int id, String duiCliente, Date fechaCreacion) {
        this.id = id;
        this.duiCliente = duiCliente;
        this.fechaCreacion = fechaCreacion;
    }

    public int getId() {
        return id;
    }

    public String getDuiCliente() {
        return duiCliente;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }
}
