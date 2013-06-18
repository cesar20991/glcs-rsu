package emch.controller.bean;

import emch.modelo.acceso.ComprobanteManaged;
import emch.modelo.entidades.TComprobante;
import emch.modelo.entidades.TComprobantedet;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TMoneda;
import emch.modelo.entidades.TServicio;
import emch.modelo.entidades.TTipodoc;
import java.math.BigDecimal;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;

/**
 *
 * @author Cesar
 */
@ManagedBean
@SessionScoped
public class ComprobanteBean extends UsuarioBean {

    private TComprobante comprobante;
    private List<TComprobante> listarComprobante;
    private List<TServicio> listarServicio;
    private TLiquidacion selectedliquidacion;
    private List<TServicio> listadoDeServicios;
    private TServicio servicio;
    private TComprobantedet comprobantedet;  
    private List<TComprobantedet> listcompdet;
    private List<TComprobante> listarComprobantes;
    private List<TComprobantedet> listarComprobantesDets;

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
        listadoDeServicios = obj.listarServicio();
        return listadoDeServicios;
    }

    public void setListadoDeServicios(List<TServicio> listadoDeServicios) {
        this.listadoDeServicios = listadoDeServicios;
    }
    
   public List<TServicio> getTrabajadorXcamion() {
        return listadoDeServicios;
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
    
    public String irListoAgregar(){
        comprobantedet.setTServicio(servicio);
        comprobantedet.setItem("1");
        BigDecimal total = new BigDecimal("1.00").setScale(2);        
        BigDecimal CanTN = new BigDecimal("1.00");
        BigDecimal precio = new BigDecimal("1.00");
        CanTN.multiply(getComprobantedet().getCantTn());
        precio.multiply(CanTN);
        total.multiply(precio);
        comprobantedet.setTotal(total);
        comprobantedet.setTComprobante(new TComprobante("CP00000001", null, null, null, null, "", "", total, total, CanTN, "", null, ""));
        listcompdet.add(comprobantedet);
        return "nuevocomprobante";
    }

    /**
     * @return the listcompdet
     */
    public List<TComprobantedet> getListcompdet() {
        return listcompdet;
    }

    /**
     * @param listcompdet the listcompdet to set
     */
    public void setListcompdet(List<TComprobantedet> listcompdet) {
        this.listcompdet = listcompdet;
    }

    public List<TComprobante> getListarComprobantes() {
        ComprobanteManaged obj = new ComprobanteManaged();
        setListarComprobantes(obj.listarComprobantes());
        return listarComprobantes;
    }

    public void setListarComprobantes(List<TComprobante> listarComprobantes) {
        this.listarComprobantes = listarComprobantes;
    }
    
    String comprobanteA = "";
    public void buscarCompDet(AjaxBehaviorEvent event) {
        comprobanteA = comprobante.getIdComprobante();
        ComprobanteManaged obj = new ComprobanteManaged();
        listarComprobantesDets = obj.listarComprobantesDets(comprobante);        
    }

    public List<TComprobantedet> getListarComprobantesDets() {
        return listarComprobantesDets;
    }

    public void setListarComprobantesDets(List<TComprobantedet> listarComprobantesDets) {
        this.listarComprobantesDets = listarComprobantesDets;
    }
    
}
