/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.acceso.VerificarComprobanteManaged;
import emch.modelo.entidades.*;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author Monica
 */
@ManagedBean
@RequestScoped
public class verificarcomprobanteBean extends UsuarioBean{
    
    private List<TPesaje> listarPesajeSel;
    private List<TComprobante> listarComprobante;
    private List<TDespacho> listarDespacho;
    private List<TLiquidacion> listarLiquidacion;
    private Date fechaInicioPesaje;
    private Date fechaFinPesaje;
    private Date fechaInicioComprobante;
    private Date fechaFinComprobante;
    private Date fechaInicioDespacho;
    private Date fechaFinDespacho;
    private Date fechaInicioLiquidacion;
    private Date fechaFinLiquidacion;
        
    public verificarcomprobanteBean() {
        
    }
    String rucEmpresa = getRucEmp();
    public String irBuscarPesaje(){
        VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
        listarPesajeSel= obj.listarPesaje(fechaInicioPesaje,fechaFinPesaje, rucEmpresa);                 
        return"";
    }
    
    public String irBuscarComprobante(){
        VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
        listarPesajeSel= obj.listarPesaje(fechaInicioComprobante,fechaFinComprobante, rucEmpresa);                 
        return"";
    }
    
    public String irBuscarDespacho(){
        VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
        listarPesajeSel= obj.listarPesaje(fechaInicioDespacho,fechaFinDespacho, rucEmpresa);                 
        return"";
    }
    
    public String irBuscarLiquidacion(){
        VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
        listarPesajeSel= obj.listarPesaje(fechaInicioLiquidacion,fechaFinLiquidacion, rucEmpresa);                 
        return"";
    }
    
        public List<TPesaje> getListarPesajeSel() {
        //VerificarComprobanteManaged objTrb = new VerificarComprobanteManaged();
        //listarPesajeSel = objTrb.listarPesaje(fecI,fecF);
        return listarPesajeSel;
    }

    public void setListarPesajeSel(List<TPesaje> listarPesajeSel) {
        this.listarPesajeSel = listarPesajeSel;
    }
        
    public Date getFechaInicioPesaje() {
        return fechaInicioPesaje;
    }

    public void setFechaInicioPesaje(Date fechaInicioPesaje) {
        this.fechaInicioPesaje = fechaInicioPesaje;
    }

    public Date getFechaFinPesaje() {
        return fechaFinPesaje;
    }

    public void setFechaFinPesaje(Date fechaFinPesaje) {
        this.fechaFinPesaje = fechaFinPesaje;
    }

    /**
     * @return the fechaInicioComprobante
     */
    public Date getFechaInicioComprobante() {
        return fechaInicioComprobante;
    }

    /**
     * @param fechaInicioComprobante the fechaInicioComprobante to set
     */
    public void setFechaInicioComprobante(Date fechaInicioComprobante) {
        this.fechaInicioComprobante = fechaInicioComprobante;
    }

    /**
     * @return the fechaFinComprobante
     */
    public Date getFechaFinComprobante() {
        return fechaFinComprobante;
    }

    /**
     * @param fechaFinComprobante the fechaFinComprobante to set
     */
    public void setFechaFinComprobante(Date fechaFinComprobante) {
        this.fechaFinComprobante = fechaFinComprobante;
    }

    /**
     * @return the fechaInicioDespacho
     */
    public Date getFechaInicioDespacho() {
        return fechaInicioDespacho;
    }

    /**
     * @param fechaInicioDespacho the fechaInicioDespacho to set
     */
    public void setFechaInicioDespacho(Date fechaInicioDespacho) {
        this.fechaInicioDespacho = fechaInicioDespacho;
    }

    /**
     * @return the fechaFinDespacho
     */
    public Date getFechaFinDespacho() {
        return fechaFinDespacho;
    }

    /**
     * @param fechaFinDespacho the fechaFinDespacho to set
     */
    public void setFechaFinDespacho(Date fechaFinDespacho) {
        this.fechaFinDespacho = fechaFinDespacho;
    }

    /**
     * @return the fechaInicioLiquidacion
     */
    public Date getFechaInicioLiquidacion() {
        return fechaInicioLiquidacion;
    }

    /**
     * @param fechaInicioLiquidacion the fechaInicioLiquidacion to set
     */
    public void setFechaInicioLiquidacion(Date fechaInicioLiquidacion) {
        this.fechaInicioLiquidacion = fechaInicioLiquidacion;
    }

    /**
     * @return the fechaFinLiquidacion
     */
    public Date getFechaFinLiquidacion() {
        return fechaFinLiquidacion;
    }

    /**
     * @param fechaFinLiquidacion the fechaFinLiquidacion to set
     */
    public void setFechaFinLiquidacion(Date fechaFinLiquidacion) {
        this.fechaFinLiquidacion = fechaFinLiquidacion;
    }

    public List<TComprobante> getListarComprobante() {
        return listarComprobante;
    }

    /**
     * @param listarComprobante the listarComprobante to set
     */
    public void setListarComprobante(List<TComprobante> listarComprobante) {
        this.listarComprobante = listarComprobante;
    }

    /**
     * @return the listarDespacho
     */
    public List<TDespacho> getListarDespacho() {
        return listarDespacho;
    }

    /**
     * @param listarDespacho the listarDespacho to set
     */
    public void setListarDespacho(List<TDespacho> listarDespacho) {
        this.listarDespacho = listarDespacho;
    }

    /**
     * @return the listarLiquidacion
     */
    public List<TLiquidacion> getListarLiquidacion() {
        return listarLiquidacion;
    }

    /**
     * @param listarLiquidacion the listarLiquidacion to set
     */
    public void setListarLiquidacion(List<TLiquidacion> listarLiquidacion) {
        this.listarLiquidacion = listarLiquidacion;
    }

}
