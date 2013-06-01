/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.acceso.LiquidacionManaged;
import emch.modelo.entidades.*;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author Cesar
 */
@ManagedBean
@RequestScoped
public class LiquidacionBean extends UsuarioBean{

    private TLiquidacion liquidacion;
    private List<TLiquidacion> listaliquidacion;
    private List<TTipoliquidacion> listatipoliq;
    private List<TPesaje> listadopesaje;
     private TPesaje[] selectedpesaje;
               
    public LiquidacionBean() {
        liquidacion = new TLiquidacion(); 
        liquidacion.setTTipoliquidacion(new TTipoliquidacion());
        liquidacion.setTEmpresa(new TEmpresa());
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
    
    public String irAperturar(){
        return "generarliquidacion";
    }

    public List<TPesaje> getListadopesaje() {
        return listadopesaje;
    }

    public void setListadopesaje(List<TPesaje> listadopesaje) {
        this.listadopesaje = listadopesaje;
    }

    public TPesaje[] getSelectedpesaje() {
        return selectedpesaje;
    }

    public void setSelectedpesaje(TPesaje[] selectedpesaje) {
        this.selectedpesaje = selectedpesaje;
    }

}
