package emch.modelo.entidades;
// Generated 03-jun-2013 0:51:45 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TMoneda generated by hbm2java
 */
public class TMoneda  implements java.io.Serializable {


     private String cdMda;
     private String nombre;
     private String simbolo;
     private boolean estado;
     private Set<TComprobante> TComprobantes = new HashSet<TComprobante>(0);

    public TMoneda() {
    }

	
    public TMoneda(String cdMda, String nombre, String simbolo, boolean estado) {
        this.cdMda = cdMda;
        this.nombre = nombre;
        this.simbolo = simbolo;
        this.estado = estado;
    }
    public TMoneda(String cdMda, String nombre, String simbolo, boolean estado, Set<TComprobante> TComprobantes) {
       this.cdMda = cdMda;
       this.nombre = nombre;
       this.simbolo = simbolo;
       this.estado = estado;
       this.TComprobantes = TComprobantes;
    }
   
    public String getCdMda() {
        return this.cdMda;
    }
    
    public void setCdMda(String cdMda) {
        this.cdMda = cdMda;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getSimbolo() {
        return this.simbolo;
    }
    
    public void setSimbolo(String simbolo) {
        this.simbolo = simbolo;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    public Set<TComprobante> getTComprobantes() {
        return this.TComprobantes;
    }
    
    public void setTComprobantes(Set<TComprobante> TComprobantes) {
        this.TComprobantes = TComprobantes;
    }




}


