/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TUsuario;
import java.util.Date;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.model.MenuModel;

/**s
 *
 * @author Cesar
 */
@ManagedBean
@SessionScoped
public class UsuarioBean {

    public String nomusuario = "";
    public String nomEmpresa = "";
    public String ruc = "";     //EJM: 2109312309
    public String rucEmp = ""; //EJM: RC001 CodigoRUC
    private TUsuario usuario2;
    private TEmpresa empresa;
    private MenuModel model;

    @PostConstruct
    public void init() {
        setUsuario2((TUsuario) obtsesion("usuario"));
        setEmpresa((TEmpresa) obtsesion("empresa"));
        nomusuario = getUsuario2().getNomUsu();
        nomEmpresa = getEmpresa().getRsocial();
        rucEmp = getEmpresa().getCdRuc();
        setRuc(getEmpresa().getRucE());        
    }

    public UsuarioBean() {
    }

    public Object obtsesion(String k) {
        return FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get(k);
    }
    
    public String logout() {
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        return "index.xhtml?faces-redirect=true";
    }
    
    public void cargarMenu(){
//        //First submenu  
//        DefaultSubMenu firstSubmenu = new DefaultSubMenu("Dynamic Submenu");  
//          
//        DefaultMenuItem item = new DefaultMenuItem("External");  
//        item.setUrl("http://www.primefaces.org");  
//        item.setIcon("ui-icon-home");  
//        firstSubmenu.addElement(item);  
//          
//        getModel().addElement(firstSubmenu);  
    }
    

    public String getNomusuario() {
        return nomusuario;
    }

    public void setNomusuario(String nomusuario) {
        this.nomusuario = nomusuario;
    }

    public String getNomEmpresa() {
        return nomEmpresa;
    }

    public void setNomEmpresa(String nomEmpresa) {
        this.nomEmpresa = nomEmpresa;
    }

    public String getRucEmp() {
        return rucEmp;
    }

    public void setRucEmp(String rucEmp) {
        this.rucEmp = rucEmp;
    }

    public String getRuc() {
        return ruc;
    }

    public void setRuc(String ruc) {
        this.ruc = ruc;
    }

    public TUsuario getUsuario2() {
        return usuario2;
    }

    public void setUsuario2(TUsuario usuario2) {
        this.usuario2 = usuario2;
    }

    public TEmpresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(TEmpresa empresa) {
        this.empresa = empresa;
    }

    public MenuModel getModel() {
        return model;
    }

    public void setModel(MenuModel model) {
        this.model = model;
    }
}
