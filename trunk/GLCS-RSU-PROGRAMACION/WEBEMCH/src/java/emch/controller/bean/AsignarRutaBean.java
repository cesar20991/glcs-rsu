package emch.controller.bean;

import emch.modelo.acceso.MapsManaged;
import emch.modelo.entidades.TAsignarruta;
import emch.modelo.entidades.TDespacho;
import emch.modelo.entidades.TDespachodet;
import emch.modelo.entidades.TDespachodetId;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TTrabajadorxcamion;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.LatLngBounds;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Rectangle;

/**
 *
 * @author Administrador
 */
@ManagedBean
@SessionScoped
public class AsignarRutaBean {
    
    private MapModel rectangleModel;
    public TDespachodet selecteddespachodet;
    private TAsignarruta asignaruta;
    private List<TDespachodet> listaDespachoDet;
    private List<TEmpresa> listarempresa;
    private List<TAsignarruta> listasignarruta;

    public AsignarRutaBean() {
        rectangleModel = new DefaultMapModel();
        asignaruta = new TAsignarruta();
        asignaruta.setTDespachodet(new TDespachodet());
        asignaruta.setTDespachodet(new TDespachodet(new TDespachodetId(1, null, null), null, null, 1));
    }

    public TDespachodet getSelecteddespachodet() {
        return selecteddespachodet;
    }

    public void setSelecteddespachodet(TDespachodet selecteddespachodet) {
        this.selecteddespachodet = selecteddespachodet;
    }

    public String irAsignarRuta() {
        getListasignarruta();
        return "asignarruta";
    }

    public String irInsertar() {
        FacesContext context = FacesContext.getCurrentInstance();
        //asignaruta.setTDespachodet(selecteddespachodet);
        MapsManaged mgd = new MapsManaged();
        boolean resultado = mgd.ingresarRuta(asignaruta,selecteddespachodet);
         if (resultado) {
            setAsignaruta(null);
            context.addMessage(null, new FacesMessage("Ase asigno ruta correctamente", "Verificar"));
            return "listardespacho";
        } else {
            //setEsEdicion(false);
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Error al Asignar ruta", "Verificar"));
            return "asignarruta"; //futuros errores
        }
    }

    /**
     * @return the asignaruta
     */
    public TAsignarruta getAsignaruta() {
        return asignaruta;
    }

    /**
     * @param asignaruta the asignaruta to set
     */
    public void setAsignaruta(TAsignarruta asignaruta) {
        this.asignaruta = asignaruta;
    }

    /**
     * @return the listaDespachoDet
     */
    public List<TDespachodet> getListaDespachoDet() {
        MapsManaged obj = new MapsManaged();
        listaDespachoDet = obj.ListarDespachoxDespachoDet();     
        return listaDespachoDet;
    }

    /**
     * @param listaDespachoDet the listaDespachoDet to set
     */
    public void setListaDespachoDet(List<TDespachodet> listaDespachoDet) {
        this.listaDespachoDet = listaDespachoDet;
    }

    /**
     * @return the listarempresa
     */
    public List<TEmpresa> getListarempresa() {
        MapsManaged obj = new MapsManaged();
        listarempresa = obj.listarEmpresa();
        return listarempresa;
    }

    /**
     * @param listarempresa the listarempresa to set
     */
    public void setListarempresa(List<TEmpresa> listarempresa) {
        this.listarempresa = listarempresa;
    }
    
    
    public List<TAsignarruta> getListasignarruta() {
        MapsManaged obj = new MapsManaged();
        listasignarruta = obj.listarRutaAsignadaTodos(selecteddespachodet);
        GenerarMapsTodos();
        return listasignarruta;
    }

    public void setListasignarruta(List<TAsignarruta> listasignarruta) {
        this.listasignarruta = listasignarruta;
    }

    private void GenerarMapsTodos() {
        rectangleModel = new DefaultMapModel();
        LatLng coord1;
        LatLng coord2;
        Rectangle rect;
        //Shared coordinates  
        for (int i = 0; i < listasignarruta.size(); i++) {
            coord1 = new LatLng(listasignarruta.get(i).getLatn(), listasignarruta.get(i).getLngn());
            coord2 = new LatLng(listasignarruta.get(i).getLats(), listasignarruta.get(i).getLngs());
            //Rectangle  
            rect = new Rectangle(new LatLngBounds(coord1, coord2));
            rect.setStrokeColor("#d93c3c");
            rect.setFillColor("#d93c3c");
            rect.setFillOpacity(0.5);

            rectangleModel.addOverlay(rect);
        }
    }
    
    public MapModel getRectangleModel() {
        return rectangleModel;
    }
    
    
}
