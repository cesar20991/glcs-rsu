package emch.controller.bean;

import emch.modelo.acceso.AsistenciaManaged;
import emch.modelo.entidades.TAsistencia;
import emch.modelo.entidades.TAsistenciaxtrabajador;
import emch.modelo.entidades.TAsistenciaxtrabajadorId;
import emch.modelo.entidades.TTrabajador;
import emch.modelo.entidades.TTurno;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author Mario
 */
@ManagedBean
@SessionScoped
public class AsistenciaBean {

    private Date fechajust = new Date();
    private Date fechaActual = new Date();
    private String sfechaActual = fechaActual.getDate() + " / " + (fechaActual.getMonth() + 1) + " / " + (fechaActual.getYear() - 100);
    private String cdAsistencia = "";
    private List<TTrabajador> listatrabajador;
    private TTrabajador trabajador;
    private TAsistencia asistencia;
    private TTurno turno;
    private int opcion = 0;

    public AsistenciaBean() {
        trabajador = new TTrabajador();
        if(fechaActual.getHours()>=8 & fechaActual.getHours()<20){
            cdAsistencia += "M"+fechaActual.getDate();
            turno = new TTurno("TN01", "Mañana");
        }else if((fechaActual.getHours()>=20 || fechaActual.getHours()<8)){
            cdAsistencia += "N"+(fechaActual.getDate()+1);
            turno = new TTurno("TN02", "Noche");
        }
        AsistenciaManaged obj = new AsistenciaManaged();
        TAsistencia ta = new TAsistencia(cdAsistencia, turno, fechaActual, "mar1693", fechaActual);
        if(!obj.ExisteIdAsistencia(cdAsistencia)){            
            obj.insertarAsistencia(ta);
        }        
    }    

    public Date getFechajust() {
        return fechajust;
    }

    public void setFechajust(Date fechajust) {
        this.fechajust = fechajust;
    }

    public Date getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(Date fechaActual) {
        this.fechaActual = fechaActual;
    }

    public String getSfechaActual() {
        return sfechaActual;
    }

    public void setSfechaActual(String sfechaActual) {
        this.sfechaActual = sfechaActual;
    }

    public List<TTrabajador> getListatrabajador() {
        AsistenciaManaged obj = new AsistenciaManaged();
        if(!obj.ExisteIdAsistencia(cdAsistencia)){
            listatrabajador = obj.todosTrabajador();
        }else{
            listatrabajador = obj.todosTrabajadoresSinAsistencia(cdAsistencia);
        }
        return listatrabajador;
    }

    public void setListatrabajador(List<TTrabajador> listatrabajador) {
        this.listatrabajador = listatrabajador;
    }

    public TTrabajador getTrabajador() {
        return trabajador;
    }

    public void setTrabajador(TTrabajador trabajador) {
        this.trabajador = trabajador;
    }

    public int getOpcion() {
        return opcion;
    }

    public void setOpcion(int opcion) {
        this.opcion = opcion;
    }    

    public String getCdAsistencia() {
        return cdAsistencia;
    }

    public void setCdAsistencia(String cdAsistencia) {
        this.cdAsistencia = cdAsistencia;
    }   
    
    public void MarcarAsistencia(TTrabajador trabajador){        
        AsistenciaManaged obj = new AsistenciaManaged();
        TAsistenciaxtrabajadorId asistenciaxtrabajadorId = new TAsistenciaxtrabajadorId(trabajador.getCdTrabajador(), cdAsistencia);
        TAsistenciaxtrabajador asistenciaxtrabajador = new TAsistenciaxtrabajador(asistenciaxtrabajadorId, trabajador, asistencia, true, false, false);
        obj.insertarAsistenciaxTrabajador(asistenciaxtrabajador);
    }
    
    public void MarcarTardanza(TTrabajador trabajador){        
        AsistenciaManaged obj = new AsistenciaManaged();
        TAsistenciaxtrabajadorId asistenciaxtrabajadorId = new TAsistenciaxtrabajadorId(trabajador.getCdTrabajador(), cdAsistencia);
        TAsistenciaxtrabajador asistenciaxtrabajador = new TAsistenciaxtrabajador(asistenciaxtrabajadorId, trabajador, asistencia, false, true, false);
        obj.insertarAsistenciaxTrabajador(asistenciaxtrabajador);
    }
}
