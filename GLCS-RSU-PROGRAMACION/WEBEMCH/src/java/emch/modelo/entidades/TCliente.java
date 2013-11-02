package emch.modelo.entidades;
// Generated 01/11/2013 08:35:39 PM by Hibernate Tools 3.2.1.GA



/**
 * TCliente generated by hbm2java
 */
public class TCliente  implements java.io.Serializable {


     private String cdCliente;
     private TUsuario TUsuario;
     private TUbigeo TUbigeo;
     private TEmpresa TEmpresa;
     private String nombreComp;
     private char tipoDocI;
     private String nroDocI;
     private String domicilio;
     private String telefono;
     private String celular;
     private String email;
     private boolean estado;

    public TCliente() {
    }

	
    public TCliente(String cdCliente, TUsuario TUsuario, TUbigeo TUbigeo, TEmpresa TEmpresa, String nombreComp, char tipoDocI, String nroDocI, String domicilio, boolean estado) {
        this.cdCliente = cdCliente;
        this.TUsuario = TUsuario;
        this.TUbigeo = TUbigeo;
        this.TEmpresa = TEmpresa;
        this.nombreComp = nombreComp;
        this.tipoDocI = tipoDocI;
        this.nroDocI = nroDocI;
        this.domicilio = domicilio;
        this.estado = estado;
    }
    public TCliente(String cdCliente, TUsuario TUsuario, TUbigeo TUbigeo, TEmpresa TEmpresa, String nombreComp, char tipoDocI, String nroDocI, String domicilio, String telefono, String celular, String email, boolean estado) {
       this.cdCliente = cdCliente;
       this.TUsuario = TUsuario;
       this.TUbigeo = TUbigeo;
       this.TEmpresa = TEmpresa;
       this.nombreComp = nombreComp;
       this.tipoDocI = tipoDocI;
       this.nroDocI = nroDocI;
       this.domicilio = domicilio;
       this.telefono = telefono;
       this.celular = celular;
       this.email = email;
       this.estado = estado;
    }
   
    public String getCdCliente() {
        return this.cdCliente;
    }
    
    public void setCdCliente(String cdCliente) {
        this.cdCliente = cdCliente;
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
    public TEmpresa getTEmpresa() {
        return this.TEmpresa;
    }
    
    public void setTEmpresa(TEmpresa TEmpresa) {
        this.TEmpresa = TEmpresa;
    }
    public String getNombreComp() {
        return this.nombreComp;
    }
    
    public void setNombreComp(String nombreComp) {
        this.nombreComp = nombreComp;
    }
    public char getTipoDocI() {
        return this.tipoDocI;
    }
    
    public void setTipoDocI(char tipoDocI) {
        this.tipoDocI = tipoDocI;
    }
    public String getNroDocI() {
        return this.nroDocI;
    }
    
    public void setNroDocI(String nroDocI) {
        this.nroDocI = nroDocI;
    }
    public String getDomicilio() {
        return this.domicilio;
    }
    
    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
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




}


