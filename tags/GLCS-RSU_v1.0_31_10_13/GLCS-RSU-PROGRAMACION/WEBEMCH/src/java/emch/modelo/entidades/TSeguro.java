package emch.modelo.entidades;
// Generated 13-jun-2013 0:55:31 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TSeguro generated by hbm2java
 */
public class TSeguro  implements java.io.Serializable {


     private String idSeguro;
     private String nombreSeguro;
     private String descripcion;
     private String telf;
     private Set<TSeguroxcamion> TSeguroxcamions = new HashSet<TSeguroxcamion>(0);

    public TSeguro() {
    }

	
    public TSeguro(String idSeguro, String nombreSeguro) {
        this.idSeguro = idSeguro;
        this.nombreSeguro = nombreSeguro;
    }
    public TSeguro(String idSeguro, String nombreSeguro, String descripcion, String telf, Set<TSeguroxcamion> TSeguroxcamions) {
       this.idSeguro = idSeguro;
       this.nombreSeguro = nombreSeguro;
       this.descripcion = descripcion;
       this.telf = telf;
       this.TSeguroxcamions = TSeguroxcamions;
    }
   
    public String getIdSeguro() {
        return this.idSeguro;
    }
    
    public void setIdSeguro(String idSeguro) {
        this.idSeguro = idSeguro;
    }
    public String getNombreSeguro() {
        return this.nombreSeguro;
    }
    
    public void setNombreSeguro(String nombreSeguro) {
        this.nombreSeguro = nombreSeguro;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public String getTelf() {
        return this.telf;
    }
    
    public void setTelf(String telf) {
        this.telf = telf;
    }
    public Set<TSeguroxcamion> getTSeguroxcamions() {
        return this.TSeguroxcamions;
    }
    
    public void setTSeguroxcamions(Set<TSeguroxcamion> TSeguroxcamions) {
        this.TSeguroxcamions = TSeguroxcamions;
    }




}


