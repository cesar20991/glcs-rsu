package emch.controller.bean;

import emch.modelo.acceso.AsistenciaManaged;
import emch.modelo.entidades.TAsistencia;
import emch.modelo.entidades.TAsistenciaxtrabajador;
import emch.modelo.entidades.TAsistenciaxtrabajadorId;
import emch.modelo.entidades.TTrabajador;
import emch.modelo.entidades.TTrabajadorxcamion;
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
    private List<TTrabajador> listatrabajador;
    private TTrabajador trabajador;
    private int opcion = 0;

    public AsistenciaBean() {
        trabajador = new TTrabajador();
        
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
        listatrabajador = obj.todosTrabajadoresSinAsistencia();
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
    
}
