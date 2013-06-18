package emch.controller.bean;


import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.io.IOException;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;


@ManagedBean
@SessionScoped
public class ConsLiquidacionBean {
    private TLiquidacion liquidacion;
    private List<TLiquidacion> listarLiquidacion;
    private TComprobante selectedComprobante;
    private List<TLiquidacion> listarLiquidacionPorCliente;
    private List<TPesaje> listarpesajePorCliente;    
    
    @PostConstruct
    public void init() {
        
    }
    
    public void irGenerar() throws IOException{
        FacesContext.getCurrentInstance().getExternalContext().redirect("nuevocomprobante.xhtml");
    }

    public TLiquidacion getLiquidacion() {
        return liquidacion;
    }

    public void setLiquidacion(TLiquidacion liquidacion) {
        this.liquidacion = liquidacion;
    }

    public List<TLiquidacion> getListarLiquidacion() {
        LiquidacionManaged objLiq = new LiquidacionManaged();
        listarLiquidacion = objLiq.listarLiquidacion();
        return listarLiquidacion;
    }

    public void setListarLiquidacion(List<TLiquidacion> listarLiquidacion) {
        this.listarLiquidacion = listarLiquidacion;
    }
    
    public String irPesaje(){
        return "ConsultarPesaje";
    }
    
    public String irComprobantes(){
        return "ConsultarComprobantes";
    }
    
 /*SELECCIONAR COMPROBANTE PARA VER SU LIQUIDACION*/

    public TComprobante getSelectedComprobante() {        
        return selectedComprobante;
    }

    public void setSelectedComprobante(TComprobante selectedComprobante) {
        this.selectedComprobante = selectedComprobante;
    }

    public List<TLiquidacion> getListarLiquidacionPorCliente() {
        LiquidacionManaged objLiq = new LiquidacionManaged();
        listarLiquidacionPorCliente = objLiq.listarLiquidacionPorCliente(selectedComprobante);
        return listarLiquidacionPorCliente;
    }

    public void setListarLiquidacionPorCliente(List<TLiquidacion> listarLiquidacionPorCliente) {
        this.listarLiquidacionPorCliente = listarLiquidacionPorCliente;
    }

    public List<TPesaje> getListarpesajePorCliente() {
        PesajeManaged objPes = new PesajeManaged();
        listarpesajePorCliente = objPes.listarPesajePorCliente(selectedComprobante);
        return listarpesajePorCliente;
    }

    public void setListarpesajePorCliente(List<TPesaje> listarpesajePorCliente) {
        this.listarpesajePorCliente = listarpesajePorCliente;
    }   
    
    public String irRegresarComprobante(){
        return "ComprobantesPorCliente";
    }
       
}
