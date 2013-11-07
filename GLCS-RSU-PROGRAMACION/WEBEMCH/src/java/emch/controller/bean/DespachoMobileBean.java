package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.Date;
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
public class DespachoMobileBean {

    private TDespacho despacho;
    private List<TDespacho> listaDespacho;
    private Date fecDesde;
    private Date fecHasta;
    private TDespacho selectedDespacho;
    private List<TDespachodet> listaDespachoDet;
    private MapModel rectangleModel;
    private TDespachodet selectedDespachoDet;
    private List<TAsignarruta> listasignarrutaXCamion;
    String rucempresa = "";

    public void DespachoMobileBean() {
    }

    public void irBuscarDespacho() {
        // NO PUEDO TRAER CALENDAR SALE NULL
        //VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
        //listaDespacho = obj.listarDespacho(fecDesde, fecHasta, rucempresa);
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listaDespacho = obj.buscarTodos();
    }

    public void irClearDespacho() {
        listaDespacho = null;
    }

    public void buscarDespachoDet() {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        if (selectedDespacho != null) {
            listaDespachoDet = obj.ListarDespachoxDespachoDet(selectedDespacho);
        }
    }

    private void GenerarMapsXCamion() {
        setRectangleModel(new DefaultMapModel());
        LatLng coord1;
        LatLng coord2;
        Rectangle rect;
        //Shared coordinates  
        for (int i = 0; i < listasignarrutaXCamion.size(); i++) {
            coord1 = new LatLng(listasignarrutaXCamion.get(i).getLatn(), listasignarrutaXCamion.get(i).getLngn());
            coord2 = new LatLng(listasignarrutaXCamion.get(i).getLats(), listasignarrutaXCamion.get(i).getLngs());
            //Rectangle  
            rect = new Rectangle(new LatLngBounds(coord1, coord2));
            rect.setStrokeColor("#d93c3c");
            rect.setFillColor("#d93c3c");
            rect.setFillOpacity(0.5);

            getRectangleModel().addOverlay(rect);
        }
    }

    public void verRutaXCamion() {
        getListasignarrutaXCamion();
    }

    public List<TDespacho> getListaDespacho() {
        //HojadeDespachoManaged obj = new HojadeDespachoManaged();
        //listaDespacho = obj.buscarTodos();
        return listaDespacho;
    }

    public void setListaDespacho(List<TDespacho> listaDespacho) {
        this.listaDespacho = listaDespacho;
    }

    public TDespacho getDespacho() {
        return despacho;
    }

    public void setDespacho(TDespacho despacho) {
        this.despacho = despacho;
    }

    public Date getFecDesde() {
        return fecDesde;
    }

    public void setFecDesde(Date fecDesde) {
        this.fecDesde = fecDesde;
    }

    public Date getFecHasta() {
        return fecHasta;
    }

    public void setFecHasta(Date fecHasta) {
        this.fecHasta = fecHasta;
    }

    public TDespacho getSelectedDespacho() {
        return selectedDespacho;
    }

    public void setSelectedDespacho(TDespacho selectedDespacho) {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listaDespachoDet = obj.ListarDespachoxDespachoDet(selectedDespacho);
        this.selectedDespacho = selectedDespacho;
    }

    public List<TDespachodet> getListaDespachoDet() {
        return listaDespachoDet;
    }

    public void setListaDespachoDet(List<TDespachodet> listaDespachoDet) {
        this.listaDespachoDet = listaDespachoDet;
    }

    public TDespachodet getSelectedDespachoDet() {
        return selectedDespachoDet;
    }

    public void setSelectedDespachoDet(TDespachodet selectedDespachoDet) {
        MapsManaged obj = new MapsManaged();
        listasignarrutaXCamion = obj.listarRutaAsignadaxCamion(selectedDespachoDet);
        GenerarMapsXCamion();
        this.selectedDespachoDet = selectedDespachoDet;
    }

    public List<TAsignarruta> getListasignarrutaXCamion() {
        //MapsManaged obj = new MapsManaged();
        //listasignarrutaXCamion = obj.listarRutaAsignadaxCamion(selectedDespachoDet);
        //GenerarMapsXCamion();
        return listasignarrutaXCamion;
    }

    public void setListasignarrutaXCamion(List<TAsignarruta> listasignarrutaXCamion) {
        this.listasignarrutaXCamion = listasignarrutaXCamion;
    }

    public MapModel getRectangleModel() {
        return rectangleModel;
    }

    public void setRectangleModel(MapModel rectangleModel) {
        this.rectangleModel = rectangleModel;
    }
}
