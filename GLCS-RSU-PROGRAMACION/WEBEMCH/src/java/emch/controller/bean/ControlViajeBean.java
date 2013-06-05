package emch.controller.bean;

import emch.modelo.acceso.ControlViajeManaged;
import emch.modelo.entidades.TControlviaje;
import emch.modelo.entidades.TControlviajeId;
import emch.modelo.entidades.TDespacho;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author rick
 */
@ManagedBean
@SessionScoped
public class ControlViajeBean {

    private List<TDespacho> listaDespachos;
    private List<TControlviaje> listaControles;
    private List<TControlviaje> listaControlesBuscar;
    private TControlviaje controlviaje;

    public ControlViajeBean() {
        controlviaje = new TControlviaje();
    }

    public void prepararControles(String id) {
        ControlViajeManaged obj = new ControlViajeManaged();
        listaControles = obj.buscarControlesPorId(id);
    }

    public void prepararControl(TControlviajeId id) {
        ControlViajeManaged obj = new ControlViajeManaged();
        controlviaje = obj.buscarPorId(id);
    }

    public void actualizarControl() {
        ControlViajeManaged obj = new ControlViajeManaged();
        obj.actualizar(controlviaje);
        controlviaje = new TControlviaje();
    }

    public void eliminarControl(TControlviaje control) {
        ControlViajeManaged obj = new ControlViajeManaged();
        obj.eliminar(control);
    }

    public List<TDespacho> getListaDespachos() {
        ControlViajeManaged obj = new ControlViajeManaged();
        listaDespachos = obj.buscarTodos();
        return listaDespachos;
    }

    public TControlviaje getControlviaje() {
        return controlviaje;
    }

    public void setControlviaje(TControlviaje controlviaje) {
        this.controlviaje = controlviaje;
    }

    public List<TControlviaje> getListaControles() {
        return listaControles;
    }

    public List<TControlviaje> getListaControlesBuscar() {
        return listaControlesBuscar;
    }
}
