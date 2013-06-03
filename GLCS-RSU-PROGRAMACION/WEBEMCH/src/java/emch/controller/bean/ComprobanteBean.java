package emch.controller.bean;

import emch.modelo.entidades.TComprobante;
import emch.modelo.entidades.TComprobantedet;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TMoneda;
import emch.modelo.entidades.TServicio;
import emch.modelo.entidades.TTipodoc;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;

/**
 *
 * @author Cesar
 */
@ManagedBean
@RequestScoped
public class ComprobanteBean {

    private TComprobante comprobante;
    private List<TComprobante> listarComprobante;

    public ComprobanteBean() {
    }

    public String ingresar() {
        /* HojadeDespachoManaged obj = new HojadeDespachoManaged();
         listadotrabajadorXcamion = Arrays.asList(getSelectedTrabxCamion());
         boolean resultado = isEsEdicion() ? obj.actualizar(despacho) 
         : obj.insertar(despacho,listadotrabajadorXcamion);
         if (resultado) {
         return "nuevahojadespacho";
         } else {
         return ""; //futuros errores
         }*/
        return "";
    }

    public String irAgregar() {
        return "nuevahojadespacho";
    }

    public String irPesaje() {
        return "pesajes";
    }

    public String irComprobante() {
        return "comprobantes";
    }

    public List<TComprobante> getListarComprobante() {
        return listarComprobante;
    }

    public void setListarComprobante(List<TComprobante> listarComprobante) {
        this.listarComprobante = listarComprobante;
    }

    public TComprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(TComprobante comprobante) {
        this.comprobante = comprobante;
    }
    
}
