package emch.controller.bean;

import emch.modelo.acceso.ComprobanteManaged;
import emch.modelo.acceso.TrabajadorxCamionManaged;
import emch.modelo.entidades.TComprobante;
import emch.modelo.entidades.TComprobantedet;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TMoneda;
import emch.modelo.entidades.TServicio;
import emch.modelo.entidades.TTipodoc;
import emch.modelo.entidades.TTrabajadorxcamion;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Cesar
 */
@ManagedBean
@RequestScoped
public class ComprobanteBean extends UsuarioBean {

    private TComprobante comprobante;
    private List<TComprobante> listarComprobante;
    private List<TServicio> listarServicio;
    private TLiquidacion selectedliquidacion;
    private List<TServicio> listadoDeServicios;
    private TServicio servicio;
    private TComprobantedet comprobantedet;
    
    private TServicio[] selectedServicio;

    public ComprobanteBean() {
        comprobante = new TComprobante();
        comprobante.setTLiquidacion(new TLiquidacion());
        comprobante.setTMoneda(new TMoneda());
        comprobante.setTTipodoc(new TTipodoc());
        
        servicio = new TServicio();
        comprobantedet = new TComprobantedet();
        comprobantedet.setTServicio(new TServicio());
    }

    public String ingresar() {
        /* HojadeDespachoManaged obj = new HojadeDespachoManaged();
         listadotrabajadorXcamion = Arrays.asList(getSelectedTrabxCamion());
         boolean resultado = isEsEdicion() ? obj.actualizar(despacho) 
         : obj.insertar(despacho,listadotrabajadorXcamion);
         if (resultado) {
         return "nuevahojadespacho";
         } else {
         return ""; //futuros errores
         }*/
        return "";
    }

    public String insertar() {
        FacesContext context = FacesContext.getCurrentInstance();
        /*irCalcularTN();
         liquidacion.setTEmpresa(getEmpresa());
         liquidacion.setUsuCrea(getUsuario2().getNomUsu());
         liquidacion.setFechaReg(liquidacion.getFechaApertura());
         LiquidacionManaged visitaMgd = new LiquidacionManaged();
         boolean resultado = visitaMgd.IngresarLiquidacion(liquidacion,selectedpesaje);
         if (resultado) {
         context.addMessage(null, new FacesMessage("Liquidacion Generada Correctamente", "Verificar"));
         return "liquidaciones";
         } else {
         //setEsEdicion(false);
         context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Error al Generar Liquidacion", "Verificar"));
         return ""; //futuros errores
         }*/
        return "";
    }

    public String irRegresar() {
        return "liquidaciones";
    }

    public String irAgregar() {
        return "nuevahojadespacho";
    }

    public String irPesaje() {
        return "pesajes";
    }

    public String irComprobante() {
        return "comprobantes";
    }

    public List<TComprobante> getListarComprobante() {
        return listarComprobante;
    }

    public void setListarComprobante(List<TComprobante> listarComprobante) {
        this.listarComprobante = listarComprobante;
    }

    public TComprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(TComprobante comprobante) {
        this.comprobante = comprobante;
    }

    public TLiquidacion getSelectedliquidacion() {
        return selectedliquidacion;
    }

    public void setSelectedliquidacion(TLiquidacion selectedliquidacion) {
        this.selectedliquidacion = selectedliquidacion;
    }

    public List<TServicio> getListarServicio() {
        return listarServicio;
    }

    public void setListarServicio(List<TServicio> listarServicio) {
        this.listarServicio = listarServicio;
    }

    public List<TServicio> getListadoDeServicios() {
        ComprobanteManaged obj = new ComprobanteManaged();
        //listadoDeServicios = obj.listarServicio();
        return listadoDeServicios;
    }

    public void setListadoDeServicios(List<TServicio> listadoDeServicios) {
        this.listadoDeServicios = listadoDeServicios;
    }
    
   public List<TServicio> getTrabajadorXcamion() {
        return listadoDeServicios;
    }

    public TServicio[] getSelectedServicio() {
        return selectedServicio;
    }

    public void setSelectedServicio(TServicio[] selectedServicio) {
        this.selectedServicio = selectedServicio;
    }

    public TServicio getServicio() {
        return servicio;
    }

    public void setServicio(TServicio servicio) {
        this.servicio = servicio;
    }

    public TComprobantedet getComprobantedet() {
        return comprobantedet;
    }

    public void setComprobantedet(TComprobantedet comprobantedet) {
        this.comprobantedet = comprobantedet;
    }
}
