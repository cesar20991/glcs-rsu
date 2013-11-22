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
public class ComprobanteMobileBean {

    private TComprobante comprobante;
    private List<TComprobante> listaComprobante;
    private TComprobante selectedComprobante;
    private List<TLiquidacion> listaliquidacion;
    private List<TPesaje> listapesaje;
    private Date fecDesde;
    private Date fecHasta;
    String rucempresa = "";

    @PostConstruct
    public void init() {
    }

    public void buscarLiquidacion() {
        LiquidacionManaged objLiq = new LiquidacionManaged();
        if (selectedComprobante != null) {
            listaliquidacion = objLiq.listarLiquidacionPorCliente(selectedComprobante);
        }
    }
    public void buscarPesaje() {
       PesajeManaged objPes = new PesajeManaged();
        if (selectedComprobante != null) {
            listapesaje = objPes.listarPesajePorCliente(selectedComprobante);
        }
    }

    public Date getFecDesde() {
        return fecDesde;
    }

    public void setFecDesde(Date fecDesde) {
        this.fecDesde = fecDesde;
    }

    public Date getFecHasta() {
        return fecHasta;
    }

    public void setFecHasta(Date fecHasta) {
        this.fecHasta = fecHasta;
    }

    public void irClearDespacho() {
        listaComprobante = null;
    }

    public void irBuscarComprobante() {
        VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
        listaComprobante = obj.listarComprobante(fecDesde, fecHasta, rucempresa);
    }

    public List<TComprobante> getListaComprobante() {
        ComprobantesManaged c = new ComprobantesManaged();
        listaComprobante = c.buscarTodos();
        return listaComprobante;
    }

    public void setListaComprobante(List<TComprobante> listaComprobante) {
        this.listaComprobante = listaComprobante;
    }

    public TComprobante getSelectedComprobante() {
        return selectedComprobante;
    }

    public void setSelectedComprobante(TComprobante selectedComprobante) {
        LiquidacionManaged objLiq = new LiquidacionManaged();
        PesajeManaged objPes = new PesajeManaged();
        listaliquidacion = objLiq.listarLiquidacionPorCliente(selectedComprobante);
        listapesaje = objPes.listarPesajePorCliente(selectedComprobante);
        this.selectedComprobante = selectedComprobante;
    }

    public List<TLiquidacion> getListaliquidacion() {
        return listaliquidacion;
    }

    public void setListaliquidacion(List<TLiquidacion> listaliquidacion) {
        this.listaliquidacion = listaliquidacion;
    }

    public TComprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(TComprobante comprobante) {
        this.comprobante = comprobante;
    }

    public List<TPesaje> getListapesaje() {
        return listapesaje;
    }

    public void setListapesaje(List<TPesaje> listapesaje) {
        this.listapesaje = listapesaje;
    }
}
