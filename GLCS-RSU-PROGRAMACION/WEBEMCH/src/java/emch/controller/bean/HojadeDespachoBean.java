package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.model.DataModel;
import javax.swing.JOptionPane;

@ManagedBean
@RequestScoped
public class HojadeDespachoBean {

    private TDespacho despacho;
    private List<TUbigeo> listarUbigeoSel;
    private List<TDespacho> listadespacho2;
    private DataModel listadespacho;
    private boolean esEdicion;
    private String accion;
    private String mensajeError;
    
    @PostConstruct
    public void init() {
        despacho = new TDespacho();
        despacho.setTUbigeo(new TUbigeo());
        despacho.setTEmpresa(new TEmpresa());
        getListadespacho2();
    }
    
    public String irAgregar() {
        setEsEdicion(false);
        setDespacho(new TDespacho());
        despacho.setTTurno(new TTurno());
        despacho.setTUbigeo(new TUbigeo());
        return "NuevaHojaDeDespacho";
    }
    
    public String irActualizar() {
        setEsEdicion(true);        
        return "NuevaHojaDeDespacho";
    }

    public TDespacho getDespacho() {
        return despacho;
    }

    public void setDespacho(TDespacho despacho) {
        this.despacho = despacho;
    }

    public List<TUbigeo> getListarUbigeoSel() {
        return listarUbigeoSel;
    }

    public void setListarUbigeoSel(List<TUbigeo> listarUbigeoSel) {
        this.listarUbigeoSel = listarUbigeoSel;
    }
    
    public String ingresar() {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        boolean resultado = isEsEdicion() ? obj.actualizar(despacho) 
                            : obj.insertar(despacho);
        if (resultado) {
            return "trabajador";
        } else {
            return ""; //futuros errores
        }
    }
    
    public List<TDespacho> getListadespacho2() {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listadespacho2 = obj.buscarTodos();
        return listadespacho2;
    }

    public void setListadespacho2(List<TDespacho> listadespacho2) {
        this.listadespacho2 = listadespacho2;
    }

    public DataModel getListadespacho() {
        return listadespacho;
    }

    public void setListadespacho(DataModel listadespacho) {
        this.listadespacho = listadespacho;
    }

    public boolean isEsEdicion() {
        return esEdicion;
    }

    public void setEsEdicion(boolean esEdicion) {
        this.esEdicion = esEdicion;
    }

    public String getAccion() {
        return accion;
    }

    public String getMensajeError() {
        return mensajeError;
    }

    public void setMensajeError(String mensajeError) {
        this.mensajeError = mensajeError;
    }
    
}