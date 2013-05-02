package emch.controller.bean;

import emch.modelo.acceso.CamionManaged;
import emch.modelo.entidades.TCamion;
import java.io.IOException;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

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

    public void prepararInsertar() {
        camion = new TCamion();
    }

    public void insertar() {
        CamionManaged obj = new CamionManaged();
        obj.insertar(camion);
        camion = new TCamion();
    }

    public void prepararCamion(String id) {
        CamionManaged obj = new CamionManaged();
        camion = obj.buscarPorId(id);
    }

    public void actualizarCamion() {
        CamionManaged obj = new CamionManaged();
        obj.actualizar(camion);
        camion = new TCamion();
    }

    public void cambiarEstado(String id) {
        CamionManaged obj = new CamionManaged();
        camion = obj.buscarPorId(id);
        if (camion.isEstado()) {
            camion.setEstado(false);
        } else {
            camion.setEstado(true);
        }
        obj.actualizar(camion);
    }

    public void asignar() {
        try {
            FacesContext.getCurrentInstance().getExternalContext().redirect("trabajadorxcamion.xhtml");
        } catch (Exception e) {
            System.out.println("Error en cambio de página: " + e.getMessage());
        }
    }

    public List<TCamion> getListaCamiones() {
        CamionManaged obj = new CamionManaged();
        listaCamiones = obj.buscarTodos();
        return listaCamiones;
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
