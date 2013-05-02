package emch.modelo.entidades;
// Generated 30-abr-2013 18:02:46 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TMenu generated by hbm2java
 */
public class TMenu  implements java.io.Serializable {


     private String cdMenu;
     private String nombre;
     private boolean estado;
     private Set<TAccesom> TAccesoms = new HashSet<TAccesom>(0);

    public TMenu() {
    }

	
    public TMenu(String cdMenu, String nombre, boolean estado) {
        this.cdMenu = cdMenu;
        this.nombre = nombre;
        this.estado = estado;
    }
    public TMenu(String cdMenu, String nombre, boolean estado, Set<TAccesom> TAccesoms) {
       this.cdMenu = cdMenu;
       this.nombre = nombre;
       this.estado = estado;
       this.TAccesoms = TAccesoms;
    }
   
    public String getCdMenu() {
        return this.cdMenu;
    }
    
    public void setCdMenu(String cdMenu) {
        this.cdMenu = cdMenu;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    public Set<TAccesom> getTAccesoms() {
        return this.TAccesoms;
    }
    
    public void setTAccesoms(Set<TAccesom> TAccesoms) {
        this.TAccesoms = TAccesoms;
    }




}

