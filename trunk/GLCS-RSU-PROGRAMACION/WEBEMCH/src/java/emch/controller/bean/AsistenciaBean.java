package emch.controller.bean;

import emch.modelo.acceso.AsistenciaManaged;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import sun.util.calendar.BaseCalendar;
import util.ConsultaTrabajadoresXTurno;

/**
 *
 * @author Mario
 */
@ManagedBean
@SessionScoped
public class AsistenciaBean {
    
    private Date fechaActual = new Date();
    private String sfechaActual = fechaActual.getDate()+" / "+(fechaActual.getMonth()+1)+" / "+(fechaActual.getYear()-100);
    private List<ConsultaTrabajadoresXTurno> listConsulta;

    public AsistenciaBean() {
    }

    public Date getFechaActual() {
        return fechaActual;
    }

    public String getSfechaActual() {
        return sfechaActual;
    }        

    public List<ConsultaTrabajadoresXTurno> getListConsulta() {
        AsistenciaManaged obj = new AsistenciaManaged();
        return listConsulta =  obj.buscarxTurno("TN01");
    }

    public void setListConsulta(List<ConsultaTrabajadoresXTurno> listConsulta) {
        this.listConsulta = listConsulta;
    }

}