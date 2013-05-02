package emch.controller.bean;

import emch.modelo.acceso.TrabajadorXCamionManaged;
import emch.modelo.entidades.TTrabajador;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author rick
 */
@ManagedBean
@SessionScoped
public class TrabajadorXCamionBean {

    private List<TTrabajador> choferes;
    private TTrabajador selectChofer;

    public TrabajadorXCamionBean() {
    }

    public List<TTrabajador> getChoferes() {
        TrabajadorXCamionManaged obj = new TrabajadorXCamionManaged();
        choferes = obj.buscarChoferes();
        return choferes;
    }

    public TTrabajador getSelectChofer() {
        return selectChofer;
    }

    public void setSelectChofer(TTrabajador selectChofer) {
        this.selectChofer = selectChofer;
    }
}
