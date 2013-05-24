package emch.controller.bean;

import emch.modelo.acceso.ControlViajeManaged;
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

    public ControlViajeBean() {
    }

    public List<TDespacho> getListaDespachos() {
        ControlViajeManaged obj = new ControlViajeManaged();
        listaDespachos=obj.buscarTodos();
        return listaDespachos;
    }
}
