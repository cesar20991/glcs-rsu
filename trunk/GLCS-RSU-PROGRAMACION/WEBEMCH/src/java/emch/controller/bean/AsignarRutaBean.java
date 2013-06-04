package emch.controller.bean;

import emch.modelo.entidades.TAsignarruta;
import emch.modelo.entidades.TDespachodet;
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
    private double demo;
    HttpServletRequest req;

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
        String a = req.getParameter("latN");
        System.out.print("name: " +  a);
        double ab = getDemo();
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
     * @return the demo
     */
    public double getDemo() {
        return demo;
    }

    /**
     * @param demo the demo to set
     */
    public void setDemo(double demo) {
        this.demo = demo;
    }
}
