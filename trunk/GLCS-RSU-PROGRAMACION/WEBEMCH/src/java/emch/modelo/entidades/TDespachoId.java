package emch.modelo.entidades;
// Generated 30-abr-2013 18:02:46 by Hibernate Tools 3.2.1.GA



/**
 * TDespachoId generated by hbm2java
 */
public class TDespachoId  implements java.io.Serializable {


     private String cdDespacho;
     private String rucE;

    public TDespachoId() {
    }

    public TDespachoId(String cdDespacho, String rucE) {
       this.cdDespacho = cdDespacho;
       this.rucE = rucE;
    }
   
    public String getCdDespacho() {
        return this.cdDespacho;
    }
    
    public void setCdDespacho(String cdDespacho) {
        this.cdDespacho = cdDespacho;
    }
    public String getRucE() {
        return this.rucE;
    }
    
    public void setRucE(String rucE) {
        this.rucE = rucE;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TDespachoId) ) return false;
		 TDespachoId castOther = ( TDespachoId ) other; 
         
		 return ( (this.getCdDespacho()==castOther.getCdDespacho()) || ( this.getCdDespacho()!=null && castOther.getCdDespacho()!=null && this.getCdDespacho().equals(castOther.getCdDespacho()) ) )
 && ( (this.getRucE()==castOther.getRucE()) || ( this.getRucE()!=null && castOther.getRucE()!=null && this.getRucE().equals(castOther.getRucE()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getCdDespacho() == null ? 0 : this.getCdDespacho().hashCode() );
         result = 37 * result + ( getRucE() == null ? 0 : this.getRucE().hashCode() );
         return result;
   }   


}


