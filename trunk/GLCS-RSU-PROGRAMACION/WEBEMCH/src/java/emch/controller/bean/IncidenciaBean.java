package emch.controller.bean;


import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.io.IOException;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;


@ManagedBean
@SessionScoped
public class IncidenciaBean {
    private TControlviaje control;
    private TControlviaje selectedControl;
    private List<TControlviaje> listarControl;
    private List<TIncidencia> listarControlPorIncidencia;
    private TIncidencia incidencias;
    private boolean esEdicion;
    
    @PostConstruct
    public void init() {
        //Primero inicializamos 
        incidencias = new TIncidencia();
        incidencias.setTControlviaje(new TControlviaje());
    }


    public TControlviaje getSelectedControl() {
        return selectedControl;
    }

    public void setSelectedControl(TControlviaje selectedControl) {
        this.selectedControl = selectedControl;
    }

    public List<TControlviaje> getListarControl() {
        IncidenciaManaged obj = new IncidenciaManaged();
        listarControl = obj.listarControl();
        return listarControl;
    }

    public void setListarControl(List<TControlviaje> listarControl) {
        this.listarControl = listarControl;
    }
       
    public String irIncidencias(){
        return "incidenciaPorControl";
    }

    public List<TIncidencia> getListarControlPorIncidencia() {
        IncidenciaManaged obj = new IncidenciaManaged();
        listarControlPorIncidencia = obj.listarControlPorIncidencia(selectedControl);
        return listarControlPorIncidencia;
    }

    public void setListarControlPorIncidencia(List<TIncidencia> listarControlPorIncidencia) {
        this.listarControlPorIncidencia = listarControlPorIncidencia;
    }
    
    public TControlviaje getControl() {
        return control;
    }

    public void setControl(TControlviaje control) {
        this.control = control;
    }
    
    //AGREGANDO INCIDENCIAS
    public String irAgregar() {
        incidencias.setTControlviaje(selectedControl); // seteo en la entidad el control de viaje seleccionado
        IncidenciaManaged  obj = new IncidenciaManaged();        
        boolean resultado = obj.ingresarIncidencia(incidencias) ;
                            //: cliMgd.ingresarTrabajador(trabajador); - no habra actualizar por el momento ahi queda
        
        if(resultado){
            incidencias = new TIncidencia();
            incidencias.setTControlviaje(new TControlviaje());
            
            //aca ira mensaje
        }
        return "";
    }

    private void setEsEdicion(boolean b) {
        this.esEdicion = esEdicion;
    }

    public TIncidencia getIncidencias() {
        return incidencias;
    }

    public void setIncidencias(TIncidencia incidencias) {
        this.incidencias = incidencias;
    }




}
