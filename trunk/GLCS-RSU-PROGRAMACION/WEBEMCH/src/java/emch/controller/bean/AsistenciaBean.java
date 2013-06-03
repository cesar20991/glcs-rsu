package emch.controller.bean;

import emch.modelo.acceso.AsistenciaManaged;
import emch.modelo.entidades.TAsistencia;
import emch.modelo.entidades.TAsistenciaxtrabajador;
import emch.modelo.entidades.TAsistenciaxtrabajadorId;
import emch.modelo.entidades.TTrabajadorxcamion;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.model.SelectItem;

/**
 *
 * @author Mario
 */
@ManagedBean
@SessionScoped
public class AsistenciaBean {

    private Date fechaActual = new Date();
    private String sfechaActual = fechaActual.getDate() + " / " + (fechaActual.getMonth() + 1) + " / " + (fechaActual.getYear() - 100);
    private List<TTrabajadorxcamion> listaTrabajadorxcamion;
    private TTrabajadorxcamion Trabajadorxcamion;
    private int opcion = 0;

    public AsistenciaBean() {
        Trabajadorxcamion = new TTrabajadorxcamion();
    }

    public String getSfechaActual() {
        return sfechaActual;
    }

    public void setSfechaActual(String sfechaActual) {
        this.sfechaActual = sfechaActual;
    }

    public Date getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(Date fechaActual) {
        this.fechaActual = fechaActual;
    }

    public List<TTrabajadorxcamion> getListaTrabajadorxcamion() {
        AsistenciaManaged obj = new AsistenciaManaged();
        return listaTrabajadorxcamion = obj.buscarTodos();
    }

    public void setListaTrabajadorxcamion(List<TTrabajadorxcamion> listaTrabajadorxcamion) {
        this.listaTrabajadorxcamion = listaTrabajadorxcamion;
    }

    public TTrabajadorxcamion getTrabajadorxcamion() {
        return Trabajadorxcamion;
    }

    public void setTrabajadorxcamion(TTrabajadorxcamion Trabajadorxcamion) {
        this.Trabajadorxcamion = Trabajadorxcamion;
    }

    public void buscarDatosTrabajadorxcamion(String cdAsig){
        AsistenciaManaged obj = new AsistenciaManaged();
        Trabajadorxcamion = obj.buscarPorId(cdAsig);
    }

    public int getOpcion() {
        return opcion;
    }

    public void setOpcion(int opcion) {
        this.opcion = opcion;
    }
    
    public void RegistrarAsistencia(TTrabajadorxcamion tTrabajadorxcamion){
        String asistId = "As"+(int)(Math.random()*100);
        TAsistencia tAsistencia = new TAsistencia(asistId, tTrabajadorxcamion.getTTurno(), fechaActual, "mar1693", fechaActual);
        TAsistenciaxtrabajador tAsistenciaxtrabajador = null;
        TAsistenciaxtrabajadorId tAsistenciaxtrabajadorId =  new TAsistenciaxtrabajadorId(tTrabajadorxcamion.getTTrabajador().getCdTrabajador(), asistId);
        switch(opcion){
            case 1:
                tAsistenciaxtrabajador = new TAsistenciaxtrabajador(tAsistenciaxtrabajadorId, tTrabajadorxcamion.getTTrabajador(), tAsistencia, true, false, false);
                break;
            case 2:
                tAsistenciaxtrabajador = new TAsistenciaxtrabajador(tAsistenciaxtrabajadorId, tTrabajadorxcamion.getTTrabajador(), tAsistencia, false, true, false);
                break;
            case 3:
                tAsistenciaxtrabajador = new TAsistenciaxtrabajador(tAsistenciaxtrabajadorId, tTrabajadorxcamion.getTTrabajador(), tAsistencia, false, false, true);
                break;
        }
        
        AsistenciaManaged obj = new AsistenciaManaged();
        obj.insertarAsistencia(tAsistencia);
        obj.insertarAsistencia(tAsistenciaxtrabajador);
    }
    
}