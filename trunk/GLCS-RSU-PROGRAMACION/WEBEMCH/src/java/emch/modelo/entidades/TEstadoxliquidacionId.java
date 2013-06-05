package emch.modelo.entidades;
// Generated 05-jun-2013 2:10:37 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * TEstadoxliquidacionId generated by hbm2java
 */
public class TEstadoxliquidacionId  implements java.io.Serializable {


     private Date fechaEstado;
     private String cdEstadoLiq;
     private String cdLiq;

    public TEstadoxliquidacionId() {
    }

    public TEstadoxliquidacionId(Date fechaEstado, String cdEstadoLiq, String cdLiq) {
       this.fechaEstado = fechaEstado;
       this.cdEstadoLiq = cdEstadoLiq;
       this.cdLiq = cdLiq;
    }
   
    public Date getFechaEstado() {
        return this.fechaEstado;
    }
    
    public void setFechaEstado(Date fechaEstado) {
        this.fechaEstado = fechaEstado;
    }
    public String getCdEstadoLiq() {
        return this.cdEstadoLiq;
    }
    
    public void setCdEstadoLiq(String cdEstadoLiq) {
        this.cdEstadoLiq = cdEstadoLiq;
    }
    public String getCdLiq() {
        return this.cdLiq;
    }
    
    public void setCdLiq(String cdLiq) {
        this.cdLiq = cdLiq;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TEstadoxliquidacionId) ) return false;
		 TEstadoxliquidacionId castOther = ( TEstadoxliquidacionId ) other; 
         
		 return ( (this.getFechaEstado()==castOther.getFechaEstado()) || ( this.getFechaEstado()!=null && castOther.getFechaEstado()!=null && this.getFechaEstado().equals(castOther.getFechaEstado()) ) )
 && ( (this.getCdEstadoLiq()==castOther.getCdEstadoLiq()) || ( this.getCdEstadoLiq()!=null && castOther.getCdEstadoLiq()!=null && this.getCdEstadoLiq().equals(castOther.getCdEstadoLiq()) ) )
 && ( (this.getCdLiq()==castOther.getCdLiq()) || ( this.getCdLiq()!=null && castOther.getCdLiq()!=null && this.getCdLiq().equals(castOther.getCdLiq()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getFechaEstado() == null ? 0 : this.getFechaEstado().hashCode() );
         result = 37 * result + ( getCdEstadoLiq() == null ? 0 : this.getCdEstadoLiq().hashCode() );
         result = 37 * result + ( getCdLiq() == null ? 0 : this.getCdLiq().hashCode() );
         return result;
   }   


}


