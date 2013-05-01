package emch.modelo.entidades;
// Generated 30-abr-2013 18:02:46 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TCamion generated by hbm2java
 */
public class TCamion  implements java.io.Serializable {


     private String cdCamion;
     private String placa;
     private String modelo;
     private String marca;
     private String anio;
     private String pesoBruto;
     private String tipoCombustible;
     private String direccion;
     private String cajaCambios;
     private String velocMax;
     private String kilometraje;
     private byte[] imagen;
     private boolean estado;
     private Set<TTrabajadorxcamion> TTrabajadorxcamions = new HashSet<TTrabajadorxcamion>(0);

    public TCamion() {
    }

	
    public TCamion(String cdCamion, String placa, String modelo, String marca, String anio, String pesoBruto, String tipoCombustible, String direccion, String cajaCambios, String velocMax, String kilometraje, boolean estado) {
        this.cdCamion = cdCamion;
        this.placa = placa;
        this.modelo = modelo;
        this.marca = marca;
        this.anio = anio;
        this.pesoBruto = pesoBruto;
        this.tipoCombustible = tipoCombustible;
        this.direccion = direccion;
        this.cajaCambios = cajaCambios;
        this.velocMax = velocMax;
        this.kilometraje = kilometraje;
        this.estado = estado;
    }
    public TCamion(String cdCamion, String placa, String modelo, String marca, String anio, String pesoBruto, String tipoCombustible, String direccion, String cajaCambios, String velocMax, String kilometraje, byte[] imagen, boolean estado, Set<TTrabajadorxcamion> TTrabajadorxcamions) {
       this.cdCamion = cdCamion;
       this.placa = placa;
       this.modelo = modelo;
       this.marca = marca;
       this.anio = anio;
       this.pesoBruto = pesoBruto;
       this.tipoCombustible = tipoCombustible;
       this.direccion = direccion;
       this.cajaCambios = cajaCambios;
       this.velocMax = velocMax;
       this.kilometraje = kilometraje;
       this.imagen = imagen;
       this.estado = estado;
       this.TTrabajadorxcamions = TTrabajadorxcamions;
    }
   
    public String getCdCamion() {
        return this.cdCamion;
    }
    
    public void setCdCamion(String cdCamion) {
        this.cdCamion = cdCamion;
    }
    public String getPlaca() {
        return this.placa;
    }
    
    public void setPlaca(String placa) {
        this.placa = placa;
    }
    public String getModelo() {
        return this.modelo;
    }
    
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public String getMarca() {
        return this.marca;
    }
    
    public void setMarca(String marca) {
        this.marca = marca;
    }
    public String getAnio() {
        return this.anio;
    }
    
    public void setAnio(String anio) {
        this.anio = anio;
    }
    public String getPesoBruto() {
        return this.pesoBruto;
    }
    
    public void setPesoBruto(String pesoBruto) {
        this.pesoBruto = pesoBruto;
    }
    public String getTipoCombustible() {
        return this.tipoCombustible;
    }
    
    public void setTipoCombustible(String tipoCombustible) {
        this.tipoCombustible = tipoCombustible;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getCajaCambios() {
        return this.cajaCambios;
    }
    
    public void setCajaCambios(String cajaCambios) {
        this.cajaCambios = cajaCambios;
    }
    public String getVelocMax() {
        return this.velocMax;
    }
    
    public void setVelocMax(String velocMax) {
        this.velocMax = velocMax;
    }
    public String getKilometraje() {
        return this.kilometraje;
    }
    
    public void setKilometraje(String kilometraje) {
        this.kilometraje = kilometraje;
    }
    public byte[] getImagen() {
        return this.imagen;
    }
    
    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    public Set<TTrabajadorxcamion> getTTrabajadorxcamions() {
        return this.TTrabajadorxcamions;
    }
    
    public void setTTrabajadorxcamions(Set<TTrabajadorxcamion> TTrabajadorxcamions) {
        this.TTrabajadorxcamions = TTrabajadorxcamions;
    }




}


