package emch.controller.bean;

import emch.modelo.acceso.EmpresaManaged;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TUbigeo;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

@ManagedBean
@SessionScoped
public class EmpresaBean {

    private TEmpresa empresa;
    private List<TUbigeo> listarUbigeo;
    private DataModel listaempresa;
    private boolean esEdicion;
    private String accion;
    private String mensajeError;

    @PostConstruct
    public void init() {
        empresa = new TEmpresa();
        empresa.setTUbigeo(new TUbigeo());
        getListaempresa();
    }

    public String irAgregar() {
        setEsEdicion(false);
        setEmpresa(new TEmpresa());
        empresa.setTUbigeo(new TUbigeo());
        return "nuevaempresa";
    }

    public String irActualizar() {
        setEsEdicion(true);
        setEmpresa((TEmpresa) listaempresa.getRowData());
        String codigoUb = empresa.getTUbigeo().getCdUbig();
        empresa.setTUbigeo(new TUbigeo(codigoUb, "", false));
        String cod = empresa.getCdRuc();
        empresa.setCdRuc(cod);
        return "nuevaempresa";
    }

    public DataModel getListaempresa() {
        EmpresaManaged profMgd = new EmpresaManaged();
        listaempresa = new ListDataModel(profMgd.obtenerEmpresaTodos());
        return listaempresa;
    }

    public void setListaempresa(DataModel listaempresa) {
        this.listaempresa = listaempresa;
    }

    public void prepararEmpresa(String id) {
        EmpresaManaged obj = new EmpresaManaged();
        empresa = obj.buscarPorId(id);
    }

    public TEmpresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(TEmpresa empresa) {
        this.empresa = empresa;
    }

    public List<TUbigeo> getListarUbigeo() {
        EmpresaManaged objTrb = new EmpresaManaged();
        listarUbigeo = objTrb.listarUbigeo();
        return listarUbigeo;
    }

    public void setListarUbigeo(List<TUbigeo> listarUbigeo) {
        this.listarUbigeo = listarUbigeo;
    }

    public String ingresar() {
        EmpresaManaged cliMgd = new EmpresaManaged();
        boolean resultado = isEsEdicion() ? cliMgd.actualizarEmpresa(empresa)
                : cliMgd.ingresarEmpresa(empresa);
        if (resultado) {
            
            return "empresa";
        } else {
             
            return ""; //futuros errores
        }
    }

    public String getAccion() {
        return isEsEdicion() ? "Actualizar" : "Registrar";
    }

    public boolean isEsEdicion() {
        return esEdicion;
    }

    public void setEsEdicion(boolean esEdicion) {
        this.esEdicion = esEdicion;
    }
    /*  
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
     FacesContext.getCurrentInstance().getExternalContext().redirect("empresaxempresa.xhtml");
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
     public String getAccion() {
     return isEsEdicion() ? "Actualizar" : "Registrar";
     }
     public boolean isEsEdicion() {
     return esEdicion;
     }
     public void setEsEdicion(boolean esEdicion) {
     this.esEdicion = esEdicion;
     }
     */
}
