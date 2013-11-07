
package emch.controller.bean;

import emch.modelo.acceso.LiquidacionManaged;
import emch.modelo.entidades.TLiquidacion;
import java.io.IOException;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class ConsLiquidacionMobileBean {
     private TLiquidacion liquidacion;
    public List<TLiquidacion> listarLiquidacion;  
    
    @PostConstruct
    public void init() {
        
    }
    
    public TLiquidacion getLiquidacion() {
        return liquidacion;
    }

    public void setLiquidacion(TLiquidacion liquidacion) {
        this.liquidacion = liquidacion;
    }

    public List<TLiquidacion> getListarLiquidacion() {
        LiquidacionManaged objLiq = new LiquidacionManaged();
        listarLiquidacion = objLiq.listarLiquidacion();
        return listarLiquidacion;
    }

    public void setListarLiquidacion(List<TLiquidacion> listarLiquidacion) {
        this.listarLiquidacion = listarLiquidacion;
    }   
}
