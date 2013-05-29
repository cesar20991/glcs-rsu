package emch.modelo.entidades;
// Generated 29-may-2013 1:03:45 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TUbigeo generated by hbm2java
 */
public class TUbigeo  implements java.io.Serializable {


     private String cdUbig;
     private String nombre;
     private boolean estado;
     private Set<TEmpresa> TEmpresas = new HashSet<TEmpresa>(0);
     private Set<TCliente> TClientes = new HashSet<TCliente>(0);
     private Set<TTrabajador> TTrabajadors = new HashSet<TTrabajador>(0);
     private Set<TDespacho> TDespachos = new HashSet<TDespacho>(0);

    public TUbigeo() {
    }

	
    public TUbigeo(String cdUbig, String nombre, boolean estado) {
        this.cdUbig = cdUbig;
        this.nombre = nombre;
        this.estado = estado;
    }
    public TUbigeo(String cdUbig, String nombre, boolean estado, Set<TEmpresa> TEmpresas, Set<TCliente> TClientes, Set<TTrabajador> TTrabajadors, Set<TDespacho> TDespachos) {
       this.cdUbig = cdUbig;
       this.nombre = nombre;
       this.estado = estado;
       this.TEmpresas = TEmpresas;
       this.TClientes = TClientes;
       this.TTrabajadors = TTrabajadors;
       this.TDespachos = TDespachos;
    }
   
    public String getCdUbig() {
        return this.cdUbig;
    }
    
    public void setCdUbig(String cdUbig) {
        this.cdUbig = cdUbig;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    public Set<TEmpresa> getTEmpresas() {
        return this.TEmpresas;
    }
    
    public void setTEmpresas(Set<TEmpresa> TEmpresas) {
        this.TEmpresas = TEmpresas;
    }
    public Set<TCliente> getTClientes() {
        return this.TClientes;
    }
    
    public void setTClientes(Set<TCliente> TClientes) {
        this.TClientes = TClientes;
    }
    public Set<TTrabajador> getTTrabajadors() {
        return this.TTrabajadors;
    }
    
    public void setTTrabajadors(Set<TTrabajador> TTrabajadors) {
        this.TTrabajadors = TTrabajadors;
    }
    public Set<TDespacho> getTDespachos() {
        return this.TDespachos;
    }
    
    public void setTDespachos(Set<TDespacho> TDespachos) {
        this.TDespachos = TDespachos;
    }




}


