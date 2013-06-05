package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

@ManagedBean
@SessionScoped
public class PesajeBean extends UsuarioBean {

    private TLiquidacion selectedLiquidacion;
    private List<TPesaje> listarPesaje;
    private List<TComprobante> listarComprobante;
    private List<TComprobante> listarComprobantePorCliente;    
    //-----------GenerarPesaje---------------------------
    private TPesaje pesaje;
    private DataModel listpesajes;
    private boolean esEdicion;
    private String accion;
    private List<TControlviaje> listacontrolviaje;
    private TControlviaje selectedcv;
    //private List<TPesaje> listpesajes;
    //---------------------------------------------------

    @Override
    public void init() {
        pesaje = new TPesaje();
        pesaje.setTControlviaje(new TControlviaje());
        //pesaje.setTLiquidacion(new TLiquidacion());
        pesaje.setTControlviaje(new TControlviaje(new TControlviajeId(), null, null));
    }

    public TLiquidacion getSelectedLiquidacion() {
        return selectedLiquidacion;
    }

    public void setSelectedLiquidacion(TLiquidacion selectedLiquidacion) {
        this.selectedLiquidacion = selectedLiquidacion;
    }

    public List<TPesaje> getListarPesaje() {
        PesajeManaged objPes = new PesajeManaged();
        listarPesaje = objPes.listarPesaje(selectedLiquidacion);
        return listarPesaje;
    }

    public void setListarPesaje(List<TPesaje> listarPesaje) {
        this.listarPesaje = listarPesaje;
    }

    public List<TComprobante> getListarComprobante() {
        ComprobanteManaged objCom = new ComprobanteManaged();
        listarComprobante = objCom.listarComprobante(selectedLiquidacion);
        return listarComprobante;
    }

    public void setListarComprobante(List<TComprobante> listarComprobante) {
        this.listarComprobante = listarComprobante;
    }

    //----------------COMPROBANTE PESAJE-----------------------//
    public TPesaje getPesaje() {
        return pesaje;
    }

    public void setPesaje(TPesaje pesaje) {
        this.pesaje = pesaje;
    }

    public DataModel getListpesajes() {
        PesajeManaged obj = new PesajeManaged();
        setListpesajes(new ListDataModel(obj.listarPesajes()));
        return listpesajes;
    }

    public void setListpesajes(DataModel listpesajes) {
        this.listpesajes = listpesajes;
    }

    public String irAgregar() {
        setEsEdicion(false);
        setPesaje(new TPesaje());
        pesaje.setTControlviaje(new TControlviaje());
        pesaje.setTLiquidacion(new TLiquidacion());
        return "nuevopesaje";
    }
    
    public String irActualizar() {
        setEsEdicion(true);
        setPesaje((TPesaje) listpesajes.getRowData());
        String controlViaje = pesaje.getTControlviaje().getId().getCdControlViaje();
        int nroViaje = pesaje.getTControlviaje().getId().getNroViaje();
        pesaje.setTControlviaje(new TControlviaje(new TControlviajeId(controlViaje, nroViaje), null, null));
//        //String cdliq = pesaje.getTLiquidacion().getCdLiq();
//        //pesaje.setTLiquidacion(new TLiquidacion(cdliq, null, null, null, null, null, "", null));
        String cod = pesaje.getCdPesaje();
        pesaje.setCdPesaje(cod);
        return "nuevopesaje";
    }

    public boolean isEsEdicion() {
        return esEdicion;
    }

    public void setEsEdicion(boolean esEdicion) {
        this.esEdicion = esEdicion;
    }

    public String getAccion() {
        return isEsEdicion() ? "Actualizar Pesaje" : "Agregar Pesaje";
    }

    public String ingresar() {
        FacesContext context1 = FacesContext.getCurrentInstance();
        PesajeManaged pesajeMgd = new PesajeManaged();
        //String a = selectedcontrolviaje.getId().getCdControlViaje();
        boolean resultado = isEsEdicion() ? pesajeMgd.actualizarPesaje(pesaje,selectedcv,"coropeza") : pesajeMgd.ingresarPesaje(pesaje,selectedcv,"coropeza");
        if (resultado) {
            context1.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Se agrego el Pesaje " + pesaje.getNroPesaje() + " Correctamente", "Verificar"));
            return "pesajes";
        } else {
            context1.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Error al Crear Pesaje", "Verificar"));
            return ""; //futuros errores
        }
    }
    
    public List<TControlviaje> getListacontrolviaje() {
        PesajeManaged obj = new PesajeManaged();
        listacontrolviaje = obj.listarControlViaje();
        return listacontrolviaje;
    }

    public void setListacontrolviaje(List<TControlviaje> listacontrolviaje) {
        this.listacontrolviaje = listacontrolviaje;
    }

    public TControlviaje getSelectedcv() {
        return selectedcv;
    }

    public void setSelectedcv(TControlviaje selectedcv) {
        this.selectedcv = selectedcv;
    }
    
/*COMPROBANTES POR CLIENTE*/
    public List<TComprobante> getListarComprobantePorCliente() {
        ComprobanteManaged objCom = new ComprobanteManaged();
        listarComprobantePorCliente = objCom.listarComprobantePorCliente();
        return listarComprobantePorCliente;
    }

    public void setListarComprobantePorCliente(List<TComprobante> listarComprobantePorCliente) {
        this.listarComprobantePorCliente = listarComprobantePorCliente;
    }
       
   public String irLiquidacionPorCliente(){
       return "LiquidacionPorCliente";
   }
   
   public String irPesajePorCliente(){
       return "PesajeporCliente";
   }    
    
    
}
