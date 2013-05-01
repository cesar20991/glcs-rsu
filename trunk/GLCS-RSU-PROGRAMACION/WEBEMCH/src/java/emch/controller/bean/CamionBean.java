package emch.controller.bean;

import emch.modelo.acceso.CamionManaged;
import emch.modelo.entidades.TCamion;
import java.io.Serializable;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.event.ActionEvent;

/**
 *
 * @author rick
 */
@ManagedBean
@SessionScoped
public class CamionBean {

    private List<TCamion> listaCamiones;
    private TCamion camion;

    public CamionBean() {
        camion = new TCamion();
    }

    public void prepararCamion(String id) {
        CamionManaged obj = new CamionManaged();
        camion = obj.buscarPorId(id);
        camion = new TCamion();
    }

    public void insertar(ActionEvent actionEvent) {
        CamionManaged obj = new CamionManaged();
        camion.setEstado(true);
        obj.agregarCamion(camion);
    }

    public List<TCamion> getListaCamiones() {
        CamionManaged obj = new CamionManaged();
        listaCamiones = obj.buscarTodos();
        return listaCamiones;
    }

    public void actualizarCamion() {
        CamionManaged obj = new CamionManaged();
        obj.actualizar(camion);
    }

    public void setListaCamiones(List<TCamion> listaCamiones) {
        this.listaCamiones = listaCamiones;
    }

    public TCamion getCamion() {
        return camion;
    }

    public void setCamion(TCamion camion) {
        this.camion = camion;
    }
}
