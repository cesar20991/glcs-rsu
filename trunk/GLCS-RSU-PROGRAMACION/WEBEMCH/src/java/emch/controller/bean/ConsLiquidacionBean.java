package emch.controller.bean;


import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;


@ManagedBean
@SessionScoped
public class ConsLiquidacionBean {
    private TLiquidacion liquidacion;
    private List<TLiquidacion> listarLiquidacion;
    
    
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
