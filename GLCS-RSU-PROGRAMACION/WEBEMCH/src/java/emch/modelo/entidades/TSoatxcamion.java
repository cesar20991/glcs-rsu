package emch.modelo.entidades;
// Generated May 23, 2013 7:29:14 PM by Hibernate Tools 3.2.1.GA



/**
 * TSoatxcamion generated by hbm2java
 */
public class TSoatxcamion  implements java.io.Serializable {


     private TSoatxcamionId id;
     private TSoat TSoat;
     private TCamion TCamion;
     private String obs;

    public TSoatxcamion() {
    }

	
    public TSoatxcamion(TSoatxcamionId id, TSoat TSoat, TCamion TCamion) {
        this.id = id;
        this.TSoat = TSoat;
        this.TCamion = TCamion;
    }
    public TSoatxcamion(TSoatxcamionId id, TSoat TSoat, TCamion TCamion, String obs) {
       this.id = id;
       this.TSoat = TSoat;
       this.TCamion = TCamion;
       this.obs = obs;
    }
   
    public TSoatxcamionId getId() {
        return this.id;
    }
    
    public void setId(TSoatxcamionId id) {
        this.id = id;
    }
    public TSoat getTSoat() {
        return this.TSoat;
    }
    
    public void setTSoat(TSoat TSoat) {
        this.TSoat = TSoat;
    }
    public TCamion getTCamion() {
        return this.TCamion;
    }
    
    public void setTCamion(TCamion TCamion) {
        this.TCamion = TCamion;
    }
    public String getObs() {
        return this.obs;
    }
    
    public void setObs(String obs) {
        this.obs = obs;
    }




}


