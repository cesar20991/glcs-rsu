package emch.modelo.entidades;
// Generated 01/11/2013 03:25:49 PM by Hibernate Tools 3.2.1.GA



/**
 * TAccesoe generated by hbm2java
 */
public class TAccesoe  implements java.io.Serializable {


     private int idAe;
     private TGrupoacceso TGrupoacceso;
     private TPerfil TPerfil;
     private TEmpresa TEmpresa;

    public TAccesoe() {
    }

    public TAccesoe(int idAe, TGrupoacceso TGrupoacceso, TPerfil TPerfil, TEmpresa TEmpresa) {
       this.idAe = idAe;
       this.TGrupoacceso = TGrupoacceso;
       this.TPerfil = TPerfil;
       this.TEmpresa = TEmpresa;
    }
   
    public int getIdAe() {
        return this.idAe;
    }
    
    public void setIdAe(int idAe) {
        this.idAe = idAe;
    }
    public TGrupoacceso getTGrupoacceso() {
        return this.TGrupoacceso;
    }
    
    public void setTGrupoacceso(TGrupoacceso TGrupoacceso) {
        this.TGrupoacceso = TGrupoacceso;
    }
    public TPerfil getTPerfil() {
        return this.TPerfil;
    }
    
    public void setTPerfil(TPerfil TPerfil) {
        this.TPerfil = TPerfil;
    }
    public TEmpresa getTEmpresa() {
        return this.TEmpresa;
    }
    
    public void setTEmpresa(TEmpresa TEmpresa) {
        this.TEmpresa = TEmpresa;
    }




}


