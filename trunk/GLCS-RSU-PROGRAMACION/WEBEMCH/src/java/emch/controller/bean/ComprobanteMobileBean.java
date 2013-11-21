package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class ComprobanteMobileBean {

    private TComprobante comprobante;
    private List<TComprobante> listaComprobante;
    private TComprobante selectedComprobante;
    private List<TLiquidacion> listaliqudiacion;
    private List<TPesaje> listapesaje;

    @PostConstruct
    public void init() {
    }

    public void buscarLiquidacion() {
        LiquidacionManaged objLiq = new LiquidacionManaged();
        if (selectedComprobante != null) {
            listaliqudiacion = objLiq.listarLiquidacionPorCliente(selectedComprobante);
        }
    }

    public void buscarPesaje() {
        PesajeManaged objPes = new PesajeManaged();
        if (selectedComprobante != null) {
            listapesaje = objPes.listarPesajePorCliente(selectedComprobante);
        }
    }

    public List<TComprobante> getListaComprobante() {
        ComprobantesManaged obj = new ComprobantesManaged();
        listaComprobante = obj.buscarTodos();
        return listaComprobante;
    }

    public void setListaComprobante(List<TComprobante> listaComprobante) {
        this.listaComprobante = listaComprobante;
    }

    public TComprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(TComprobante comprobante) {
        this.comprobante = comprobante;
    }

    public List<TLiquidacion> getListaliqudiacion() {
        return listaliqudiacion;
    }

    public void setListaliqudiacion(List<TLiquidacion> listaliqudiacion) {
        this.listaliqudiacion = listaliqudiacion;
    }

    public List<TPesaje> getListapesaje() {
        return listapesaje;
    }

    public void setListapesaje(List<TPesaje> listapesaje) {
        this.listapesaje = listapesaje;
    }

    public TComprobante getSelectedComprobante() {
        return selectedComprobante;
    }

    public void setSelectedComprobante(TComprobante selectedComprobante) {
        LiquidacionManaged objLiq = new LiquidacionManaged();
         PesajeManaged objPes = new PesajeManaged();
        listaliqudiacion = objLiq.listarLiquidacionPorCliente(selectedComprobante);
        listapesaje = objPes.listarPesajePorCliente(selectedComprobante);
        this.selectedComprobante = selectedComprobante;
    }
}
