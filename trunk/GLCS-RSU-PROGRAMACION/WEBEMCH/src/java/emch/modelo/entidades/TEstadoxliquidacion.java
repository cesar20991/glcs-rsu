package emch.modelo.entidades;
// Generated 30-may-2013 7:59:42 by Hibernate Tools 3.2.1.GA



/**
 * TEstadoxliquidacion generated by hbm2java
 */
public class TEstadoxliquidacion  implements java.io.Serializable {


     private TEstadoxliquidacionId id;
     private TEstadoliq TEstadoliq;
     private TLiquidacion TLiquidacion;
     private String obs;

    public TEstadoxliquidacion() {
    }

	
    public TEstadoxliquidacion(TEstadoxliquidacionId id, TEstadoliq TEstadoliq, TLiquidacion TLiquidacion) {
        this.id = id;
        this.TEstadoliq = TEstadoliq;
        this.TLiquidacion = TLiquidacion;
    }
    public TEstadoxliquidacion(TEstadoxliquidacionId id, TEstadoliq TEstadoliq, TLiquidacion TLiquidacion, String obs) {
       this.id = id;
       this.TEstadoliq = TEstadoliq;
       this.TLiquidacion = TLiquidacion;
       this.obs = obs;
    }
   
    public TEstadoxliquidacionId getId() {
        return this.id;
    }
    
    public void setId(TEstadoxliquidacionId id) {
        this.id = id;
    }
    public TEstadoliq getTEstadoliq() {
        return this.TEstadoliq;
    }
    
    public void setTEstadoliq(TEstadoliq TEstadoliq) {
        this.TEstadoliq = TEstadoliq;
    }
    public TLiquidacion getTLiquidacion() {
        return this.TLiquidacion;
    }
    
    public void setTLiquidacion(TLiquidacion TLiquidacion) {
        this.TLiquidacion = TLiquidacion;
    }
    public String getObs() {
        return this.obs;
    }
    
    public void setObs(String obs) {
        this.obs = obs;
    }




}


