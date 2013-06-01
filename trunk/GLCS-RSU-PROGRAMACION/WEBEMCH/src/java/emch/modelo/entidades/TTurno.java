package emch.modelo.entidades;
// Generated 31-may-2013 22:17:08 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TTurno generated by hbm2java
 */
public class TTurno  implements java.io.Serializable {


     private String cdTurno;
     private String nombTurno;
     private String obs;
     private Set<TDespacho> TDespachos = new HashSet<TDespacho>(0);
     private Set<TTrabajadorxcamion> TTrabajadorxcamions = new HashSet<TTrabajadorxcamion>(0);
     private Set<TAsistencia> TAsistencias = new HashSet<TAsistencia>(0);

    public TTurno() {
    }

	
    public TTurno(String cdTurno, String nombTurno) {
        this.cdTurno = cdTurno;
        this.nombTurno = nombTurno;
    }
    public TTurno(String cdTurno, String nombTurno, String obs, Set<TDespacho> TDespachos, Set<TTrabajadorxcamion> TTrabajadorxcamions, Set<TAsistencia> TAsistencias) {
       this.cdTurno = cdTurno;
       this.nombTurno = nombTurno;
       this.obs = obs;
       this.TDespachos = TDespachos;
       this.TTrabajadorxcamions = TTrabajadorxcamions;
       this.TAsistencias = TAsistencias;
    }
   
    public String getCdTurno() {
        return this.cdTurno;
    }
    
    public void setCdTurno(String cdTurno) {
        this.cdTurno = cdTurno;
    }
    public String getNombTurno() {
        return this.nombTurno;
    }
    
    public void setNombTurno(String nombTurno) {
        this.nombTurno = nombTurno;
    }
    public String getObs() {
        return this.obs;
    }
    
    public void setObs(String obs) {
        this.obs = obs;
    }
    public Set<TDespacho> getTDespachos() {
        return this.TDespachos;
    }
    
    public void setTDespachos(Set<TDespacho> TDespachos) {
        this.TDespachos = TDespachos;
    }
    public Set<TTrabajadorxcamion> getTTrabajadorxcamions() {
        return this.TTrabajadorxcamions;
    }
    
    public void setTTrabajadorxcamions(Set<TTrabajadorxcamion> TTrabajadorxcamions) {
        this.TTrabajadorxcamions = TTrabajadorxcamions;
    }
    public Set<TAsistencia> getTAsistencias() {
        return this.TAsistencias;
    }
    
    public void setTAsistencias(Set<TAsistencia> TAsistencias) {
        this.TAsistencias = TAsistencias;
    }




}


