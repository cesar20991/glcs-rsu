package emch.controller.bean;

import emch.modelo.acceso.AsistenciaManaged;
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

    private SelectItem[] createFilterOptions(String[] data) {
        SelectItem[] options = new SelectItem[data.length + 1];

        options[0] = new SelectItem("", "Select");
        for (int i = 0; i < data.length; i++) {
            options[i + 1] = new SelectItem(data[i], data[i]);
        }

        return options;
    }
   
}