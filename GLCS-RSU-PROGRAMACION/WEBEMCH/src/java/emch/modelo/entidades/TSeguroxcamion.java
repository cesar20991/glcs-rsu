package emch.modelo.entidades;
// Generated May 23, 2013 7:29:14 PM by Hibernate Tools 3.2.1.GA



/**
 * TSeguroxcamion generated by hbm2java
 */
public class TSeguroxcamion  implements java.io.Serializable {


     private TSeguroxcamionId id;
     private TSeguro TSeguro;
     private TCamion TCamion;
     private int nroPoliza;
     private String obs;

    public TSeguroxcamion() {
    }

	
    public TSeguroxcamion(TSeguroxcamionId id, TSeguro TSeguro, TCamion TCamion, int nroPoliza) {
        this.id = id;
        this.TSeguro = TSeguro;
        this.TCamion = TCamion;
        this.nroPoliza = nroPoliza;
    }
    public TSeguroxcamion(TSeguroxcamionId id, TSeguro TSeguro, TCamion TCamion, int nroPoliza, String obs) {
       this.id = id;
       this.TSeguro = TSeguro;
       this.TCamion = TCamion;
       this.nroPoliza = nroPoliza;
       this.obs = obs;
    }
   
    public TSeguroxcamionId getId() {
        return this.id;
    }
    
    public void setId(TSeguroxcamionId id) {
        this.id = id;
    }
    public TSeguro getTSeguro() {
        return this.TSeguro;
    }
    
    public void setTSeguro(TSeguro TSeguro) {
        this.TSeguro = TSeguro;
    }
    public TCamion getTCamion() {
        return this.TCamion;
    }
    
    public void setTCamion(TCamion TCamion) {
        this.TCamion = TCamion;
    }
    public int getNroPoliza() {
        return this.nroPoliza;
    }
    
    public void setNroPoliza(int nroPoliza) {
        this.nroPoliza = nroPoliza;
    }
    public String getObs() {
        return this.obs;
    }
    
    public void setObs(String obs) {
        this.obs = obs;
    }




}


