package emch.modelo.entidades;
// Generated 01/11/2013 08:35:39 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TAsistencia generated by hbm2java
 */
public class TAsistencia  implements java.io.Serializable {


     private String cdAsistencia;
     private TTurno TTurno;
     private Date fecha;
     private String usuCrea;
     private Date fechaReg;
     private String usuModf;
     private Date fechModf;
     private Set<TAsistenciaxtrabajador> TAsistenciaxtrabajadors = new HashSet<TAsistenciaxtrabajador>(0);

    public TAsistencia() {
    }

	
    public TAsistencia(String cdAsistencia, TTurno TTurno, Date fecha, String usuCrea, Date fechaReg) {
        this.cdAsistencia = cdAsistencia;
        this.TTurno = TTurno;
        this.fecha = fecha;
        this.usuCrea = usuCrea;
        this.fechaReg = fechaReg;
    }
    public TAsistencia(String cdAsistencia, TTurno TTurno, Date fecha, String usuCrea, Date fechaReg, String usuModf, Date fechModf, Set<TAsistenciaxtrabajador> TAsistenciaxtrabajadors) {
       this.cdAsistencia = cdAsistencia;
       this.TTurno = TTurno;
       this.fecha = fecha;
       this.usuCrea = usuCrea;
       this.fechaReg = fechaReg;
       this.usuModf = usuModf;
       this.fechModf = fechModf;
       this.TAsistenciaxtrabajadors = TAsistenciaxtrabajadors;
    }
   
    public String getCdAsistencia() {
        return this.cdAsistencia;
    }
    
    public void setCdAsistencia(String cdAsistencia) {
        this.cdAsistencia = cdAsistencia;
    }
    public TTurno getTTurno() {
        return this.TTurno;
    }
    
    public void setTTurno(TTurno TTurno) {
        this.TTurno = TTurno;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
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
    public Date getFechModf() {
        return this.fechModf;
    }
    
    public void setFechModf(Date fechModf) {
        this.fechModf = fechModf;
    }
    public Set<TAsistenciaxtrabajador> getTAsistenciaxtrabajadors() {
        return this.TAsistenciaxtrabajadors;
    }
    
    public void setTAsistenciaxtrabajadors(Set<TAsistenciaxtrabajador> TAsistenciaxtrabajadors) {
        this.TAsistenciaxtrabajadors = TAsistenciaxtrabajadors;
    }




}


