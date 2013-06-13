package emch.modelo.entidades;
// Generated 13-jun-2013 0:55:31 by Hibernate Tools 3.2.1.GA


import java.math.BigDecimal;
import java.util.Date;

/**
 * TPesaje generated by hbm2java
 */
public class TPesaje  implements java.io.Serializable {


     private String cdPesaje;
     private TControlviaje TControlviaje;
     private TLiquidacion TLiquidacion;
     private int nroPesaje;
     private Date fechaPesaje;
     private BigDecimal pesoBruto;
     private BigDecimal tara;
     private BigDecimal pesoTn;
     private String estadoPesaje;
     private String usuCrea;
     private Date fechaReg;
     private String usuModf;
     private Date fechaModf;
     private String obs;
     private byte[] imagenP;

    public TPesaje() {
    }

	
    public TPesaje(String cdPesaje, TControlviaje TControlviaje, int nroPesaje, Date fechaPesaje, BigDecimal pesoBruto, BigDecimal tara, BigDecimal pesoTn, String estadoPesaje, String usuCrea, Date fechaReg) {
        this.cdPesaje = cdPesaje;
        this.TControlviaje = TControlviaje;
        this.nroPesaje = nroPesaje;
        this.fechaPesaje = fechaPesaje;
        this.pesoBruto = pesoBruto;
        this.tara = tara;
        this.pesoTn = pesoTn;
        this.estadoPesaje = estadoPesaje;
        this.usuCrea = usuCrea;
        this.fechaReg = fechaReg;
    }
    public TPesaje(String cdPesaje, TControlviaje TControlviaje, TLiquidacion TLiquidacion, int nroPesaje, Date fechaPesaje, BigDecimal pesoBruto, BigDecimal tara, BigDecimal pesoTn, String estadoPesaje, String usuCrea, Date fechaReg, String usuModf, Date fechaModf, String obs, byte[] imagenP) {
       this.cdPesaje = cdPesaje;
       this.TControlviaje = TControlviaje;
       this.TLiquidacion = TLiquidacion;
       this.nroPesaje = nroPesaje;
       this.fechaPesaje = fechaPesaje;
       this.pesoBruto = pesoBruto;
       this.tara = tara;
       this.pesoTn = pesoTn;
       this.estadoPesaje = estadoPesaje;
       this.usuCrea = usuCrea;
       this.fechaReg = fechaReg;
       this.usuModf = usuModf;
       this.fechaModf = fechaModf;
       this.obs = obs;
       this.imagenP = imagenP;
    }
   
    public String getCdPesaje() {
        return this.cdPesaje;
    }
    
    public void setCdPesaje(String cdPesaje) {
        this.cdPesaje = cdPesaje;
    }
    public TControlviaje getTControlviaje() {
        return this.TControlviaje;
    }
    
    public void setTControlviaje(TControlviaje TControlviaje) {
        this.TControlviaje = TControlviaje;
    }
    public TLiquidacion getTLiquidacion() {
        return this.TLiquidacion;
    }
    
    public void setTLiquidacion(TLiquidacion TLiquidacion) {
        this.TLiquidacion = TLiquidacion;
    }
    public int getNroPesaje() {
        return this.nroPesaje;
    }
    
    public void setNroPesaje(int nroPesaje) {
        this.nroPesaje = nroPesaje;
    }
    public Date getFechaPesaje() {
        return this.fechaPesaje;
    }
    
    public void setFechaPesaje(Date fechaPesaje) {
        this.fechaPesaje = fechaPesaje;
    }
    public BigDecimal getPesoBruto() {
        return this.pesoBruto;
    }
    
    public void setPesoBruto(BigDecimal pesoBruto) {
        this.pesoBruto = pesoBruto;
    }
    public BigDecimal getTara() {
        return this.tara;
    }
    
    public void setTara(BigDecimal tara) {
        this.tara = tara;
    }
    public BigDecimal getPesoTn() {
        return this.pesoTn;
    }
    
    public void setPesoTn(BigDecimal pesoTn) {
        this.pesoTn = pesoTn;
    }
    public String getEstadoPesaje() {
        return this.estadoPesaje;
    }
    
    public void setEstadoPesaje(String estadoPesaje) {
        this.estadoPesaje = estadoPesaje;
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
    public String getObs() {
        return this.obs;
    }
    
    public void setObs(String obs) {
        this.obs = obs;
    }
    public byte[] getImagenP() {
        return this.imagenP;
    }
    
    public void setImagenP(byte[] imagenP) {
        this.imagenP = imagenP;
    }




}


