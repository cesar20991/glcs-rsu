package emch.controller.bean;

import emch.modelo.acceso.ControlViajeManaged;
import emch.modelo.entidades.TControlviaje;
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
    private List<TControlviaje> listaDetalle;
    private TControlviaje controlviaje;

    public ControlViajeBean() {
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

    public List<TControlviaje> getListaDetalle() {
//        ControlViajeManaged obj = new ControlViajeManaged();
//        listaDespachos = obj.buscarDetalles(controlviaje);
        return listaDetalle;
    }
}
