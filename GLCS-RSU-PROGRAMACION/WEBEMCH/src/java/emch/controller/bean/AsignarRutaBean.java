package emch.controller.bean;

import emch.modelo.acceso.MapsManaged;
import emch.modelo.entidades.TAsignarruta;
import emch.modelo.entidades.TDespachodet;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Administrador
 */
@ManagedBean
@RequestScoped
public class AsignarRutaBean {

    private TDespachodet selecteddespachodet;
    private TAsignarruta asignaruta;
    private List<TDespachodet> listaDespachoDet;

    public AsignarRutaBean() {
        asignaruta = new TAsignarruta();
        asignaruta.setTDespachodet(new TDespachodet());
        //selecteddespachodet.setId(new TDespachodetId());
    }

    public TDespachodet getSelecteddespachodet() {
        return selecteddespachodet;
    }

    public void setSelecteddespachodet(TDespachodet selecteddespachodet) {
        this.selecteddespachodet = selecteddespachodet;
    }

    public String irAsignarRuta() {
        return "asignarruta";
    }

    public String irInsertar() {
        
        return "";
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
    
}
