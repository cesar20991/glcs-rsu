package emch.controller.bean;

import emch.modelo.acceso.TrabajadorManaged;
import emch.modelo.entidades.TTrabajador;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

@ManagedBean
@RequestScoped
public class TrabajadorBean {

    private TTrabajador trabajador;
    private boolean esEdicion;
    private List<TTrabajador> listaTrabajador;
    //private TrabajadorManejador trb = new TrabajadorManejador();

    @PostConstruct
    public void init() {
        setTrabajador(new TTrabajador());
        getListaTrabajador();
    }

    public TrabajadorBean() {
    }

    public String irAgregar() {
        esEdicion = false;
        setTrabajador(new TTrabajador());
        return "nuevotrabajador";
    }

    public TTrabajador getTrabajador() {
        return trabajador;
    }

    public void setTrabajador(TTrabajador trabajador) {
        this.trabajador = trabajador;
    }

    public List<TTrabajador> getListaTrabajador() {
        TrabajadorManaged profMgd = new TrabajadorManaged();
        listaTrabajador = profMgd.obtenerTrabajadorTodos();
        return listaTrabajador;
    }

    public void setListaTrabajador(List<TTrabajador> listaTrabajador) {
        this.listaTrabajador = listaTrabajador;
    }

    public void prepararTrabajador(String id) {
        TrabajadorManaged obj = new TrabajadorManaged();
        trabajador = obj.buscarPorId(id);
    }

    public void actualizarTrabajador() {
        TrabajadorManaged obj = new TrabajadorManaged();
        obj.actualizar(trabajador);
    }
}
