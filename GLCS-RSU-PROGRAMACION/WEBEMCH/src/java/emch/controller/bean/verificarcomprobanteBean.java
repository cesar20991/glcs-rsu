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
public class verificarcomprobanteBean {
    
    private List<TPesaje> listarPesajeSel;
    private Date fechaInicio;
    private Date fechaFin;
    private String valorbusq;
        
    public verificarcomprobanteBean() {
        
    }
    
    public String irBuscar(){
        VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
        listarPesajeSel= obj.listarPesaje(fechaInicio,fechaFin,valorbusq);                 
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
        
    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getValorbusq() {
        return valorbusq;
    }

    public void setValorbusq(String valorbusq) {
        this.valorbusq = valorbusq;
    }

}
