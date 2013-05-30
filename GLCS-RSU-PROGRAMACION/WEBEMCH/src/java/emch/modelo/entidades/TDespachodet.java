package emch.modelo.entidades;
// Generated 30-may-2013 7:59:42 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TDespachodet generated by hbm2java
 */
public class TDespachodet  implements java.io.Serializable {


     private TDespachodetId id;
     private TDespacho TDespacho;
     private TTrabajadorxcamion TTrabajadorxcamion;
     private String cantViaje;
     private Character evaluacion;
     private Set<TControlviaje> TControlviajes = new HashSet<TControlviaje>(0);
     private Set<TAsignarruta> TAsignarrutas = new HashSet<TAsignarruta>(0);

    public TDespachodet() {
    }

	
    public TDespachodet(TDespachodetId id, TDespacho TDespacho, TTrabajadorxcamion TTrabajadorxcamion, String cantViaje) {
        this.id = id;
        this.TDespacho = TDespacho;
        this.TTrabajadorxcamion = TTrabajadorxcamion;
        this.cantViaje = cantViaje;
    }
    public TDespachodet(TDespachodetId id, TDespacho TDespacho, TTrabajadorxcamion TTrabajadorxcamion, String cantViaje, Character evaluacion, Set<TControlviaje> TControlviajes, Set<TAsignarruta> TAsignarrutas) {
       this.id = id;
       this.TDespacho = TDespacho;
       this.TTrabajadorxcamion = TTrabajadorxcamion;
       this.cantViaje = cantViaje;
       this.evaluacion = evaluacion;
       this.TControlviajes = TControlviajes;
       this.TAsignarrutas = TAsignarrutas;
    }
   
    public TDespachodetId getId() {
        return this.id;
    }
    
    public void setId(TDespachodetId id) {
        this.id = id;
    }
    public TDespacho getTDespacho() {
        return this.TDespacho;
    }
    
    public void setTDespacho(TDespacho TDespacho) {
        this.TDespacho = TDespacho;
    }
    public TTrabajadorxcamion getTTrabajadorxcamion() {
        return this.TTrabajadorxcamion;
    }
    
    public void setTTrabajadorxcamion(TTrabajadorxcamion TTrabajadorxcamion) {
        this.TTrabajadorxcamion = TTrabajadorxcamion;
    }
    public String getCantViaje() {
        return this.cantViaje;
    }
    
    public void setCantViaje(String cantViaje) {
        this.cantViaje = cantViaje;
    }
    public Character getEvaluacion() {
        return this.evaluacion;
    }
    
    public void setEvaluacion(Character evaluacion) {
        this.evaluacion = evaluacion;
    }
    public Set<TControlviaje> getTControlviajes() {
        return this.TControlviajes;
    }
    
    public void setTControlviajes(Set<TControlviaje> TControlviajes) {
        this.TControlviajes = TControlviajes;
    }
    public Set<TAsignarruta> getTAsignarrutas() {
        return this.TAsignarrutas;
    }
    
    public void setTAsignarrutas(Set<TAsignarruta> TAsignarrutas) {
        this.TAsignarrutas = TAsignarrutas;
    }




}


