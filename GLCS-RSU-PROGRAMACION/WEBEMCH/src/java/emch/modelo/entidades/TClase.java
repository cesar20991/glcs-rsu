package emch.modelo.entidades;
// Generated 30-may-2013 7:59:42 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TClase generated by hbm2java
 */
public class TClase  implements java.io.Serializable {


     private int idClase;
     private String nombre;
     private String descripcion;
     private Set<TCamion> TCamions = new HashSet<TCamion>(0);

    public TClase() {
    }

	
    public TClase(int idClase, String nombre) {
        this.idClase = idClase;
        this.nombre = nombre;
    }
    public TClase(int idClase, String nombre, String descripcion, Set<TCamion> TCamions) {
       this.idClase = idClase;
       this.nombre = nombre;
       this.descripcion = descripcion;
       this.TCamions = TCamions;
    }
   
    public int getIdClase() {
        return this.idClase;
    }
    
    public void setIdClase(int idClase) {
        this.idClase = idClase;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Set<TCamion> getTCamions() {
        return this.TCamions;
    }
    
    public void setTCamions(Set<TCamion> TCamions) {
        this.TCamions = TCamions;
    }




}


