/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.acceso.VerificarComprobanteManaged;
import emch.modelo.entidades.TPesaje;
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
        listarPesajeSel=obj.listarPesaje(fechaInicio,fechaFin);
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
     * @return the valorbusq
     */
    public String getValorbusq() {
        return valorbusq;
    }

    /**
     * @param valorbusq the valorbusq to set
     */
    public void setValorbusq(String valorbusq) {
        this.valorbusq = valorbusq;
    }

}
