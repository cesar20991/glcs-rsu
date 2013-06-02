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
    private List<TTrabajadorxcamion> listConsulta;

    public AsistenciaBean() {
    }

    public Date getFechaActual() {
        return fechaActual;
    }

    public List<TTrabajadorxcamion> getListConsulta() {
        AsistenciaManaged ob = new AsistenciaManaged();
        return listConsulta = ob.buscarxTurno("TN02");
    }

    public void setListConsulta(List<TTrabajadorxcamion> listConsulta) {
        this.listConsulta = listConsulta;
    }

    public String getSfechaActual() {
        return sfechaActual;
    }        
}