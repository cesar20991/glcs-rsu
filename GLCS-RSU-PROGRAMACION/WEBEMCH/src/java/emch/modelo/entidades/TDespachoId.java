package emch.modelo.entidades;
// Generated 01/11/2013 08:35:39 PM by Hibernate Tools 3.2.1.GA



/**
 * TDespachoId generated by hbm2java
 */
public class TDespachoId  implements java.io.Serializable {


     private String cdDespacho;
     private String cdRuc;

    public TDespachoId() {
    }

    public TDespachoId(String cdDespacho, String cdRuc) {
       this.cdDespacho = cdDespacho;
       this.cdRuc = cdRuc;
    }
   
    public String getCdDespacho() {
        return this.cdDespacho;
    }
    
    public void setCdDespacho(String cdDespacho) {
        this.cdDespacho = cdDespacho;
    }
    public String getCdRuc() {
        return this.cdRuc;
    }
    
    public void setCdRuc(String cdRuc) {
        this.cdRuc = cdRuc;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TDespachoId) ) return false;
		 TDespachoId castOther = ( TDespachoId ) other; 
         
		 return ( (this.getCdDespacho()==castOther.getCdDespacho()) || ( this.getCdDespacho()!=null && castOther.getCdDespacho()!=null && this.getCdDespacho().equals(castOther.getCdDespacho()) ) )
 && ( (this.getCdRuc()==castOther.getCdRuc()) || ( this.getCdRuc()!=null && castOther.getCdRuc()!=null && this.getCdRuc().equals(castOther.getCdRuc()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getCdDespacho() == null ? 0 : this.getCdDespacho().hashCode() );
         result = 37 * result + ( getCdRuc() == null ? 0 : this.getCdRuc().hashCode() );
         return result;
   }   


}


