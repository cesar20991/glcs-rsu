package emch.modelo.entidades;
// Generated 05-jun-2013 2:10:37 by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TControlviaje generated by hbm2java
 */
public class TControlviaje  implements java.io.Serializable {


     private TControlviajeId id;
     private TDespachodet TDespachodet;
     private Date fechaEmi;
     private String horaEstimada;
     private String horaReal;
     private String obs;
     private Set<TIncidencia> TIncidencias = new HashSet<TIncidencia>(0);
     private Set<TPesaje> TPesajes = new HashSet<TPesaje>(0);

    public TControlviaje() {
    }

	
    public TControlviaje(TControlviajeId id, TDespachodet TDespachodet, Date fechaEmi) {
        this.id = id;
        this.TDespachodet = TDespachodet;
        this.fechaEmi = fechaEmi;
    }
    public TControlviaje(TControlviajeId id, TDespachodet TDespachodet, Date fechaEmi, String horaEstimada, String horaReal, String obs, Set<TIncidencia> TIncidencias, Set<TPesaje> TPesajes) {
       this.id = id;
       this.TDespachodet = TDespachodet;
       this.fechaEmi = fechaEmi;
       this.horaEstimada = horaEstimada;
       this.horaReal = horaReal;
       this.obs = obs;
       this.TIncidencias = TIncidencias;
       this.TPesajes = TPesajes;
    }
   
    public TControlviajeId getId() {
        return this.id;
    }
    
    public void setId(TControlviajeId id) {
        this.id = id;
    }
    public TDespachodet getTDespachodet() {
        return this.TDespachodet;
    }
    
    public void setTDespachodet(TDespachodet TDespachodet) {
        this.TDespachodet = TDespachodet;
    }
    public Date getFechaEmi() {
        return this.fechaEmi;
    }
    
    public void setFechaEmi(Date fechaEmi) {
        this.fechaEmi = fechaEmi;
    }
    public String getHoraEstimada() {
        return this.horaEstimada;
    }
    
    public void setHoraEstimada(String horaEstimada) {
        this.horaEstimada = horaEstimada;
    }
    public String getHoraReal() {
        return this.horaReal;
    }
    
    public void setHoraReal(String horaReal) {
        this.horaReal = horaReal;
    }
    public String getObs() {
        return this.obs;
    }
    
    public void setObs(String obs) {
        this.obs = obs;
    }
    public Set<TIncidencia> getTIncidencias() {
        return this.TIncidencias;
    }
    
    public void setTIncidencias(Set<TIncidencia> TIncidencias) {
        this.TIncidencias = TIncidencias;
    }
    public Set<TPesaje> getTPesajes() {
        return this.TPesajes;
    }
    
    public void setTPesajes(Set<TPesaje> TPesajes) {
        this.TPesajes = TPesajes;
    }




}


