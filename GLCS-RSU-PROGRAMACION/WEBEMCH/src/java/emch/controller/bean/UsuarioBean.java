/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TUsuario;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author Cesar
 */
@ManagedBean
@RequestScoped
public class UsuarioBean {

    
     private String nomusuario="";
     private String nomEmpresa="";
     private String ruc="";
     private String rucEmp="";
    
    @PostConstruct
    public void init() {
        TUsuario usuario2 = (TUsuario) obtsesion("usuario");
        TEmpresa empresa = (TEmpresa) obtsesion("empresa");
         nomusuario = usuario2.getNomUsu();
         nomEmpresa = empresa.getRsocial();
         rucEmp = empresa.getCdRuc();
         setRuc(empresa.getRucE());
    }
    
    public UsuarioBean() {
    }
    
    public Object obtsesion(String k) {
        return FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get(k);
    }

    /**
     * @return the nomusuario
     */
    public String getNomusuario() {
        return nomusuario;
    }

    /**
     * @param nomusuario the nomusuario to set
     */
    public void setNomusuario(String nomusuario) {
        this.nomusuario = nomusuario;
    }

    /**
     * @return the nomEmpresa
     */
    public String getNomEmpresa() {
        return nomEmpresa;
    }

    /**
     * @param nomEmpresa the nomEmpresa to set
     */
    public void setNomEmpresa(String nomEmpresa) {
        this.nomEmpresa = nomEmpresa;
    }

    /**
     * @return the rucEmp
     */
    public String getRucEmp() {
        return rucEmp;
    }

    /**
     * @param rucEmp the rucEmp to set
     */
    public void setRucEmp(String rucEmp) {
        this.rucEmp = rucEmp;
    }

    /**
     * @return the ruc
     */
    public String getRuc() {
        return ruc;
    }

    /**
     * @param ruc the ruc to set
     */
    public void setRuc(String ruc) {
        this.ruc = ruc;
    }
    
}
