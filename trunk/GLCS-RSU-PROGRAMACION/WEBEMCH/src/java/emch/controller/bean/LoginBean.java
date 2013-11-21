package emch.controller.bean;

import emch.modelo.acceso.EmpresaManaged;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import emch.modelo.acceso.UsuarioManaged;
import emch.modelo.acceso.UsuarioManagedImpl;
import emch.modelo.entidades.TCliente;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TUsuario;
import java.io.IOException;
import java.util.List;
import org.primefaces.context.RequestContext;

@ManagedBean(name = "loginBean")
@SessionScoped
public class LoginBean {

    private TUsuario usuario;
    private TEmpresa empresa;
    private TCliente cliente;
    private String nomusuario = "";
    private List<TEmpresa> listarempresa;
    private String nomempresa = "";
    EmpresaManaged objTrb = new EmpresaManaged();
    private boolean accesoMovil;

    public LoginBean() {
    }

    public TUsuario getUsuario() {
        if (usuario == null) {
            usuario = new TUsuario();
        }
        return usuario;
    }

    public void setUsuario(TUsuario usuario) {
        this.usuario = usuario;
    }

    @SuppressWarnings("UnusedAssignment")
    public void login(ActionEvent actionEvent) throws IOException {
        //VERIFICANDO ESTA MAL PERO Q QUEDA SALE u.u
        RequestContext context = RequestContext.getCurrentInstance();
        FacesMessage msg = null;
        boolean loggedIn = false;
        UsuarioManaged obj = new UsuarioManagedImpl();
        usuario = obj.buscarPorUsuario(usuario);
        empresa = obj.BuscarPorEmpresa(empresa);
        if (usuario != null) {
            if (isAccesoMovil()) { // TIENE ACCESO MOVIL
                if (usuario.isAccesoMobile()) {
                    loggedIn = true;
                    putsesion("usuario", usuario);
                    putsesion("tipo", "usu");
                    putsesion("empresa", empresa);
                    putsesion("tipoe", "emp");
                    putsesion("perfil", usuario.getTPerfil());
                    putsesion("tipop", "perf");
                    context.addCallbackParam("loggedIn", loggedIn);
                    FacesContext.getCurrentInstance().getExternalContext().redirect("faces/mobile/principalMobile.xhtml");
                } else { //NO TIENE ACESO MOBILE
                    loggedIn = false;
                    msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "No tiene acceso a la función Móvil", "Verificar");
                    FacesContext.getCurrentInstance().addMessage(null, msg);
                }
            } else { // ACCESO WEB
                if (usuario.isAccesoWeb()) { // TIENE ACCESO WEB
                    loggedIn = true;
                    putsesion("usuario", usuario);
                    putsesion("tipo", "usu");
                    putsesion("empresa", empresa);
                    putsesion("tipoe", "emp");
                    putsesion("perfil", usuario.getTPerfil());
                    putsesion("tipop", "perf");
                    msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Bienvenido ", usuario.getNomUsu());
                    FacesContext.getCurrentInstance().addMessage(null, msg);
                    context.addCallbackParam("loggedIn", loggedIn);
                    FacesContext.getCurrentInstance().getExternalContext().redirect("faces/principal.xhtml");
                } else { //NO TIENE ACESO WEB
                    loggedIn = false;
                    msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "No tiene acceso a la función Web", "Verificar");
                    FacesContext.getCurrentInstance().addMessage(null, msg);
                }
            }
        } else {
            loggedIn = false;
            msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Login Error", "Invalid credentials");
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
    }

    public void loginCliente(ActionEvent actionEvent) throws IOException {
        RequestContext context = RequestContext.getCurrentInstance();
        FacesMessage msg = null;
        boolean loggedIn = false;
        UsuarioManaged obj = new UsuarioManagedImpl();
        usuario = obj.buscarPorUsuario(usuario);
        empresa = obj.buscarRuc(usuario);
        if (usuario != null) {
            if (isAccesoMovil()) { // TIENE ACCESO MOVIL
                if (usuario.isAccesoMobile()) {
                    loggedIn = true;
                    putsesion("usuario", usuario);
                    putsesion("empresa", empresa);
                    msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Bienvenido ", usuario.getNomUsu());
                    FacesContext.getCurrentInstance().addMessage(null, msg);
                    context.addCallbackParam("loggedIn", loggedIn);
                    FacesContext.getCurrentInstance().getExternalContext().redirect("faces/mobile/principalMobileC.xhtml");
                } else {//NO TIENE ACESO MOBILE
                    loggedIn = false;
                    msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "No tiene acceso a la función Móvil", "Verificar");
                    FacesContext.getCurrentInstance().addMessage(null, msg);
                }
            } else { // ACCESO WEB
                loggedIn = true;
                putsesion("usuario", usuario);
                putsesion("empresa", empresa);
                msg = new FacesMessage(FacesMessage.SEVERITY_INFO, "Bienvenido ", usuario.getNomUsu());
                FacesContext.getCurrentInstance().addMessage(null, msg);
                context.addCallbackParam("loggedIn", loggedIn);
                FacesContext.getCurrentInstance().getExternalContext().redirect("faces/emch-operaciones/ComprobantesPorCliente.xhtml");
            }
        } else {//NO TIENE ACESO WEB
            loggedIn = false;
            msg = new FacesMessage(FacesMessage.SEVERITY_WARN, "Login Error", "Invalid credentials");
            FacesContext.getCurrentInstance().addMessage(null, msg);
        }
        //context.addCallbackParam("loggedIn", loggedIn);
    }

    public void putsesion(String k, Object v) {
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

    public boolean isAccesoMovil() {
        return accesoMovil;
    }

    public void setAccesoMovil(boolean accesoMovil) {
        this.accesoMovil = accesoMovil;
    }
}
