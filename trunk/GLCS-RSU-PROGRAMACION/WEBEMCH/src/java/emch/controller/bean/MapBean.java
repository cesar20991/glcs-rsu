/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import emch.modelo.acceso.MapsManaged;
import emch.modelo.entidades.TAsignarruta;
import emch.modelo.entidades.TTipotrabajador;
import emch.modelo.entidades.TTrabajador;
import emch.modelo.entidades.TUbigeo;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;

import org.primefaces.event.map.OverlaySelectEvent;
import org.primefaces.model.map.DefaultMapModel;
import org.primefaces.model.map.LatLng;
import org.primefaces.model.map.LatLngBounds;
import org.primefaces.model.map.MapModel;
import org.primefaces.model.map.Rectangle;

@ManagedBean
@RequestScoped
public class MapBean implements Serializable {

    private MapModel rectangleModel;
    private List<TAsignarruta> listasignarruta;

    
    @PostConstruct
    public void init() {
        getListasignarruta();
    }
    
    public MapBean() {
        rectangleModel = new DefaultMapModel();

//        Shared coordinates  
//        LatLng coord1 = new LatLng(-12.074712, -77.013164);
//        LatLng coord4 = new LatLng(-12.088045, -77.023902);
//        Rectangle  
//        Rectangle rect = new Rectangle(new LatLngBounds(coord4, coord1));
//        rect.setStrokeColor("#d93c3c");
//        rect.setFillColor("#d93c3c");
//        rect.setFillOpacity(0.5);
//
//        Shared coordinates  
//        LatLng coord5 = new LatLng(-12.080281683116217, -77.01200568341051);
//        LatLng coord6 = new LatLng(-12.06871120314782, -77.00287373614492);
//
//        Rectangle  
//        Rectangle rect2 = new Rectangle(new LatLngBounds(coord5, coord6));
//        rect2.setStrokeColor("#d93c3c");
//        rect2.setFillColor("#d93c3c");
//        rect2.setFillOpacity(0.5);
//
//        rectangleModel.addOverlay(rect);
//        rectangleModel.addOverlay(rect2);

    }

    public MapModel getRectangleModel() {
        return rectangleModel;
    }

    public void onRectangleSelect(OverlaySelectEvent event) {
        addMessage(new FacesMessage(FacesMessage.SEVERITY_INFO, "Rectangle Selected", null));
    }

    public void addMessage(FacesMessage message) {
        FacesContext.getCurrentInstance().addMessage(null, message);
    }

    public List<TAsignarruta> getListasignarruta() {
        MapsManaged obj = new MapsManaged();
        listasignarruta = obj.listarRutaAsignadaTodos();
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
}
