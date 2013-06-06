/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.controller.bean;

import java.io.Serializable;

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

    public MapBean() {
        rectangleModel = new DefaultMapModel();

        //Shared coordinates  
        LatLng coord1 = new LatLng(-12.075215979813185, -76.98642813824449);
        LatLng coord4 = new LatLng(-12.088380805116724, -77.02398808551015);
        //Rectangle  
        Rectangle rect = new Rectangle(new LatLngBounds(coord1, coord4));
        rect.setStrokeColor("#d93c3c");
        rect.setFillColor("#d93c3c");
        rect.setFillOpacity(0.5);

        rectangleModel.addOverlay(rect);
        
        
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
}
