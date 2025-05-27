package com.catedra;

import java.sql.Date;

public class Persona {
    private String dui;
    private String nombre;
    private String telefono;
    private String tipo;
    private String correo;
    private String direccion;
    private boolean estado;
    private String creadoPor;
    private Date fechaCreado;
    private Date fechaActualizado;
    private Date fechaInactivo;

    public Persona(String dui, String nombre, String telefono, String tipo, String correo,
                   String direccion, boolean estado, String creadoPor, Date fechaCreado,
                   Date fechaActualizado, Date fechaInactivo) {
        this.dui = dui;
        this.nombre = nombre;
        this.telefono = telefono;
        this.tipo = tipo;
        this.correo = correo;
        this.direccion = direccion;
        this.estado = estado;
        this.creadoPor = creadoPor;
        this.fechaCreado = fechaCreado;
        this.fechaActualizado = fechaActualizado;
        this.fechaInactivo = fechaInactivo;
    }

    // Getters y setters

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public boolean isEstado() {
        return estado;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public String getCreadoPor() {
        return creadoPor;
    }

    public void setCreadoPor(String creadoPor) {
        this.creadoPor = creadoPor;
    }

    public Date getFechaCreado() {
        return fechaCreado;
    }

    public void setFechaCreado(Date fechaCreado) {
        this.fechaCreado = fechaCreado;
    }

    public Date getFechaActualizado() {
        return fechaActualizado;
    }

    public void setFechaActualizado(Date fechaActualizado) {
        this.fechaActualizado = fechaActualizado;
    }

    public Date getFechaInactivo() {
        return fechaInactivo;
    }

    public void setFechaInactivo(Date fechaInactivo) {
        this.fechaInactivo = fechaInactivo;
    }
}
