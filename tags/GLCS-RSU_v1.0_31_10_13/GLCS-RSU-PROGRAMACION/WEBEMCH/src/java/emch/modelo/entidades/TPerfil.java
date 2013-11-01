package emch.modelo.entidades;
// Generated 13-jun-2013 0:55:31 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TPerfil generated by hbm2java
 */
public class TPerfil  implements java.io.Serializable {


     private String cdPerfil;
     private String nombrePrf;
     private String descripPrf;
     private boolean estado;
     private Set<TAccesoe> TAccesoes = new HashSet<TAccesoe>(0);
     private Set<TUsuario> TUsuarios = new HashSet<TUsuario>(0);

    public TPerfil() {
    }

	
    public TPerfil(String cdPerfil, String nombrePrf, boolean estado) {
        this.cdPerfil = cdPerfil;
        this.nombrePrf = nombrePrf;
        this.estado = estado;
    }
    public TPerfil(String cdPerfil, String nombrePrf, String descripPrf, boolean estado, Set<TAccesoe> TAccesoes, Set<TUsuario> TUsuarios) {
       this.cdPerfil = cdPerfil;
       this.nombrePrf = nombrePrf;
       this.descripPrf = descripPrf;
       this.estado = estado;
       this.TAccesoes = TAccesoes;
       this.TUsuarios = TUsuarios;
    }
   
    public String getCdPerfil() {
        return this.cdPerfil;
    }
    
    public void setCdPerfil(String cdPerfil) {
        this.cdPerfil = cdPerfil;
    }
    public String getNombrePrf() {
        return this.nombrePrf;
    }
    
    public void setNombrePrf(String nombrePrf) {
        this.nombrePrf = nombrePrf;
    }
    public String getDescripPrf() {
        return this.descripPrf;
    }
    
    public void setDescripPrf(String descripPrf) {
        this.descripPrf = descripPrf;
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
    public Set<TUsuario> getTUsuarios() {
        return this.TUsuarios;
    }
    
    public void setTUsuarios(Set<TUsuario> TUsuarios) {
        this.TUsuarios = TUsuarios;
    }




}


