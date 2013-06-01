package emch.modelo.entidades;
// Generated 31-may-2013 22:17:08 by Hibernate Tools 3.2.1.GA


import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * TCamion generated by hbm2java
 */
public class TCamion  implements java.io.Serializable {


     private String cdCamion;
     private TClase TClase;
     private TMarca TMarca;
     private int unidad;
     private String placa;
     private String anioFab;
     private String anioAdq;
     private String nroMotor;
     private BigDecimal pesoBruto;
     private String tipoCombustible;
     private BigDecimal kilometraje;
     private byte[] imagen;
     private boolean estado;
     private Set<TTrabajadorxcamion> TTrabajadorxcamions = new HashSet<TTrabajadorxcamion>(0);
     private Set<TSoatxcamion> TSoatxcamions = new HashSet<TSoatxcamion>(0);
     private Set<TSeguroxcamion> TSeguroxcamions = new HashSet<TSeguroxcamion>(0);

    public TCamion() {
    }

	
    public TCamion(String cdCamion, TClase TClase, TMarca TMarca, int unidad, String placa, String anioFab, String anioAdq, String nroMotor, BigDecimal pesoBruto, String tipoCombustible, BigDecimal kilometraje, boolean estado) {
        this.cdCamion = cdCamion;
        this.TClase = TClase;
        this.TMarca = TMarca;
        this.unidad = unidad;
        this.placa = placa;
        this.anioFab = anioFab;
        this.anioAdq = anioAdq;
        this.nroMotor = nroMotor;
        this.pesoBruto = pesoBruto;
        this.tipoCombustible = tipoCombustible;
        this.kilometraje = kilometraje;
        this.estado = estado;
    }
    public TCamion(String cdCamion, TClase TClase, TMarca TMarca, int unidad, String placa, String anioFab, String anioAdq, String nroMotor, BigDecimal pesoBruto, String tipoCombustible, BigDecimal kilometraje, byte[] imagen, boolean estado, Set<TTrabajadorxcamion> TTrabajadorxcamions, Set<TSoatxcamion> TSoatxcamions, Set<TSeguroxcamion> TSeguroxcamions) {
       this.cdCamion = cdCamion;
       this.TClase = TClase;
       this.TMarca = TMarca;
       this.unidad = unidad;
       this.placa = placa;
       this.anioFab = anioFab;
       this.anioAdq = anioAdq;
       this.nroMotor = nroMotor;
       this.pesoBruto = pesoBruto;
       this.tipoCombustible = tipoCombustible;
       this.kilometraje = kilometraje;
       this.imagen = imagen;
       this.estado = estado;
       this.TTrabajadorxcamions = TTrabajadorxcamions;
       this.TSoatxcamions = TSoatxcamions;
       this.TSeguroxcamions = TSeguroxcamions;
    }
   
    public String getCdCamion() {
        return this.cdCamion;
    }
    
    public void setCdCamion(String cdCamion) {
        this.cdCamion = cdCamion;
    }
    public TClase getTClase() {
        return this.TClase;
    }
    
    public void setTClase(TClase TClase) {
        this.TClase = TClase;
    }
    public TMarca getTMarca() {
        return this.TMarca;
    }
    
    public void setTMarca(TMarca TMarca) {
        this.TMarca = TMarca;
    }
    public int getUnidad() {
        return this.unidad;
    }
    
    public void setUnidad(int unidad) {
        this.unidad = unidad;
    }
    public String getPlaca() {
        return this.placa;
    }
    
    public void setPlaca(String placa) {
        this.placa = placa;
    }
    public String getAnioFab() {
        return this.anioFab;
    }
    
    public void setAnioFab(String anioFab) {
        this.anioFab = anioFab;
    }
    public String getAnioAdq() {
        return this.anioAdq;
    }
    
    public void setAnioAdq(String anioAdq) {
        this.anioAdq = anioAdq;
    }
    public String getNroMotor() {
        return this.nroMotor;
    }
    
    public void setNroMotor(String nroMotor) {
        this.nroMotor = nroMotor;
    }
    public BigDecimal getPesoBruto() {
        return this.pesoBruto;
    }
    
    public void setPesoBruto(BigDecimal pesoBruto) {
        this.pesoBruto = pesoBruto;
    }
    public String getTipoCombustible() {
        return this.tipoCombustible;
    }
    
    public void setTipoCombustible(String tipoCombustible) {
        this.tipoCombustible = tipoCombustible;
    }
    public BigDecimal getKilometraje() {
        return this.kilometraje;
    }
    
    public void setKilometraje(BigDecimal kilometraje) {
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
    public Set<TSoatxcamion> getTSoatxcamions() {
        return this.TSoatxcamions;
    }
    
    public void setTSoatxcamions(Set<TSoatxcamion> TSoatxcamions) {
        this.TSoatxcamions = TSoatxcamions;
    }
    public Set<TSeguroxcamion> getTSeguroxcamions() {
        return this.TSeguroxcamions;
    }
    
    public void setTSeguroxcamions(Set<TSeguroxcamion> TSeguroxcamions) {
        this.TSeguroxcamions = TSeguroxcamions;
    }




}


