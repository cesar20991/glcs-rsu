package emch.modelo.entidades;
// Generated 31-may-2013 22:17:08 by Hibernate Tools 3.2.1.GA


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TComprobante generated by hbm2java
 */
public class TComprobante  implements java.io.Serializable {


     private String idComprobante;
     private TMoneda TMoneda;
     private TTipodoc TTipodoc;
     private TLiquidacion TLiquidacion;
     private Date fecMov;
     private String serie;
     private String nroDoc;
     private BigDecimal total;
     private BigDecimal subTotal;
     private BigDecimal igv;
     private String usuCrea;
     private Date fechaReg;
     private String usuModf;
     private Date fechaModf;
     private Set<TComprobantedet> TComprobantedets = new HashSet<TComprobantedet>(0);

    public TComprobante() {
    }

	
    public TComprobante(String idComprobante, TMoneda TMoneda, TTipodoc TTipodoc, TLiquidacion TLiquidacion, Date fecMov, String serie, String nroDoc, BigDecimal total, BigDecimal subTotal, BigDecimal igv, String usuCrea, Date fechaReg) {
        this.idComprobante = idComprobante;
        this.TMoneda = TMoneda;
        this.TTipodoc = TTipodoc;
        this.TLiquidacion = TLiquidacion;
        this.fecMov = fecMov;
        this.serie = serie;
        this.nroDoc = nroDoc;
        this.total = total;
        this.subTotal = subTotal;
        this.igv = igv;
        this.usuCrea = usuCrea;
        this.fechaReg = fechaReg;
    }
    public TComprobante(String idComprobante, TMoneda TMoneda, TTipodoc TTipodoc, TLiquidacion TLiquidacion, Date fecMov, String serie, String nroDoc, BigDecimal total, BigDecimal subTotal, BigDecimal igv, String usuCrea, Date fechaReg, String usuModf, Date fechaModf, Set<TComprobantedet> TComprobantedets) {
       this.idComprobante = idComprobante;
       this.TMoneda = TMoneda;
       this.TTipodoc = TTipodoc;
       this.TLiquidacion = TLiquidacion;
       this.fecMov = fecMov;
       this.serie = serie;
       this.nroDoc = nroDoc;
       this.total = total;
       this.subTotal = subTotal;
       this.igv = igv;
       this.usuCrea = usuCrea;
       this.fechaReg = fechaReg;
       this.usuModf = usuModf;
       this.fechaModf = fechaModf;
       this.TComprobantedets = TComprobantedets;
    }
   
    public String getIdComprobante() {
        return this.idComprobante;
    }
    
    public void setIdComprobante(String idComprobante) {
        this.idComprobante = idComprobante;
    }
    public TMoneda getTMoneda() {
        return this.TMoneda;
    }
    
    public void setTMoneda(TMoneda TMoneda) {
        this.TMoneda = TMoneda;
    }
    public TTipodoc getTTipodoc() {
        return this.TTipodoc;
    }
    
    public void setTTipodoc(TTipodoc TTipodoc) {
        this.TTipodoc = TTipodoc;
    }
    public TLiquidacion getTLiquidacion() {
        return this.TLiquidacion;
    }
    
    public void setTLiquidacion(TLiquidacion TLiquidacion) {
        this.TLiquidacion = TLiquidacion;
    }
    public Date getFecMov() {
        return this.fecMov;
    }
    
    public void setFecMov(Date fecMov) {
        this.fecMov = fecMov;
    }
    public String getSerie() {
        return this.serie;
    }
    
    public void setSerie(String serie) {
        this.serie = serie;
    }
    public String getNroDoc() {
        return this.nroDoc;
    }
    
    public void setNroDoc(String nroDoc) {
        this.nroDoc = nroDoc;
    }
    public BigDecimal getTotal() {
        return this.total;
    }
    
    public void setTotal(BigDecimal total) {
        this.total = total;
    }
    public BigDecimal getSubTotal() {
        return this.subTotal;
    }
    
    public void setSubTotal(BigDecimal subTotal) {
        this.subTotal = subTotal;
    }
    public BigDecimal getIgv() {
        return this.igv;
    }
    
    public void setIgv(BigDecimal igv) {
        this.igv = igv;
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
    public Set<TComprobantedet> getTComprobantedets() {
        return this.TComprobantedets;
    }
    
    public void setTComprobantedets(Set<TComprobantedet> TComprobantedets) {
        this.TComprobantedets = TComprobantedets;
    }




}


