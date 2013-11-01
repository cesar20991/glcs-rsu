package emch.controller.bean;

import emch.modelo.acceso.LiquidacionesManaged;
import emch.modelo.entidades.TLiquidacion;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

/**
 *
 * @author rick
 */
@ManagedBean
@SessionScoped
public class LiquidacionesBean extends UsuarioBean {

    private List<TLiquidacion> listaLiquidaciones;

    public LiquidacionesBean() {
    }

    public List<TLiquidacion> getListaLiquidaciones() {
        LiquidacionesManaged obj = new LiquidacionesManaged();
        listaLiquidaciones = obj.buscarTodos(getEmpresa().getRucE());
        return listaLiquidaciones;
    }
}
