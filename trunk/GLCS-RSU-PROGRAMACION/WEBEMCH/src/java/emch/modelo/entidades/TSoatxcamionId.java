package emch.modelo.entidades;
// Generated 31-may-2013 22:17:08 by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * TSoatxcamionId generated by hbm2java
 */
public class TSoatxcamionId  implements java.io.Serializable {


     private Date fechaVecS;
     private int idSoat;
     private String cdCamion;

    public TSoatxcamionId() {
    }

    public TSoatxcamionId(Date fechaVecS, int idSoat, String cdCamion) {
       this.fechaVecS = fechaVecS;
       this.idSoat = idSoat;
       this.cdCamion = cdCamion;
    }
   
    public Date getFechaVecS() {
        return this.fechaVecS;
    }
    
    public void setFechaVecS(Date fechaVecS) {
        this.fechaVecS = fechaVecS;
    }
    public int getIdSoat() {
        return this.idSoat;
    }
    
    public void setIdSoat(int idSoat) {
        this.idSoat = idSoat;
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
		 if ( !(other instanceof TSoatxcamionId) ) return false;
		 TSoatxcamionId castOther = ( TSoatxcamionId ) other; 
         
		 return ( (this.getFechaVecS()==castOther.getFechaVecS()) || ( this.getFechaVecS()!=null && castOther.getFechaVecS()!=null && this.getFechaVecS().equals(castOther.getFechaVecS()) ) )
 && (this.getIdSoat()==castOther.getIdSoat())
 && ( (this.getCdCamion()==castOther.getCdCamion()) || ( this.getCdCamion()!=null && castOther.getCdCamion()!=null && this.getCdCamion().equals(castOther.getCdCamion()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getFechaVecS() == null ? 0 : this.getFechaVecS().hashCode() );
         result = 37 * result + this.getIdSoat();
         result = 37 * result + ( getCdCamion() == null ? 0 : this.getCdCamion().hashCode() );
         return result;
   }   


}


