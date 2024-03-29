package emch.modelo.entidades;
// Generated 01/11/2013 08:35:39 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TUsuario generated by hbm2java
 */
public class TUsuario  implements java.io.Serializable {


     private String nomUsu;
     private TPerfil TPerfil;
     private String pass;
     private boolean estado;
     private boolean accesoWeb;
     private boolean accesoMobile;
     private Set<TTrabajador> TTrabajadors = new HashSet<TTrabajador>(0);
     private Set<TCliente> TClientes = new HashSet<TCliente>(0);

    public TUsuario() {
    }

	
    public TUsuario(String nomUsu, TPerfil TPerfil, String pass, boolean estado, boolean accesoWeb, boolean accesoMobile) {
        this.nomUsu = nomUsu;
        this.TPerfil = TPerfil;
        this.pass = pass;
        this.estado = estado;
        this.accesoWeb = accesoWeb;
        this.accesoMobile = accesoMobile;
    }
    public TUsuario(String nomUsu, TPerfil TPerfil, String pass, boolean estado, boolean accesoWeb, boolean accesoMobile, Set<TTrabajador> TTrabajadors, Set<TCliente> TClientes) {
       this.nomUsu = nomUsu;
       this.TPerfil = TPerfil;
       this.pass = pass;
       this.estado = estado;
       this.accesoWeb = accesoWeb;
       this.accesoMobile = accesoMobile;
       this.TTrabajadors = TTrabajadors;
       this.TClientes = TClientes;
    }
   
    public String getNomUsu() {
        return this.nomUsu;
    }
    
    public void setNomUsu(String nomUsu) {
        this.nomUsu = nomUsu;
    }
    public TPerfil getTPerfil() {
        return this.TPerfil;
    }
    
    public void setTPerfil(TPerfil TPerfil) {
        this.TPerfil = TPerfil;
    }
    public String getPass() {
        return this.pass;
    }
    
    public void setPass(String pass) {
        this.pass = pass;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    public boolean isAccesoWeb() {
        return this.accesoWeb;
    }
    
    public void setAccesoWeb(boolean accesoWeb) {
        this.accesoWeb = accesoWeb;
    }
    public boolean isAccesoMobile() {
        return this.accesoMobile;
    }
    
    public void setAccesoMobile(boolean accesoMobile) {
        this.accesoMobile = accesoMobile;
    }
    public Set<TTrabajador> getTTrabajadors() {
        return this.TTrabajadors;
    }
    
    public void setTTrabajadors(Set<TTrabajador> TTrabajadors) {
        this.TTrabajadors = TTrabajadors;
    }
    public Set<TCliente> getTClientes() {
        return this.TClientes;
    }
    
    public void setTClientes(Set<TCliente> TClientes) {
        this.TClientes = TClientes;
    }




}


