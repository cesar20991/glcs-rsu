package emch.modelo.entidades;
// Generated May 23, 2013 7:57:08 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TTipoliquidacion generated by hbm2java
 */
public class TTipoliquidacion  implements java.io.Serializable {


     private String cdTipoLiq;
     private String nombre;
     private Set<TLiquidacion> TLiquidacions = new HashSet<TLiquidacion>(0);

    public TTipoliquidacion() {
    }

	
    public TTipoliquidacion(String cdTipoLiq, String nombre) {
        this.cdTipoLiq = cdTipoLiq;
        this.nombre = nombre;
    }
    public TTipoliquidacion(String cdTipoLiq, String nombre, Set<TLiquidacion> TLiquidacions) {
       this.cdTipoLiq = cdTipoLiq;
       this.nombre = nombre;
       this.TLiquidacions = TLiquidacions;
    }
   
    public String getCdTipoLiq() {
        return this.cdTipoLiq;
    }
    
    public void setCdTipoLiq(String cdTipoLiq) {
        this.cdTipoLiq = cdTipoLiq;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Set<TLiquidacion> getTLiquidacions() {
        return this.TLiquidacions;
    }
    
    public void setTLiquidacions(Set<TLiquidacion> TLiquidacions) {
        this.TLiquidacions = TLiquidacions;
    }




}


