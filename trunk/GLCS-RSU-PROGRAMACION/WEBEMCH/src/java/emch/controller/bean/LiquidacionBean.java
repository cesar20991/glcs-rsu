/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

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
               
    public LiquidacionBean() {
        liquidacion = new TLiquidacion(); 
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
        return listatipoliq;
    }

    public void setListatipoliq(List<TTipoliquidacion> listatipoliq) {
        this.listatipoliq = listatipoliq;
    }


}
