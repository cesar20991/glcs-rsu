package emch.modelo.entidades;
// Generated 05-jun-2013 2:10:37 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TTipodoc generated by hbm2java
 */
public class TTipodoc  implements java.io.Serializable {


     private String cdTd;
     private String descrip;
     private String ncorto;
     private boolean estado;
     private Set<TComprobante> TComprobantes = new HashSet<TComprobante>(0);

    public TTipodoc() {
    }

	
    public TTipodoc(String cdTd, String descrip, boolean estado) {
        this.cdTd = cdTd;
        this.descrip = descrip;
        this.estado = estado;
    }
    public TTipodoc(String cdTd, String descrip, String ncorto, boolean estado, Set<TComprobante> TComprobantes) {
       this.cdTd = cdTd;
       this.descrip = descrip;
       this.ncorto = ncorto;
       this.estado = estado;
       this.TComprobantes = TComprobantes;
    }
   
    public String getCdTd() {
        return this.cdTd;
    }
    
    public void setCdTd(String cdTd) {
        this.cdTd = cdTd;
    }
    public String getDescrip() {
        return this.descrip;
    }
    
    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }
    public String getNcorto() {
        return this.ncorto;
    }
    
    public void setNcorto(String ncorto) {
        this.ncorto = ncorto;
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


