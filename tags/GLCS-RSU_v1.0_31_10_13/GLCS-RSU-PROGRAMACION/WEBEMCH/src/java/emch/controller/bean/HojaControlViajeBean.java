
package emch.controller.bean;

import emch.modelo.entidades.*;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean
@RequestScoped
public class HojaControlViajeBean {

    private TDespacho despacho;
    private TControlviaje controlviaje;
    private List<TControlviaje> listarControlViaje;
    
    public HojaControlViajeBean() {
    }

    public List<TControlviaje> getListarControlViaje() {
        return listarControlViaje;
    }

    public void setListarControlViaje(List<TControlviaje> listarControlViaje) {
        this.listarControlViaje = listarControlViaje;
    }

    public TDespacho getDespacho() {
        return despacho;
    }

    public void setDespacho(TDespacho despacho) {
        this.despacho = despacho;
    }

    public TControlviaje getControlviaje() {
        return controlviaje;
    }

    public void setControlviaje(TControlviaje controlviaje) {
        this.controlviaje = controlviaje;
    }
}
