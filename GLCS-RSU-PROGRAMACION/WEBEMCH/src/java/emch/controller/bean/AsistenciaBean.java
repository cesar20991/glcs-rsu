package emch.controller.bean;

import emch.modelo.acceso.AsistenciaManaged;
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
    
    private Date fechaActual = new Date();
    private String sfechaActual = fechaActual.getDate()+" / "+(fechaActual.getMonth()+1)+" / "+(fechaActual.getYear()-100);
    private List<TTrabajadorxcamion> tTrabajadorxcamions;

    public AsistenciaBean() {
        
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

    public List<TTrabajadorxcamion> gettTrabajadorxcamions() {
        return tTrabajadorxcamions = new AsistenciaManaged().buscarxTurno("TN01");
    }

    public void settTrabajadorxcamions(List<TTrabajadorxcamion> tTrabajadorxcamions) {
        this.tTrabajadorxcamions = tTrabajadorxcamions;
    }
    
    
}