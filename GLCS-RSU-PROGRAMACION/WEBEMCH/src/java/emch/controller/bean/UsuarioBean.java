/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.acceso.UsuarioManaged;
import emch.modelo.acceso.UsuarioManagedImpl;
import emch.modelo.entidades.TAccesom;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TPerfil;
import emch.modelo.entidades.TUsuario;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.model.menu.DefaultMenuItem;
import org.primefaces.model.menu.DefaultMenuModel;
import org.primefaces.model.menu.DefaultSubMenu;
import org.primefaces.model.menu.MenuModel;

/**
 * s
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
    private String nomPerfil="";
    private TUsuario usuario2;
    private TEmpresa empresa;
    private TPerfil perfil;
    //PARA EL MENU
//    private MenuModel model;
//    private List<TAccesom> listaAccesoM;

    @PostConstruct
    public void init() {
        setUsuario2((TUsuario) obtsesion("usuario"));
        setEmpresa((TEmpresa) obtsesion("empresa"));
        setPerfil((TPerfil)obtsesion("perfil"));
        nomusuario = getUsuario2().getNomUsu();
        nomEmpresa = getEmpresa().getRsocial();
        rucEmp = getEmpresa().getCdRuc();
        if(perfil !=null)
            nomPerfil = getPerfil().getNombrePrf();
        setRuc(getEmpresa().getRucE());
    }

    public UsuarioBean() {
    }

    public Object obtsesion(String k) {
        return FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get(k);
    }

    public void logout() throws IOException {
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        String s = FacesContext.getCurrentInstance().getExternalContext().getRequestPathInfo();
        System.out.print(s);
        if(s.contains("emch-seguridad") || s.contains("emch-administracion") || s.contains("emch-control") || s.contains("operaciones")){            
            FacesContext.getCurrentInstance().getExternalContext().redirect( "/WEBEMCH");
        }
        else if(s.contains("mobile")){
            FacesContext.getCurrentInstance().getExternalContext().redirect( "/WEBEMCH");
        }
        else{
            FacesContext.getCurrentInstance().getExternalContext().redirect( "index.xhtml");
        }
        
        //return "index.xhtml?faces-redirect=true";
    }
    public void logout2() throws IOException {
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        String s = FacesContext.getCurrentInstance().getExternalContext().getRequestPathInfo();
        System.out.print(s);
        if(s.contains("emch-seguridad") || s.contains("emch-administracion") || s.contains("emch-control") || s.contains("operaciones")){            
            FacesContext.getCurrentInstance().getExternalContext().redirect( "/WEBEMCH/faces/principalcliente.xhtml");
        }
        else if(s.contains("mobile")){
            FacesContext.getCurrentInstance().getExternalContext().redirect( "/WEBEMCH/faces/principalcliente.xhtml");
        }
        else{
            FacesContext.getCurrentInstance().getExternalContext().redirect( "principalcliente.xhtml");
        }
        
        //return "index.xhtml?faces-redirect=true";
    }

//    public void cargarMenu() {
//        //Valido Menus
//        if(nomusuario.equals("") && rucEmp.equals("")) return;
//        UsuarioManaged usu = new UsuarioManagedImpl();
//        listaAccesoM = usu.obtenerListadoMenu(nomusuario, rucEmp);
//        model = new DefaultMenuModel();
//        //
//        
//        for (int i = 0; i < listaAccesoM.size(); i++) {
//            if(listaAccesoM.get(i).getTMenu().getRuta().equals("")){
//                if(listaAccesoM.get(i).getTMenu().getNombre().equals("SEGURIDAD")){
//                    DefaultSubMenu firstSubmenu = new DefaultSubMenu(listaAccesoM.get(i).getTMenu().getNombre());
//                    
//                    DefaultMenuItem item = new DefaultMenuItem(listaAccesoM.get(i+1).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+1).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+2).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+2).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+3).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+3).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    i=0;
//                    model.addElement(firstSubmenu);
//                }
//                else if(listaAccesoM.get(i).getTMenu().getNombre().equals("ADMINISTRACION")){
//                     DefaultSubMenu firstSubmenu = new DefaultSubMenu(listaAccesoM.get(i).getTMenu().getNombre());
//                    
//                    DefaultMenuItem item = new DefaultMenuItem(listaAccesoM.get(i+1).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+1).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+2).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+2).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+3).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+3).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+4).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+4).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    listaAccesoM.remove(i);
//                    i=0;
//                    model.addElement(firstSubmenu);
//                 }
//                else if(listaAccesoM.get(i).getTMenu().getNombre().equals("CONTROL DE TRANSPORTE")){
//                     DefaultSubMenu firstSubmenu = new DefaultSubMenu(listaAccesoM.get(i).getTMenu().getNombre());
//                    
//                    DefaultMenuItem item = new DefaultMenuItem(listaAccesoM.get(i+1).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+1).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+2).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+2).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+3).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+3).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+4).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+4).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+5).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+5).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    listaAccesoM.remove(i);
//                    i=0;
//                    model.addElement(firstSubmenu);
//                 }
//                else if(listaAccesoM.get(i).getTMenu().getNombre().equals("OPERACIONES")){
//                     DefaultSubMenu firstSubmenu = new DefaultSubMenu(listaAccesoM.get(i).getTMenu().getNombre());
//                    
//                    DefaultMenuItem item = new DefaultMenuItem(listaAccesoM.get(i+1).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+1).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+2).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+2).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    
//                    item = new DefaultMenuItem(listaAccesoM.get(i+3).getTMenu().getNombre());
//                    item.setUrl(listaAccesoM.get(i+3).getTMenu().getRuta());
//                    item.setIcon("ui-icon-suitcase");
//                    firstSubmenu.addElement(item);
//                    listaAccesoM.remove(i);
//                    i=0;
//                    model.addElement(firstSubmenu);
//                 }
//            }         
//            
//        }
//    }

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

    public String getNomPerfil() {
        return nomPerfil;
    }

    public void setNomPerfil(String nomPerfil) {
        this.nomPerfil = nomPerfil;
    }

    public TPerfil getPerfil() {
        return perfil;
    }

    public void setPerfil(TPerfil perfil) {
        this.perfil = perfil;
    }
}
