package emch.modelo.entidades;
// Generated 05-jun-2013 2:10:37 by Hibernate Tools 3.2.1.GA



/**
 * TDespachodetId generated by hbm2java
 */
public class TDespachodetId  implements java.io.Serializable {


     private int nro;
     private String cdDespacho;
     private String cdRuc;

    public TDespachodetId() {
    }

    public TDespachodetId(int nro, String cdDespacho, String cdRuc) {
       this.nro = nro;
       this.cdDespacho = cdDespacho;
       this.cdRuc = cdRuc;
    }
   
    public int getNro() {
        return this.nro;
    }
    
    public void setNro(int nro) {
        this.nro = nro;
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
		 if ( !(other instanceof TDespachodetId) ) return false;
		 TDespachodetId castOther = ( TDespachodetId ) other; 
         
		 return (this.getNro()==castOther.getNro())
 && ( (this.getCdDespacho()==castOther.getCdDespacho()) || ( this.getCdDespacho()!=null && castOther.getCdDespacho()!=null && this.getCdDespacho().equals(castOther.getCdDespacho()) ) )
 && ( (this.getCdRuc()==castOther.getCdRuc()) || ( this.getCdRuc()!=null && castOther.getCdRuc()!=null && this.getCdRuc().equals(castOther.getCdRuc()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getNro();
         result = 37 * result + ( getCdDespacho() == null ? 0 : this.getCdDespacho().hashCode() );
         result = 37 * result + ( getCdRuc() == null ? 0 : this.getCdRuc().hashCode() );
         return result;
   }   


}


