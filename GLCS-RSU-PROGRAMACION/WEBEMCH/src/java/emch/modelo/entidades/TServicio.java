package emch.modelo.entidades;
// Generated 01/11/2013 08:35:39 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TServicio generated by hbm2java
 */
public class TServicio  implements java.io.Serializable {


     private String cdServicio;
     private String nombreServ;
     private String descripServ;
     private String ncortoServ;
     private Set<TComprobantedet> TComprobantedets = new HashSet<TComprobantedet>(0);

    public TServicio() {
    }

	
    public TServicio(String cdServicio, String nombreServ, String descripServ) {
        this.cdServicio = cdServicio;
        this.nombreServ = nombreServ;
        this.descripServ = descripServ;
    }
    public TServicio(String cdServicio, String nombreServ, String descripServ, String ncortoServ, Set<TComprobantedet> TComprobantedets) {
       this.cdServicio = cdServicio;
       this.nombreServ = nombreServ;
       this.descripServ = descripServ;
       this.ncortoServ = ncortoServ;
       this.TComprobantedets = TComprobantedets;
    }
   
    public String getCdServicio() {
        return this.cdServicio;
    }
    
    public void setCdServicio(String cdServicio) {
        this.cdServicio = cdServicio;
    }
    public String getNombreServ() {
        return this.nombreServ;
    }
    
    public void setNombreServ(String nombreServ) {
        this.nombreServ = nombreServ;
    }
    public String getDescripServ() {
        return this.descripServ;
    }
    
    public void setDescripServ(String descripServ) {
        this.descripServ = descripServ;
    }
    public String getNcortoServ() {
        return this.ncortoServ;
    }
    
    public void setNcortoServ(String ncortoServ) {
        this.ncortoServ = ncortoServ;
    }
    public Set<TComprobantedet> getTComprobantedets() {
        return this.TComprobantedets;
    }
    
    public void setTComprobantedets(Set<TComprobantedet> TComprobantedets) {
        this.TComprobantedets = TComprobantedets;
    }




}


