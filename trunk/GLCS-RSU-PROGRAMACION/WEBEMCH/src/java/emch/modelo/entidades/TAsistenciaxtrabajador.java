package emch.modelo.entidades;
// Generated 03-jun-2013 0:51:45 by Hibernate Tools 3.2.1.GA



/**
 * TAsistenciaxtrabajador generated by hbm2java
 */
public class TAsistenciaxtrabajador  implements java.io.Serializable {


     private TAsistenciaxtrabajadorId id;
     private TTrabajador TTrabajador;
     private TAsistencia TAsistencia;
     private Boolean asiste;
     private Boolean tardanza;
     private Boolean fustifica;

    public TAsistenciaxtrabajador() {
    }

	
    public TAsistenciaxtrabajador(TAsistenciaxtrabajadorId id, TTrabajador TTrabajador, TAsistencia TAsistencia) {
        this.id = id;
        this.TTrabajador = TTrabajador;
        this.TAsistencia = TAsistencia;
    }
    public TAsistenciaxtrabajador(TAsistenciaxtrabajadorId id, TTrabajador TTrabajador, TAsistencia TAsistencia, Boolean asiste, Boolean tardanza, Boolean fustifica) {
       this.id = id;
       this.TTrabajador = TTrabajador;
       this.TAsistencia = TAsistencia;
       this.asiste = asiste;
       this.tardanza = tardanza;
       this.fustifica = fustifica;
    }
   
    public TAsistenciaxtrabajadorId getId() {
        return this.id;
    }
    
    public void setId(TAsistenciaxtrabajadorId id) {
        this.id = id;
    }
    public TTrabajador getTTrabajador() {
        return this.TTrabajador;
    }
    
    public void setTTrabajador(TTrabajador TTrabajador) {
        this.TTrabajador = TTrabajador;
    }
    public TAsistencia getTAsistencia() {
        return this.TAsistencia;
    }
    
    public void setTAsistencia(TAsistencia TAsistencia) {
        this.TAsistencia = TAsistencia;
    }
    public Boolean getAsiste() {
        return this.asiste;
    }
    
    public void setAsiste(Boolean asiste) {
        this.asiste = asiste;
    }
    public Boolean getTardanza() {
        return this.tardanza;
    }
    
    public void setTardanza(Boolean tardanza) {
        this.tardanza = tardanza;
    }
    public Boolean getFustifica() {
        return this.fustifica;
    }
    
    public void setFustifica(Boolean fustifica) {
        this.fustifica = fustifica;
    }




}


