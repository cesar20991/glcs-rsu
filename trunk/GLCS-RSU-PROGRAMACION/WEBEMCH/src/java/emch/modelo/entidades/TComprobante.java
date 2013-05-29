package emch.modelo.entidades;
// Generated May 23, 2013 7:57:08 PM by Hibernate Tools 3.2.1.GA


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
     private String fecMov;
     private String serie;
     private String nroSerie;
     private BigDecimal total;
     private BigDecimal subTotal;
     private BigDecimal igv;
     private String usuCrea;
     private Date fecReg;
     private Set<TComprobantedet> TComprobantedets = new HashSet<TComprobantedet>(0);

    public TComprobante() {
    }

	
    public TComprobante(String idComprobante, TMoneda TMoneda, TTipodoc TTipodoc, TLiquidacion TLiquidacion, String fecMov, String serie, String nroSerie, BigDecimal total, BigDecimal subTotal, BigDecimal igv, String usuCrea, Date fecReg) {
        this.idComprobante = idComprobante;
        this.TMoneda = TMoneda;
        this.TTipodoc = TTipodoc;
        this.TLiquidacion = TLiquidacion;
        this.fecMov = fecMov;
        this.serie = serie;
        this.nroSerie = nroSerie;
        this.total = total;
        this.subTotal = subTotal;
        this.igv = igv;
        this.usuCrea = usuCrea;
        this.fecReg = fecReg;
    }
    public TComprobante(String idComprobante, TMoneda TMoneda, TTipodoc TTipodoc, TLiquidacion TLiquidacion, String fecMov, String serie, String nroSerie, BigDecimal total, BigDecimal subTotal, BigDecimal igv, String usuCrea, Date fecReg, Set<TComprobantedet> TComprobantedets) {
       this.idComprobante = idComprobante;
       this.TMoneda = TMoneda;
       this.TTipodoc = TTipodoc;
       this.TLiquidacion = TLiquidacion;
       this.fecMov = fecMov;
       this.serie = serie;
       this.nroSerie = nroSerie;
       this.total = total;
       this.subTotal = subTotal;
       this.igv = igv;
       this.usuCrea = usuCrea;
       this.fecReg = fecReg;
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
    public String getFecMov() {
        return this.fecMov;
    }
    
    public void setFecMov(String fecMov) {
        this.fecMov = fecMov;
    }
    public String getSerie() {
        return this.serie;
    }
    
    public void setSerie(String serie) {
        this.serie = serie;
    }
    public String getNroSerie() {
        return this.nroSerie;
    }
    
    public void setNroSerie(String nroSerie) {
        this.nroSerie = nroSerie;
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
    public Date getFecReg() {
        return this.fecReg;
    }
    
    public void setFecReg(Date fecReg) {
        this.fecReg = fecReg;
    }
    public Set<TComprobantedet> getTComprobantedets() {
        return this.TComprobantedets;
    }
    
    public void setTComprobantedets(Set<TComprobantedet> TComprobantedets) {
        this.TComprobantedets = TComprobantedets;
    }




}

