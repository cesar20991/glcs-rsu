package emch.controller.bean;

import emch.modelo.acceso.LiquidacionManaged;
import emch.modelo.acceso.VerificarComprobanteManaged;
import emch.modelo.entidades.TCliente;
import emch.modelo.entidades.TLiquidacion;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class ConsLiquidacionMobileBean {

    private TLiquidacion liquidacion;
    private List<TLiquidacion> listarLiquidacion;
    private List<TLiquidacion> listaLiquidaciones;
    private TCliente selectedCliente;
    private List<TLiquidacion> listarLiquidacionXCliente;
    private Date fecDesde;
    private Date fecHasta;
    String rucempresa = "";

    @PostConstruct
    public void init() {
    }

    public TLiquidacion getLiquidacion() {
        return liquidacion;
    }

    public void setLiquidacion(TLiquidacion liquidacion) {
        this.liquidacion = liquidacion;
    }

    public List<TLiquidacion> getListarLiquidacion() {
        return listarLiquidacion;
    }

    public void setListarLiquidacion(List<TLiquidacion> listarLiquidacion) {
        this.listarLiquidacion = listarLiquidacion;
    }

    public void buscarLiqPorCliente() {
        LiquidacionManaged obj = new LiquidacionManaged();
        if (getSelectedCliente() != null) {
            listarLiquidacionXCliente = obj.ListarLiqxCliente(selectedCliente);
        }
    }

    public TCliente getSelectedCliente() {
        return selectedCliente;
    }

    public void setSelectedCliente(TCliente selectedCliente) {
        LiquidacionManaged obj = new LiquidacionManaged();
        listarLiquidacionXCliente = obj.ListarLiqxCliente(selectedCliente);
        this.selectedCliente = selectedCliente;
    }

    public List<TLiquidacion> getListarLiquidacionXCliente() {
        return listarLiquidacionXCliente;
    }

    public void setListarLiquidacionXCliente(List<TLiquidacion> listarLiquidacionXCliente) {
        this.listarLiquidacionXCliente = listarLiquidacionXCliente;
    }

    public List<TLiquidacion> getListaLiquidaciones() {
        return listaLiquidaciones;
    }

    public void setListaLiquidaciones(List<TLiquidacion> listaLiquidaciones) {
        this.listaLiquidaciones = listaLiquidaciones;
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
    
    public void irClearLiquidaciones() {
        listarLiquidacion = null;
    }

    public void irBuscarLiquidaciones() {
        VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
         listarLiquidacion = obj.listarLiquidacion(fecDesde, fecHasta, rucempresa);
    }

}
