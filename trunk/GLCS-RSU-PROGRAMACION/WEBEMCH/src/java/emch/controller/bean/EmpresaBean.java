
package emch.controller.bean;

import emch.modelo.acceso.EmpresaManaged;
import emch.modelo.entidades.TEmpresa;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class EmpresaBean {

    private List<TEmpresa> listaEmpresa;
    private TEmpresa empresa;

    public EmpresaBean() {
        empresa = new TEmpresa();
    }

    public void prepararInsertar() {
        empresa = new TEmpresa();
    }
    
    public String irAgregar(){
        return "nuevaempresa";
    }

    public void insertar() {
        FacesContext context = FacesContext.getCurrentInstance();
        String text = "";
        if (empresa.getCdRuc().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Codigo: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (empresa.getRucE().trim().equals("")) {
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Tipo de combustible: ", "campo vacio."));
            text = "error";
        } else {
        }
        if (text.equals("")) {
            EmpresaManaged obj = new EmpresaManaged();
            obj.insertar(empresa);
            empresa = new TEmpresa();
        }
    }

    public void prepararEmpresa(String id) {
        EmpresaManaged obj = new EmpresaManaged();
        empresa = obj.buscarPorId(id);
    }

    public void actualizarEmpresa() {
        EmpresaManaged obj = new EmpresaManaged();
        obj.actualizar(empresa);
        empresa = new TEmpresa();
    }

    public void asignar() {
        try {
            FacesContext.getCurrentInstance().getExternalContext().redirect("trabajadorxempresa.xhtml");
        } catch (Exception e) {
            System.out.println("Error en cambio de página: " + e.getMessage());
        }
    }

    public List<TEmpresa> getListaEmpresa() {
        EmpresaManaged obj = new EmpresaManaged();
        listaEmpresa = obj.ListarEmpresa();
        return listaEmpresa;
    }

    public void setListaEmpresa(List<TEmpresa> listaEmpresa) {
        this.listaEmpresa = listaEmpresa;
    }

    public TEmpresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(TEmpresa empresa) {
        this.empresa = empresa;
    }
}
