package emch.controller.bean;

import emch.modelo.acceso.TrabajadorManaged;
import emch.modelo.acceso.UsuarioManaged;
import emch.modelo.acceso.UsuarioManagedImpl;
import emch.modelo.entidades.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;


@ManagedBean
@SessionScoped
public class AdmUsuarioBean {

    private TUsuario usuario;
    private DataModel listausuario;
    private boolean esEdicion;
    private String accion;
    private String mensajeError;
    private List<TPerfil> listarPerfil;

    @PostConstruct
    public void init() {
        setUsuario(new TUsuario());
        getUsuario().setTPerfil(new TPerfil());
        getListausuario();
    }
    
    public String irAgregar() {
        setEsEdicion(false);
        setUsuario(new TUsuario());
        usuario.setTPerfil(new TPerfil());
        return "nuevousuario";
    }
    
    public String irActualizar() {
        setEsEdicion(true);
        setUsuario((TUsuario) listausuario.getRowData());
        String codigoPerfil = usuario.getTPerfil().getCdPerfil();
        usuario.setTPerfil(new TPerfil(codigoPerfil, "", false));
        String cod = usuario.getNomUsu();
        usuario.setNomUsu(cod);
        return "nuevousuario";
    }
    
    public void prepararUsuario(String id) {
        UsuarioManaged obj = new UsuarioManagedImpl();
        usuario = obj.buscarPorId(id);
    }
 
    public String ingresar() {
        UsuarioManaged cliMgd = new UsuarioManagedImpl();
        boolean resultado = isEsEdicion() ? cliMgd.actualizarUsuario(usuario) 
                            : cliMgd.ingresarUsuario(usuario);
        if (resultado) {
            return "usuario";
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

    public DataModel getListausuario() {
        UsuarioManaged objusuario = new UsuarioManagedImpl();
        listausuario = new ListDataModel(objusuario.ListarUsuarioTodos());
        return listausuario;
    }

    public void setListausuario(DataModel listausuario) {
        this.listausuario = listausuario;
    }

    public TUsuario getUsuario() {
        return usuario;
    }

    public void setUsuario(TUsuario usuario) {
        this.usuario = usuario;
    }

    /**
     * @return the listarPerfil
     */
    public List<TPerfil> getListarPerfil() {
        UsuarioManaged objusuario = new UsuarioManagedImpl();
        listarPerfil = objusuario.ListarPerfilTodos();
        return listarPerfil;
    }

    /**
     * @param listarPerfil the listarPerfil to set
     */
    public void setListarPerfil(List<TPerfil> listarPerfil) {
        this.listarPerfil = listarPerfil;
    }

    
}
