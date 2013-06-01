package emch.modelo.entidades;
// Generated 31-may-2013 22:17:08 by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * TTrabajador generated by hbm2java
 */
public class TTrabajador  implements java.io.Serializable {


     private String cdTrabajador;
     private TTipotrabajador TTipotrabajador;
     private TUsuario TUsuario;
     private TUbigeo TUbigeo;
     private String nombres;
     private String apellidos;
     private String dni;
     private String telefono;
     private String celular;
     private String email;
     private boolean estado;
     private Set<TTrabajadorxcamion> TTrabajadorxcamions = new HashSet<TTrabajadorxcamion>(0);
     private Set<TAsistenciaxtrabajador> TAsistenciaxtrabajadors = new HashSet<TAsistenciaxtrabajador>(0);

    public TTrabajador() {
    }

	
    public TTrabajador(String cdTrabajador, TTipotrabajador TTipotrabajador, TUbigeo TUbigeo, String nombres, String apellidos, String dni, boolean estado) {
        this.cdTrabajador = cdTrabajador;
        this.TTipotrabajador = TTipotrabajador;
        this.TUbigeo = TUbigeo;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dni = dni;
        this.estado = estado;
    }
    public TTrabajador(String cdTrabajador, TTipotrabajador TTipotrabajador, TUsuario TUsuario, TUbigeo TUbigeo, String nombres, String apellidos, String dni, String telefono, String celular, String email, boolean estado, Set<TTrabajadorxcamion> TTrabajadorxcamions, Set<TAsistenciaxtrabajador> TAsistenciaxtrabajadors) {
       this.cdTrabajador = cdTrabajador;
       this.TTipotrabajador = TTipotrabajador;
       this.TUsuario = TUsuario;
       this.TUbigeo = TUbigeo;
       this.nombres = nombres;
       this.apellidos = apellidos;
       this.dni = dni;
       this.telefono = telefono;
       this.celular = celular;
       this.email = email;
       this.estado = estado;
       this.TTrabajadorxcamions = TTrabajadorxcamions;
       this.TAsistenciaxtrabajadors = TAsistenciaxtrabajadors;
    }
   
    public String getCdTrabajador() {
        return this.cdTrabajador;
    }
    
    public void setCdTrabajador(String cdTrabajador) {
        this.cdTrabajador = cdTrabajador;
    }
    public TTipotrabajador getTTipotrabajador() {
        return this.TTipotrabajador;
    }
    
    public void setTTipotrabajador(TTipotrabajador TTipotrabajador) {
        this.TTipotrabajador = TTipotrabajador;
    }
    public TUsuario getTUsuario() {
        return this.TUsuario;
    }
    
    public void setTUsuario(TUsuario TUsuario) {
        this.TUsuario = TUsuario;
    }
    public TUbigeo getTUbigeo() {
        return this.TUbigeo;
    }
    
    public void setTUbigeo(TUbigeo TUbigeo) {
        this.TUbigeo = TUbigeo;
    }
    public String getNombres() {
        return this.nombres;
    }
    
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public String getDni() {
        return this.dni;
    }
    
    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getCelular() {
        return this.celular;
    }
    
    public void setCelular(String celular) {
        this.celular = celular;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public boolean isEstado() {
        return this.estado;
    }
    
    public void setEstado(boolean estado) {
        this.estado = estado;
    }
    public Set<TTrabajadorxcamion> getTTrabajadorxcamions() {
        return this.TTrabajadorxcamions;
    }
    
    public void setTTrabajadorxcamions(Set<TTrabajadorxcamion> TTrabajadorxcamions) {
        this.TTrabajadorxcamions = TTrabajadorxcamions;
    }
    public Set<TAsistenciaxtrabajador> getTAsistenciaxtrabajadors() {
        return this.TAsistenciaxtrabajadors;
    }
    
    public void setTAsistenciaxtrabajadors(Set<TAsistenciaxtrabajador> TAsistenciaxtrabajadors) {
        this.TAsistenciaxtrabajadors = TAsistenciaxtrabajadors;
    }




}


