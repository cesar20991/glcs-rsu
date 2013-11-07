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
    private TDespacho selectedLiquidacion;
    private List<TDespachodet> listaCliente;
    

    public void irBuscarDespacho() {
        // NO PUEDO TRAER CALENDAR SALE NULL
        //VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
        //listaDespacho = obj.listarDespacho(fecDesde, fecHasta, rucempresa);
        LiquidacionClienteManaged obj = new LiquidacionClienteManaged();
        listaLiquidacion = obj.buscarTodos();
    }

    public void irClearLiquidacion() {
        listaLiquidacion = null;
    }

//    public void buscarCliente() {
//        LiquidacionClienteManaged obj = new LiquidacionClienteManaged();
//        if (selectedLiquidacion != null) {
//            listaCliente = obj.ListarLiquidacionxCliente(selectedLiquidacion);
//        }
//    }

    public List<TLiquidacion> getListaLiquidacion() {
        //HojadeDespachoManaged obj = new HojadeDespachoManaged();
        //listaDespacho = obj.buscarTodos();
        return listaLiquidacion;
    }

    public void setListaLiquidacion(List<TLiquidacion> listaLiquidacion) {
        this.listaLiquidacion = listaLiquidacion;
    }

    public TLiquidacion getLiquidacion() {
        return liquidacion;
    }

//    public void setLiquidacion(TLiquidacion liquidacion) {
//    }        this.liquidacion = liquidacion;
//
//
//    
//    public TDespacho getSelectedDespacho() {
//        return selectedDespacho;
//    }

//    public void setSelectedLiquidacion(TLiquidacion selectedLiquidacion) {
//        LiquidacionClienteManaged obj = new LiquidacionClienteManaged();
//        listaCliente = obj.ListarLiquidacionxCliente(selectedLiquidacion);
//        this.selectedLiquidacion = selectedLiquidacion;
//    }

//    public List<TDespachodet> getListaDespachoDet() {
//        return listaDespachoDet;
//    }
//
//    public void setListaDespachoDet(List<TDespachodet> listaDespachoDet) {
//        this.listaDespachoDet = listaDespachoDet;
//    }
}
