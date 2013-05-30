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
    private TEmpresa empresa = empresa2;  
   
                
    public LiquidacionBean() {
        liquidacion = new TLiquidacion();
    }

    /**
     * @return the liquidacion
     */
    public TLiquidacion getLiquidacion() {
        return liquidacion;
    }

    /**
     * @param liquidacion the liquidacion to set
     */
    public void setLiquidacion(TLiquidacion liquidacion) {
        this.liquidacion = liquidacion;
    }

    /**
     * @return the listaliquidacion
     */
    public List<TLiquidacion> getListaliquidacion() {
        return listaliquidacion;
    }

    /**
     * @param listaliquidacion the listaliquidacion to set
     */
    public void setListaliquidacion(List<TLiquidacion> listaliquidacion) {
        this.listaliquidacion = listaliquidacion;
    }

    /**
     * @return the listatipoliq
     */
    public List<TTipoliquidacion> getListatipoliq() {
        return listatipoliq;
    }

    /**
     * @param listatipoliq the listatipoliq to set
     */
    public void setListatipoliq(List<TTipoliquidacion> listatipoliq) {
        this.listatipoliq = listatipoliq;
    }

    /**
     * @return the empresa
     */
    public TEmpresa getEmpresa() {
        return empresa;
    }

    /**
     * @param empresa the empresa to set
     */
    public void setEmpresa(TEmpresa empresa) {
        this.empresa = empresa;
    }

}
