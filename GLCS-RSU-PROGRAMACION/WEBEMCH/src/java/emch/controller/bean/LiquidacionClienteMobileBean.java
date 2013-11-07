package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class LiquidacionClienteMobileBean {

    private TLiquidacion liquidacion;
    private List<TLiquidacion> listaLiquidacion;
    private TLiquidacion selectedLiquidacion;
    private List<TCliente> listaCliente;
    

    public void irBuscarLiquidacion() {
        LiquidacionClienteManaged obj = new LiquidacionClienteManaged();
        listaLiquidacion = obj.buscarTodos();
    }

    public void irClearLiquidacion() {
        listaLiquidacion = null;
    }

//    public void buscarCliente() {
//        LiquidacionClienteManaged obj = new LiquidacionClienteManaged();
//        if (selectedLiquidacion != null) {
//            listaCliente = obj.ListarLiquidacionxCliente(selectedLiquidacion,"");
//        }
//    }

    public List<TLiquidacion> getListaLiquidacion() {
         return listaLiquidacion;
    }

    public void setListaLiquidacion(List<TLiquidacion> listaLiquidacion) {
        this.listaLiquidacion = listaLiquidacion;
    }

    public TLiquidacion getLiquidacion() {
        return liquidacion;
    }

    public void setLiquidacion(TLiquidacion liquidacion) {
            this.liquidacion = liquidacion;
    }

    
    public TLiquidacion getSelectedLiquidacion() {
        return selectedLiquidacion;
    }

//    public void setSelectedLiquidacion(TLiquidacion selectedLiquidacion) {
//        LiquidacionClienteManaged obj = new LiquidacionClienteManaged();
//        listaCliente = obj.ListarLiquidacionxCliente(selectedLiquidacion);
//        this.selectedLiquidacion = selectedLiquidacion;
//    }

    public List<TCliente> getListaCliente() {
        return listaCliente;
    }

    public void setListaDespachoDet(List<TCliente> listaCliente) {
        this.listaCliente = listaCliente;
    }
}
