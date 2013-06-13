package emch.modelo.entidades;
// Generated 13-jun-2013 0:55:31 by Hibernate Tools 3.2.1.GA



/**
 * TAsignarruta generated by hbm2java
 */
public class TAsignarruta  implements java.io.Serializable {


     private String cdRuta;
     private TDespachodet TDespachodet;
     private Double latn;
     private Double lngn;
     private Double lats;
     private Double lngs;
     private int nroV;
     private String obs;

    public TAsignarruta() {
    }

	
    public TAsignarruta(String cdRuta, TDespachodet TDespachodet, int nroV) {
        this.cdRuta = cdRuta;
        this.TDespachodet = TDespachodet;
        this.nroV = nroV;
    }
    public TAsignarruta(String cdRuta, TDespachodet TDespachodet, Double latn, Double lngn, Double lats, Double lngs, int nroV, String obs) {
       this.cdRuta = cdRuta;
       this.TDespachodet = TDespachodet;
       this.latn = latn;
       this.lngn = lngn;
       this.lats = lats;
       this.lngs = lngs;
       this.nroV = nroV;
       this.obs = obs;
    }
   
    public String getCdRuta() {
        return this.cdRuta;
    }
    
    public void setCdRuta(String cdRuta) {
        this.cdRuta = cdRuta;
    }
    public TDespachodet getTDespachodet() {
        return this.TDespachodet;
    }
    
    public void setTDespachodet(TDespachodet TDespachodet) {
        this.TDespachodet = TDespachodet;
    }
    public Double getLatn() {
        return this.latn;
    }
    
    public void setLatn(Double latn) {
        this.latn = latn;
    }
    public Double getLngn() {
        return this.lngn;
    }
    
    public void setLngn(Double lngn) {
        this.lngn = lngn;
    }
    public Double getLats() {
        return this.lats;
    }
    
    public void setLats(Double lats) {
        this.lats = lats;
    }
    public Double getLngs() {
        return this.lngs;
    }
    
    public void setLngs(Double lngs) {
        this.lngs = lngs;
    }
    public int getNroV() {
        return this.nroV;
    }
    
    public void setNroV(int nroV) {
        this.nroV = nroV;
    }
    public String getObs() {
        return this.obs;
    }
    
    public void setObs(String obs) {
        this.obs = obs;
    }




}


