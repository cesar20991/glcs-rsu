package emch.modelo.entidades;
// Generated 30-abr-2013 18:02:46 by Hibernate Tools 3.2.1.GA



/**
 * TAsignarruta generated by hbm2java
 */
public class TAsignarruta  implements java.io.Serializable {


     private String cdRuta;
     private TDespachodet TDespachodet;
     private String center;
     private String latitud;
     private String longitud;
     private String tipo;

    public TAsignarruta() {
    }

    public TAsignarruta(String cdRuta, TDespachodet TDespachodet, String center, String latitud, String longitud, String tipo) {
       this.cdRuta = cdRuta;
       this.TDespachodet = TDespachodet;
       this.center = center;
       this.latitud = latitud;
       this.longitud = longitud;
       this.tipo = tipo;
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
    public String getCenter() {
        return this.center;
    }
    
    public void setCenter(String center) {
        this.center = center;
    }
    public String getLatitud() {
        return this.latitud;
    }
    
    public void setLatitud(String latitud) {
        this.latitud = latitud;
    }
    public String getLongitud() {
        return this.longitud;
    }
    
    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }




}


