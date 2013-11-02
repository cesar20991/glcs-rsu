package emch.modelo.entidades;
// Generated 01/11/2013 08:35:39 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TEmpresa generated by hbm2java
 */
public class TEmpresa  implements java.io.Serializable {


     private String cdRuc;
     private TUbigeo TUbigeo;
     private String rucE;
     private String rsocial;
     private Date fechaIni;
     private String direccion;
     private String telef;
     private byte[] logo;
     private Set<TLiquidacion> TLiquidacions = new HashSet<TLiquidacion>(0);
     private Set<TAccesoe> TAccesoes = new HashSet<TAccesoe>(0);
     private Set<TDespacho> TDespachos = new HashSet<TDespacho>(0);
     private Set<TCliente> TClientes = new HashSet<TCliente>(0);

    public TEmpresa() {
    }

	
    public TEmpresa(String cdRuc, TUbigeo TUbigeo, String rucE, String rsocial, Date fechaIni, String direccion, String telef) {
        this.cdRuc = cdRuc;
        this.TUbigeo = TUbigeo;
        this.rucE = rucE;
        this.rsocial = rsocial;
        this.fechaIni = fechaIni;
        this.direccion = direccion;
        this.telef = telef;
    }
    public TEmpresa(String cdRuc, TUbigeo TUbigeo, String rucE, String rsocial, Date fechaIni, String direccion, String telef, byte[] logo, Set<TLiquidacion> TLiquidacions, Set<TAccesoe> TAccesoes, Set<TDespacho> TDespachos, Set<TCliente> TClientes) {
       this.cdRuc = cdRuc;
       this.TUbigeo = TUbigeo;
       this.rucE = rucE;
       this.rsocial = rsocial;
       this.fechaIni = fechaIni;
       this.direccion = direccion;
       this.telef = telef;
       this.logo = logo;
       this.TLiquidacions = TLiquidacions;
       this.TAccesoes = TAccesoes;
       this.TDespachos = TDespachos;
       this.TClientes = TClientes;
    }
   
    public String getCdRuc() {
        return this.cdRuc;
    }
    
    public void setCdRuc(String cdRuc) {
        this.cdRuc = cdRuc;
    }
    public TUbigeo getTUbigeo() {
        return this.TUbigeo;
    }
    
    public void setTUbigeo(TUbigeo TUbigeo) {
        this.TUbigeo = TUbigeo;
    }
    public String getRucE() {
        return this.rucE;
    }
    
    public void setRucE(String rucE) {
        this.rucE = rucE;
    }
    public String getRsocial() {
        return this.rsocial;
    }
    
    public void setRsocial(String rsocial) {
        this.rsocial = rsocial;
    }
    public Date getFechaIni() {
        return this.fechaIni;
    }
    
    public void setFechaIni(Date fechaIni) {
        this.fechaIni = fechaIni;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getTelef() {
        return this.telef;
    }
    
    public void setTelef(String telef) {
        this.telef = telef;
    }
    public byte[] getLogo() {
        return this.logo;
    }
    
    public void setLogo(byte[] logo) {
        this.logo = logo;
    }
    public Set<TLiquidacion> getTLiquidacions() {
        return this.TLiquidacions;
    }
    
    public void setTLiquidacions(Set<TLiquidacion> TLiquidacions) {
        this.TLiquidacions = TLiquidacions;
    }
    public Set<TAccesoe> getTAccesoes() {
        return this.TAccesoes;
    }
    
    public void setTAccesoes(Set<TAccesoe> TAccesoes) {
        this.TAccesoes = TAccesoes;
    }
    public Set<TDespacho> getTDespachos() {
        return this.TDespachos;
    }
    
    public void setTDespachos(Set<TDespacho> TDespachos) {
        this.TDespachos = TDespachos;
    }
    public Set<TCliente> getTClientes() {
        return this.TClientes;
    }
    
    public void setTClientes(Set<TCliente> TClientes) {
        this.TClientes = TClientes;
    }




}


