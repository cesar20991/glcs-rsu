package emch.modelo.entidades;
// Generated 05-jun-2013 2:10:37 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TGrupoacceso generated by hbm2java
 */
public class TGrupoacceso  implements java.io.Serializable {


     private int cdGa;
     private String descrip;
     private boolean estado;
     private Set<TAccesoe> TAccesoes = new HashSet<TAccesoe>(0);
     private Set<TAccesom> TAccesoms = new HashSet<TAccesom>(0);

    public TGrupoacceso() {
    }

	
    public TGrupoacceso(int cdGa, String descrip, boolean estado) {
        this.cdGa = cdGa;
        this.descrip = descrip;
        this.estado = estado;
    }
    public TGrupoacceso(int cdGa, String descrip, boolean estado, Set<TAccesoe> TAccesoes, Set<TAccesom> TAccesoms) {
       this.cdGa = cdGa;
       this.descrip = descrip;
       this.estado = estado;
       this.TAccesoes = TAccesoes;
       this.TAccesoms = TAccesoms;
    }
   
    public int getCdGa() {
        return this.cdGa;
    }
    
    public void setCdGa(int cdGa) {
        this.cdGa = cdGa;
    }
    public String getDescrip() {
        return this.descrip;
    }
    
    public void setDescrip(String descrip) {
        this.descrip = descrip;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    public Set<TAccesoe> getTAccesoes() {
        return this.TAccesoes;
    }
    
    public void setTAccesoes(Set<TAccesoe> TAccesoes) {
        this.TAccesoes = TAccesoes;
    }
    public Set<TAccesom> getTAccesoms() {
        return this.TAccesoms;
    }
    
    public void setTAccesoms(Set<TAccesom> TAccesoms) {
        this.TAccesoms = TAccesoms;
    }




}


