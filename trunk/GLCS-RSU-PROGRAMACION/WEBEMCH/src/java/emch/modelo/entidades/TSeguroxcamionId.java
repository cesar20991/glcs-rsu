package emch.modelo.entidades;
// Generated May 23, 2013 7:29:14 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * TSeguroxcamionId generated by hbm2java
 */
public class TSeguroxcamionId  implements java.io.Serializable {


     private Date fechaVec;
     private String idSeguro;
     private String cdCamion;

    public TSeguroxcamionId() {
    }

    public TSeguroxcamionId(Date fechaVec, String idSeguro, String cdCamion) {
       this.fechaVec = fechaVec;
       this.idSeguro = idSeguro;
       this.cdCamion = cdCamion;
    }
   
    public Date getFechaVec() {
        return this.fechaVec;
    }
    
    public void setFechaVec(Date fechaVec) {
        this.fechaVec = fechaVec;
    }
    public String getIdSeguro() {
        return this.idSeguro;
    }
    
    public void setIdSeguro(String idSeguro) {
        this.idSeguro = idSeguro;
    }
    public String getCdCamion() {
        return this.cdCamion;
    }
    
    public void setCdCamion(String cdCamion) {
        this.cdCamion = cdCamion;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TSeguroxcamionId) ) return false;
		 TSeguroxcamionId castOther = ( TSeguroxcamionId ) other; 
         
		 return ( (this.getFechaVec()==castOther.getFechaVec()) || ( this.getFechaVec()!=null && castOther.getFechaVec()!=null && this.getFechaVec().equals(castOther.getFechaVec()) ) )
 && ( (this.getIdSeguro()==castOther.getIdSeguro()) || ( this.getIdSeguro()!=null && castOther.getIdSeguro()!=null && this.getIdSeguro().equals(castOther.getIdSeguro()) ) )
 && ( (this.getCdCamion()==castOther.getCdCamion()) || ( this.getCdCamion()!=null && castOther.getCdCamion()!=null && this.getCdCamion().equals(castOther.getCdCamion()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getFechaVec() == null ? 0 : this.getFechaVec().hashCode() );
         result = 37 * result + ( getIdSeguro() == null ? 0 : this.getIdSeguro().hashCode() );
         result = 37 * result + ( getCdCamion() == null ? 0 : this.getCdCamion().hashCode() );
         return result;
   }   


}


