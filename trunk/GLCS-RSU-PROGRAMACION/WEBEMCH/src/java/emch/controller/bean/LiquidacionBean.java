/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.acceso.LiquidacionManaged;
import emch.modelo.entidades.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

/**
 *
 * @author Cesar
 */
@ManagedBean
@SessionScoped
public class LiquidacionBean extends UsuarioBean {

    private TLiquidacion liquidacion;
    private List<TLiquidacion> listaliquidacion;
    private List<TTipoliquidacion> listatipoliq;
    private List<TPesaje> listadopesaje;
    private TPesaje[] selectedpesaje;
    private Date fechaInicio;
    private Date fechaFin;
    private List<TEstadoxliquidacion> listaestadoliq;
    private TLiquidacion selectedEstadoLiq;

    public LiquidacionBean() {
        liquidacion = new TLiquidacion();
        liquidacion.setTTipoliquidacion(new TTipoliquidacion());
        liquidacion.setTEmpresa(new TEmpresa());
        //selectedLiquidacionEdicion = new TLiquidacion();        
    }

    public TLiquidacion getLiquidacion() {
        return liquidacion;
    }

    public void setLiquidacion(TLiquidacion liquidacion) {
        this.liquidacion = liquidacion;
    }

    public List<TLiquidacion> getListaliquidacion() {
        return listaliquidacion;
    }

    public void setListaliquidacion(List<TLiquidacion> listaliquidacion) {
        this.listaliquidacion = listaliquidacion;
    }

    public List<TTipoliquidacion> getListatipoliq() {
        LiquidacionManaged obj = new LiquidacionManaged();
        listatipoliq = obj.ListarTipoLiquidacion();
        return listatipoliq;
    }

    public void setListatipoliq(List<TTipoliquidacion> listatipoliq) {
        this.listatipoliq = listatipoliq;
    }
    
    public String irRegresar() {
        return "liquidaciones";
    }

    public String irAperturar() { //throws IOException {
        // FacesContext.getCurrentInstance().getExternalContext().redirect("generarliquidacion.xhtml");
        return "generarliquidacion";
    }
    
    public List<TPesaje> getListadopesaje() {
        LiquidacionManaged obj = new LiquidacionManaged();
        listadopesaje = obj.listarPesajePendiente(getEmpresa().getCdRuc(), liquidacion.getFechaInicio(), liquidacion.getFechaFin());
        return listadopesaje;
    }

    public void setListadopesaje(List<TPesaje> listadopesaje) {
        this.listadopesaje = listadopesaje;
    }

    public TPesaje[] getSelectedpesaje() {
        return selectedpesaje;
    }

    public void demo(ActionEvent evt) {
    }

    public void setSelectedpesaje(TPesaje[] selectedpesaje) {
        this.selectedpesaje = selectedpesaje;
    }

//    public void irListarPesajes(ActionEvent event) {
//        LiquidacionManaged obj = new LiquidacionManaged();
//        listadopesaje = obj.listarPesajePendiente(getEmpresa().getCdRuc(), fechaInicio,fechaFin);
//    }
    public void irCalcularTN() {
        BigDecimal SUMAtotalTN = new BigDecimal("0.000").setScale(2);        
        for (int i = 0; i < selectedpesaje.length; i++) {            
            SUMAtotalTN = SUMAtotalTN.add(selectedpesaje[i].getPesoTn());
        }
        liquidacion.setTotalTn(SUMAtotalTN);
    }

    public String insertar() {
        FacesContext context = FacesContext.getCurrentInstance();
        irCalcularTN();
        liquidacion.setTEmpresa(getEmpresa());
        liquidacion.setUsuCrea(getUsuario2().getNomUsu());
        liquidacion.setFechaReg(liquidacion.getFechaApertura());
        LiquidacionManaged visitaMgd = new LiquidacionManaged();
        boolean resultado = visitaMgd.IngresarLiquidacion(liquidacion,selectedpesaje);
        if (resultado) {
            context.addMessage(null, new FacesMessage("Liquidacion Generada Correctamente", "Verificar"));
            setLiquidacion(null);
            return "liquidaciones";
        } else {
            //setEsEdicion(false);
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Error al Generar Liquidacion", "Verificar"));
            setLiquidacion(null);
            return ""; //futuros errores
        }
        //return "";
    }

    /**
     * @return the fechaInicio
     */
    public Date getFechaInicio() {
        return fechaInicio;
    }

    /**
     * @param fechaInicio the fechaInicio to set
     */
    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    /**
     * @return the fechaFin
     */
    public Date getFechaFin() {
        return fechaFin;
    }

    /**
     * @param fechaFin the fechaFin to set
     */
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    /**
     * @return the listaestadoliq
     */
    
    public List<TEstadoxliquidacion> getListaestadoliq() {
        LiquidacionManaged viMgd = new LiquidacionManaged();
        listaestadoliq = viMgd.ObtenerEstadoLiq(getSelectedEstadoLiq());
        return listaestadoliq;
    }

    /**
     * @param listaestadoliq the listaestadoliq to set
     */
    public void setListaestadoliq(List<TEstadoxliquidacion> listaestadoliq) {
        this.listaestadoliq = listaestadoliq;
    }

    /**
     * @return the selectedEstadoLiq
     */
    public TLiquidacion getSelectedEstadoLiq() {
        return selectedEstadoLiq;
    }

    /**
     * @param selectedEstadoLiq the selectedEstadoLiq to set
     */
    public void setSelectedEstadoLiq(TLiquidacion selectedEstadoLiq) {
        this.selectedEstadoLiq = selectedEstadoLiq;
    }

}
