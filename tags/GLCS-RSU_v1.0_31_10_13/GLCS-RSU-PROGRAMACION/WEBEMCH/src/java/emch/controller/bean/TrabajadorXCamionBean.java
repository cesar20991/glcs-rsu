package emch.controller.bean;

//import emch.modelo.acceso.TrabajadorXCamionManaged;
import emch.modelo.entidades.TCamion;
import emch.modelo.entidades.TTipotrabajador;
import emch.modelo.entidades.TTrabajador;
import emch.modelo.entidades.TUbigeo;
import emch.modelo.entidades.TUsuario;
import java.io.IOException;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

/**
 *
 * @author rick
 */
@ManagedBean
@SessionScoped
public class TrabajadorXCamionBean {

    private List<TTrabajador> choferes;
    private TTrabajador selectChofer;
    private TCamion selectCamion;

    public TrabajadorXCamionBean() {
    }

    public List<TTrabajador> getChoferes() {
//        TrabajadorXCamionManaged obj = new TrabajadorXCamionManaged();
//        choferes = obj.buscarChoferes();
        return choferes;
    }

    public void administrar() {
        selectCamion = new TCamion();
        selectChofer = new TTrabajador();
        selectChofer.setTTipotrabajador(new TTipotrabajador());
        selectChofer.setTUbigeo(new TUbigeo());
        selectChofer.setTUsuario(new TUsuario());
        try {
            FacesContext.getCurrentInstance().getExternalContext().redirect("camion.xhtml");
        } catch (Exception e) {
            System.out.println("Error en cambio de página: " + e.getMessage());
        }

    }

    public TTrabajador getSelectChofer() {
        return selectChofer;
    }

    public void setSelectChofer(TTrabajador selectChofer) {
        this.selectChofer = selectChofer;
    }

    public TCamion getSelectCamion() {
        return selectCamion;
    }

    public void setSelectCamion(TCamion selectCamion) {
        this.selectCamion = selectCamion;
    }
}
