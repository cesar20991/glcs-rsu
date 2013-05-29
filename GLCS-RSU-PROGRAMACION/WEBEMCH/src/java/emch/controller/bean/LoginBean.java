
package emch.controller.bean;

import emch.modelo.acceso.EmpresaManaged;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import emch.modelo.acceso.UsuarioManaged;
import emch.modelo.acceso.UsuarioManagedImpl;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TUsuario;
import java.util.List;
import org.primefaces.context.RequestContext;

@ManagedBean(name="loginBean")
@SessionScoped
public class LoginBean {

    private TUsuario usuario;
    private TEmpresa empresa;
    private String nomusuario="";
    private List<TEmpresa> listarempresa;
    private String nomempresa="";
    EmpresaManaged objTrb = new EmpresaManaged(); 
    
    public LoginBean() {        
    }

    public TUsuario getUsuario() {
        if(usuario== null){
            usuario = new TUsuario();
        }
        return usuario;
    }

    public void setUsuario(TUsuario usuario) {
        this.usuario = usuario;
    }
    
    public void login(ActionEvent actionEvent) {  
        RequestContext context = RequestContext.getCurrentInstance();  
        FacesMessage msg = null;  
        boolean loggedIn = false;  
        UsuarioManaged obj = new UsuarioManagedImpl();
        usuario = obj.buscarPorUsuario(usuario);
        empresa = obj.BuscarPorEmpresa(empresa);
        //VERIFICANDO ESTA MAL PERO Q QUEDA SALE u.u
        UsuarioManagedImpl obj2= new UsuarioManagedImpl();
        if(usuario != null) {  
            loggedIn = true;
            putsesion("usuario",usuario);
            putsesion("tipo","usu");
            putsesion("empresa", empresa);
            putsesion("tipoe", "emp");
            msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Bienvenido ", usuario.getNomUsu());  
        } else {  
            loggedIn = false;  
            msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Login Error", "Invalid credentials");  
        } 
        FacesContext.getCurrentInstance().addMessage(null, msg);  
        context.addCallbackParam("loggedIn", loggedIn);  
    }
    
    public void putsesion(String k, Object v){
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put(k, v); 
    }
    
    public Object obtsesion(String k) {
        return FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get(k);
    }

    public String getNomusuario() {
        return nomusuario;
    }

    public void setNomusuario(String nomusuario) {
        this.nomusuario = nomusuario;
    }

    public String getNomempresa() {
        return nomempresa;
    }

    public void setNomempresa(String nomempresa) {
        this.nomempresa = nomempresa;
    }

    public List<TEmpresa> getListarempresa() {
        EmpresaManaged obj = new EmpresaManaged();
        listarempresa = obj.ListarEmpresa();
        return listarempresa;
    }

    public void setListarempresa(List<TEmpresa> listarempresa) {
        this.listarempresa = listarempresa;
    }

    /**
     * @return the empresa
     */
    public TEmpresa getEmpresa() {
        empresa = new TEmpresa();
        return empresa;
    }

    /**
     * @param empresa the empresa to set
     */
    public void setEmpresa(TEmpresa empresa) {
        this.empresa = empresa;
    }
    
    
}
