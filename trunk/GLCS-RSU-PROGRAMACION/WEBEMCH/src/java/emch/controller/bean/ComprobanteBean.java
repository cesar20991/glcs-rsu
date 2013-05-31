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
 * @author Administrador
 */
@ManagedBean
@RequestScoped
public class ComprobanteBean {

    //private TDespacho despacho;
    private TComprobante comprobante;
    //private List<TUbigeo> listarUbigeoSel;
    private List<TComprobante> listarComprobante2;
    private List<TComprobante> listarComprobante;
    private List<TComprobantedet> listarComprobanteDet;
    private List<TServicio> listarServicio;
    private List<TLiquidacion> listarLiquidacion;
    private boolean esEdicion;
    private String accion;
    
    public ComprobanteBean() {
        comprobante= new TComprobante();
        comprobante.setTComprobantedets((Set<TComprobantedet>) new TComprobantedet());
        comprobante.setTMoneda(new TMoneda());
        comprobante.setTLiquidacion(new TLiquidacion());
        comprobante.setTTipodoc(new TTipodoc());
        getListarComprobante2();
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
    }
   
       public String irAgregar() {
        setEsEdicion(false);
        setDespacho(new TDespacho());
        despacho.setTTurno(new TTurno());
        despacho.setTUbigeo(new TUbigeo());
        return "nuevahojadespacho";
    }
    
    public String irActualizar() {
        setEsEdicion(true);              
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listadotrabajadorXcamion = obj.buscaTrabxCamion(despacho.getId().getCdDespacho());
        String cdDes = despacho.getId().getCdDespacho();
        String RucE = despacho.getId().getCdRuc();
        String codigoUb = despacho.getTUbigeo().getCdUbig();
        String codigoTur = despacho.getTTurno().getCdTurno();        
        despacho.setId(new TDespachoId(cdDes,RucE));//(new TTipotrabajador
        despacho.setTUbigeo(new TUbigeo(codigoUb, "", false));
        despacho.setTTurno(new TTurno(codigoTur, ""));
        return "nuevahojadespacho";
    }
    
        public boolean isEsEdicion() {
        return esEdicion;
    }

    public void setEsEdicion(boolean esEdicion) {
        this.esEdicion = esEdicion;
    }

    public String getAccion() {
        return isEsEdicion() ? "Actualizar" : "Agregar";
    }
    public String irListoAgregar() {
        setListadotrabajadorXcamion(null);
        setListadotrabajadorXcamion(Arrays.asList(getSelectedTrabxCamion()));
        return "nuevahojadespacho";
    }

    public List<TComprobante> getListarComprobante() {
        return listarComprobante;
    }

    public void setListarComprobante(List<TComprobante> listarComprobante) {
        this.listarComprobante = listarComprobante;
    }

    public List<TComprobantedet> getListarComprobanteDet() {
        return listarComprobanteDet;
    }

    public void setListarComprobanteDet(List<TComprobantedet> listarComprobanteDet) {
        this.listarComprobanteDet = listarComprobanteDet;
    }

    public List<TServicio> getListarServicio() {
        return listarServicio;
    }

    public void setListarServicio(List<TServicio> listarServicio) {
        this.listarServicio = listarServicio;
    }

    public List<TLiquidacion> getListarLiquidacion() {
        return listarLiquidacion;
    }

    public void setListarLiquidacion(List<TLiquidacion> listarLiquidacion) {
        this.listarLiquidacion = listarLiquidacion;
    }

    public List<TComprobante> getListarComprobante2() {
        return listarComprobante2;
    }

    public void setListarComprobante2(List<TComprobante> listarComprobante2) {
        this.listarComprobante2 = listarComprobante2;
    }

    public TComprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(TComprobante comprobante) {
        this.comprobante = comprobante;
    }

    public void setAccion(String accion) {
        this.accion = accion;
    }
}
