package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.io.IOException;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.LatLngBounds;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Rectangle;

@ManagedBean
@SessionScoped
public class IncidenciaBean {

    private MapModel rectangleModel;
    private List<TAsignarruta> listasignarrutaXCamion;
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
    
    public String mostrarM(){
        GenerarMapsXCamion();
        return "";
    }

    private void GenerarMapsXCamion() {
        rectangleModel = new DefaultMapModel();
        LatLng coord1;
        LatLng coord2;
        Rectangle rect;
        //Shared coordinates  
        //for (int i = 0; i < getListasignarrutaXCamion().size(); i++) {
            coord1 = new LatLng(getListasignarrutaXCamion().get(0).getLatn(), getListasignarrutaXCamion().get(0).getLngn());
            coord2 = new LatLng(getListasignarrutaXCamion().get(0).getLats(), getListasignarrutaXCamion().get(0).getLngs());
            //Rectangle  
            rect = new Rectangle(new LatLngBounds(coord1, coord2));
            rect.setStrokeColor("#d93c3c");
            rect.setFillColor("#d93c3c");
            rect.setFillOpacity(0.5);
            rectangleModel.addOverlay(rect);
       // }
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

    public void irIncidencias() throws IOException {                
        FacesContext.getCurrentInstance().getExternalContext().redirect("incidenciaPorControl.xhtml");//return "incidenciaPorControl";
    }

    public List<TIncidencia> getListarControlPorIncidencia() {
        IncidenciaManaged obj = new IncidenciaManaged();
        listarControlPorIncidencia = obj.listarControlPorIncidencia(selectedControl);  
        getListasignarrutaXCamion();
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
        IncidenciaManaged obj = new IncidenciaManaged();
        boolean resultado = obj.ingresarIncidencia(incidencias);
        //: cliMgd.ingresarTrabajador(trabajador); - no habra actualizar por el momento ahi queda

        if (resultado) {
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

    public MapModel getRectangleModel() {
        return rectangleModel;
    }

    public List<TAsignarruta> getListasignarrutaXCamion() {
        MapsManaged obj = new MapsManaged();        
        listasignarrutaXCamion = obj.listarRutaAsignadaxCamion(selectedControl.getTDespachodet());
        return listasignarrutaXCamion;
    }

    public void setListasignarrutaXCamion(List<TAsignarruta> listasignarrutaXCamion) {
        this.listasignarrutaXCamion = listasignarrutaXCamion;
    }
}
