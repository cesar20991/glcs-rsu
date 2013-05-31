package emch.controller.bean;

import emch.modelo.entidades.TDespachodet;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author Administrador
 */
@ManagedBean
@RequestScoped
public class AsignarRutaBean {

    private TDespachodet selecteddespachodet;
        
    public AsignarRutaBean() {
    }

    public TDespachodet getSelecteddespachodet() {
        return selecteddespachodet;
    }

    public void setSelecteddespachodet(TDespachodet selecteddespachodet) {
        this.selecteddespachodet = selecteddespachodet;
    }
    
   public String irAsignarRuta() {
        return "asignarruta";
    }
}
