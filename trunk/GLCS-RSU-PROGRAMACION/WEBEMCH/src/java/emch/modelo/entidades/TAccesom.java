package emch.modelo.entidades;
// Generated 29-may-2013 1:03:45 by Hibernate Tools 3.2.1.GA



/**
 * TAccesom generated by hbm2java
 */
public class TAccesom  implements java.io.Serializable {


     private int idAm;
     private TGrupoacceso TGrupoacceso;
     private TMenu TMenu;
     private boolean estado;

    public TAccesom() {
    }

    public TAccesom(int idAm, TGrupoacceso TGrupoacceso, TMenu TMenu, boolean estado) {
       this.idAm = idAm;
       this.TGrupoacceso = TGrupoacceso;
       this.TMenu = TMenu;
       this.estado = estado;
    }
   
    public int getIdAm() {
        return this.idAm;
    }
    
    public void setIdAm(int idAm) {
        this.idAm = idAm;
    }
    public TGrupoacceso getTGrupoacceso() {
        return this.TGrupoacceso;
    }
    
    public void setTGrupoacceso(TGrupoacceso TGrupoacceso) {
        this.TGrupoacceso = TGrupoacceso;
    }
    public TMenu getTMenu() {
        return this.TMenu;
    }
    
    public void setTMenu(TMenu TMenu) {
        this.TMenu = TMenu;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }




}

