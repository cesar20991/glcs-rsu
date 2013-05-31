package emch.modelo.entidades;
// Generated 30-may-2013 7:59:42 by Hibernate Tools 3.2.1.GA



/**
 * TControlviajeId generated by hbm2java
 */
public class TControlviajeId  implements java.io.Serializable {


     private String cdControlViaje;
     private int nroViaje;

    public TControlviajeId() {
    }

    public TControlviajeId(String cdControlViaje, int nroViaje) {
       this.cdControlViaje = cdControlViaje;
       this.nroViaje = nroViaje;
    }
   
    public String getCdControlViaje() {
        return this.cdControlViaje;
    }
    
    public void setCdControlViaje(String cdControlViaje) {
        this.cdControlViaje = cdControlViaje;
    }
    public int getNroViaje() {
        return this.nroViaje;
    }
    
    public void setNroViaje(int nroViaje) {
        this.nroViaje = nroViaje;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TControlviajeId) ) return false;
		 TControlviajeId castOther = ( TControlviajeId ) other; 
         
		 return ( (this.getCdControlViaje()==castOther.getCdControlViaje()) || ( this.getCdControlViaje()!=null && castOther.getCdControlViaje()!=null && this.getCdControlViaje().equals(castOther.getCdControlViaje()) ) )
 && (this.getNroViaje()==castOther.getNroViaje());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getCdControlViaje() == null ? 0 : this.getCdControlViaje().hashCode() );
         result = 37 * result + this.getNroViaje();
         return result;
   }   


}

