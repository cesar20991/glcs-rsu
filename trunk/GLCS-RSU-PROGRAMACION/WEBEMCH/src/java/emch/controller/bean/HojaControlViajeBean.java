/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.model.DataModel;
import javax.swing.JOptionPane;

@ManagedBean
@RequestScoped
public class HojaControlViajeBean {

    private TDespacho despacho;
    private List<TControlviaje> listarControlViaje;
    
    public HojaControlViajeBean() {
    }

    public List<TControlviaje> getListarControlViaje() {
        return listarControlViaje;
    }

    public void setListarControlViaje(List<TControlviaje> listarControlViaje) {
        this.listarControlViaje = listarControlViaje;
    }
}
