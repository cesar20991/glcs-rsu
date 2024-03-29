package emch.modelo.entidades;
// Generated 01/11/2013 08:35:39 PM by Hibernate Tools 3.2.1.GA


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TLiquidacion generated by hbm2java
 */
public class TLiquidacion  implements java.io.Serializable {


     private String cdLiq;
     private TTipoliquidacion TTipoliquidacion;
     private TEmpresa TEmpresa;
     private Date fechaApertura;
     private Date fechaInicio;
     private Date fechaFin;
     private BigDecimal totalTn;
     private String asunto;
     private String usuCrea;
     private Date fechaReg;
     private String usuModf;
     private Date fechaModf;
     private Set<TPesaje> TPesajes = new HashSet<TPesaje>(0);
     private Set<TComprobante> TComprobantes = new HashSet<TComprobante>(0);
     private Set<TEstadoxliquidacion> TEstadoxliquidacions = new HashSet<TEstadoxliquidacion>(0);

    public TLiquidacion() {
    }

	
    public TLiquidacion(String cdLiq, TTipoliquidacion TTipoliquidacion, TEmpresa TEmpresa, Date fechaApertura, Date fechaInicio, Date fechaFin, String usuCrea, Date fechaReg) {
        this.cdLiq = cdLiq;
        this.TTipoliquidacion = TTipoliquidacion;
        this.TEmpresa = TEmpresa;
        this.fechaApertura = fechaApertura;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.usuCrea = usuCrea;
        this.fechaReg = fechaReg;
    }
    public TLiquidacion(String cdLiq, TTipoliquidacion TTipoliquidacion, TEmpresa TEmpresa, Date fechaApertura, Date fechaInicio, Date fechaFin, BigDecimal totalTn, String asunto, String usuCrea, Date fechaReg, String usuModf, Date fechaModf, Set<TPesaje> TPesajes, Set<TComprobante> TComprobantes, Set<TEstadoxliquidacion> TEstadoxliquidacions) {
       this.cdLiq = cdLiq;
       this.TTipoliquidacion = TTipoliquidacion;
       this.TEmpresa = TEmpresa;
       this.fechaApertura = fechaApertura;
       this.fechaInicio = fechaInicio;
       this.fechaFin = fechaFin;
       this.totalTn = totalTn;
       this.asunto = asunto;
       this.usuCrea = usuCrea;
       this.fechaReg = fechaReg;
       this.usuModf = usuModf;
       this.fechaModf = fechaModf;
       this.TPesajes = TPesajes;
       this.TComprobantes = TComprobantes;
       this.TEstadoxliquidacions = TEstadoxliquidacions;
    }
   
    public String getCdLiq() {
        return this.cdLiq;
    }
    
    public void setCdLiq(String cdLiq) {
        this.cdLiq = cdLiq;
    }
    public TTipoliquidacion getTTipoliquidacion() {
        return this.TTipoliquidacion;
    }
    
    public void setTTipoliquidacion(TTipoliquidacion TTipoliquidacion) {
        this.TTipoliquidacion = TTipoliquidacion;
    }
    public TEmpresa getTEmpresa() {
        return this.TEmpresa;
    }
    
    public void setTEmpresa(TEmpresa TEmpresa) {
        this.TEmpresa = TEmpresa;
    }
    public Date getFechaApertura() {
        return this.fechaApertura;
    }
    
    public void setFechaApertura(Date fechaApertura) {
        this.fechaApertura = fechaApertura;
    }
    public Date getFechaInicio() {
        return this.fechaInicio;
    }
    
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }
    public Date getFechaFin() {
        return this.fechaFin;
    }
    
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }
    public BigDecimal getTotalTn() {
        return this.totalTn;
    }
    
    public void setTotalTn(BigDecimal totalTn) {
        this.totalTn = totalTn;
    }
    public String getAsunto() {
        return this.asunto;
    }
    
    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }
    public String getUsuCrea() {
        return this.usuCrea;
    }
    
    public void setUsuCrea(String usuCrea) {
        this.usuCrea = usuCrea;
    }
    public Date getFechaReg() {
        return this.fechaReg;
    }
    
    public void setFechaReg(Date fechaReg) {
        this.fechaReg = fechaReg;
    }
    public String getUsuModf() {
        return this.usuModf;
    }
    
    public void setUsuModf(String usuModf) {
        this.usuModf = usuModf;
    }
    public Date getFechaModf() {
        return this.fechaModf;
    }
    
    public void setFechaModf(Date fechaModf) {
        this.fechaModf = fechaModf;
    }
    public Set<TPesaje> getTPesajes() {
        return this.TPesajes;
    }
    
    public void setTPesajes(Set<TPesaje> TPesajes) {
        this.TPesajes = TPesajes;
    }
    public Set<TComprobante> getTComprobantes() {
        return this.TComprobantes;
    }
    
    public void setTComprobantes(Set<TComprobante> TComprobantes) {
        this.TComprobantes = TComprobantes;
    }
    public Set<TEstadoxliquidacion> getTEstadoxliquidacions() {
        return this.TEstadoxliquidacions;
    }
    
    public void setTEstadoxliquidacions(Set<TEstadoxliquidacion> TEstadoxliquidacions) {
        this.TEstadoxliquidacions = TEstadoxliquidacions;
    }




}


