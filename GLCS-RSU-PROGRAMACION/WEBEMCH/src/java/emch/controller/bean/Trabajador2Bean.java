
package emch.controller.bean;

import emch.modelo.acceso.TrabajadorManaged;
import emch.modelo.entidades.*;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.model.DataModel;
import javax.faces.model.ListDataModel;

@ManagedBean
@RequestScoped
public class Trabajador2Bean {
    
    private TTrabajador trabajador;
    private List<TUbigeo> listarUbigeoSel;
    private List<TTipotrabajador> listarTipoTrabSel;
    private DataModel listatrabajador;
    private boolean esEdicion;
    private String accion;
    private String mensajeError;
    
    public Trabajador2Bean() {        
    }
    @PostConstruct
    public void init() {
        trabajador = new TTrabajador();
        trabajador.setTUbigeo(new TUbigeo());
        trabajador.setTTipotrabajador(new TTipotrabajador());
        getListatrabajador();
    }
    
    public String ingresar() {
        TrabajadorManaged cliMgd = new TrabajadorManaged();
        boolean resultado = isEsEdicion() ? cliMgd.actualizarTrabajador(trabajador) 
                            : cliMgd.ingresarTrabajador(trabajador);
        if (resultado) {
            return "trabajador2";
        } else {
            return ""; //futuros errores
        }
    }
    //----------------------- GET Y SET----------------------------------------
    public TTrabajador getTrabajador() {
        return trabajador;
    }

    public void setTrabajador(TTrabajador trabajador) {
        this.trabajador = trabajador;
    }
    
    public List<TUbigeo> getListarUbigeoSel() {
        TrabajadorManaged objTrb = new TrabajadorManaged();
        listarUbigeoSel = objTrb.listarUbigeo();
        return listarUbigeoSel;
    }

    public void setListarUbigeoSel(List<TUbigeo> listarUbigeoSel) {
        this.listarUbigeoSel = listarUbigeoSel;
    }
    
    public List<TTipotrabajador> getListarTipoTrabSel() {
        TrabajadorManaged objTrb = new TrabajadorManaged();
        listarTipoTrabSel = objTrb.listarTipoTrabajador();
        return listarTipoTrabSel;
    }

    public void setListarTipoTrabSel(List<TTipotrabajador> listarTipoTrabSel) {
        this.listarTipoTrabSel = listarTipoTrabSel;
    }
    public DataModel getListatrabajador() {
        TrabajadorManaged profMgd = new TrabajadorManaged();
        listatrabajador = new ListDataModel(profMgd.obtenerTrabajadorTodos());
        return listatrabajador;
    }

    public void setListatrabajador(DataModel listatrabajador) {
        this.listatrabajador = listatrabajador;
    }

    
    public String irAgregar() {
        setEsEdicion(false);
        setTrabajador(new TTrabajador());
        trabajador.setTTipotrabajador(new TTipotrabajador());
        trabajador.setTUbigeo(new TUbigeo());
        return "nuevotrabajador";
    }
    
    public String irActualizar() {
        setEsEdicion(true);
        setTrabajador((TTrabajador) listatrabajador.getRowData());
        String TipoTrabajador = trabajador.getTTipotrabajador().getCdTipoTrabajador();
        trabajador.setTTipotrabajador(new TTipotrabajador(TipoTrabajador, ""));
        String codigoUb = trabajador.getTUbigeo().getCdUbig();
        trabajador.setTUbigeo(new TUbigeo(codigoUb, "", false));
        return "nuevotrabajador";
    }

    public String getAccion() {
        return isEsEdicion() ? "Actualizar" : "Registrar";
    }
    
    public String getMensajeError() {
        return mensajeError;
    }

    public boolean isEsEdicion() {
        return esEdicion;
    }

    public void setEsEdicion(boolean esEdicion) {
        this.esEdicion = esEdicion;
    }
    
}
