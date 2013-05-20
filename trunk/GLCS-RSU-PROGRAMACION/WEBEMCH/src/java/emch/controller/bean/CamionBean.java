package emch.controller.bean;

import emch.modelo.acceso.CamionManaged;
import emch.modelo.entidades.TCamion;
import java.io.IOException;
import java.util.List;
import javax.faces.application.FacesMessage;
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
        FacesContext context = FacesContext.getCurrentInstance();
        String text = "";
        if (camion.getPlaca().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Codigo: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (camion.getModelo().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Modelo: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (camion.getMarca().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Marca: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (camion.getAnio().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Año: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (camion.getPesoBruto().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Peso bruto: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (camion.getTipoCombustible().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Tipo de combustible: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (camion.getDireccion().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Dirección: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (camion.getCajaCambios().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Caja de cambios: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (camion.getVelocMax().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Velocidad máxima: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (camion.getKilometraje().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Kilometraje: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (text.equals("")) {
            CamionManaged obj = new CamionManaged();
            obj.insertar(camion);
            camion = new TCamion();
        }
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
