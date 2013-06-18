package emch.controller.bean;

import emch.modelo.acceso.ComprobantesManaged;
import emch.modelo.entidades.TComprobante;
import emch.modelo.entidades.TComprobantedet;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TMoneda;
import emch.modelo.entidades.TServicio;
import emch.modelo.entidades.TTipodoc;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Calendar;
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
public class ComprobantesBean extends UsuarioBean {

    private TLiquidacion liquidacion;
    private TServicio servicio;
    private List<TServicio> listaServicios;
    private TComprobante comprobante;
    private TComprobantedet comprobanteDet;
    private List<TComprobantedet> listaComprobanteDet;
    private List<TMoneda> listaMonedas;
    private List<TTipodoc> listaTipoDocs;
    public int cont;
    public String idC;
    public Calendar cal;

    public ComprobantesBean() {
        comprobante = new TComprobante();
        comprobante.setTLiquidacion(new TLiquidacion());
        comprobante.setTMoneda(new TMoneda());
        comprobante.setTTipodoc(new TTipodoc());
        cont = 0;
        comprobanteDet=new TComprobantedet();
        comprobanteDet.setTServicio(new TServicio());
        comprobanteDet.setTComprobante(new TComprobante());
    }

    public void prepararComprobante(String id) {
        try {
            ComprobantesManaged obj = new ComprobantesManaged();
            liquidacion = obj.buscarPorId(id);
            comprobante.setTLiquidacion(liquidacion);
            idC = obj.getIDComprobante();
            comprobante.setIdComprobante(idC);
            cal = Calendar.getInstance();
            comprobante.setFecMov(cal.getTime());
            comprobante.setFechaReg(cal.getTime());
            comprobante.setUsuCrea(liquidacion.getUsuCrea());
            comprobante.setEstado("PC");
            comprobante.setSubTotal(BigDecimal.ZERO);
            comprobante.setIgv(BigDecimal.ZERO);
            comprobante.setTotal(BigDecimal.ZERO);
            comprobante.setNroDoc("");
            comprobante.setSerie("");
            comprobante.setTMoneda(obj.buscarMonedasTodas().get(0));
            comprobante.setTTipodoc(obj.buscarTiposDocTodos().get(0));
            obj.insertarComprobante(comprobante);
            FacesContext.getCurrentInstance().getExternalContext().redirect("generarcomprobante.xhtml");
        } catch (IOException e) {
            System.out.println("" + e.getMessage());
        }
    }

    public void cancelar() {
        try {
            ComprobantesManaged obj = new ComprobantesManaged();
            comprobante=obj.buscarComprobantePorId(idC);
            obj.eliminar(comprobante);
            FacesContext.getCurrentInstance().getExternalContext().redirect("vistaliquidaciones.xhtml");
        } catch (IOException e) {
            System.out.println("" + e.getMessage());
        }
    }

    public TLiquidacion getLiquidacion() {
        return liquidacion;
    }

    public void setLiquidacion(TLiquidacion liquidacion) {
        this.liquidacion = liquidacion;
    }

    public TServicio getServicio() {
        return servicio;
    }

    public void setServicio(TServicio servicio) {
        this.servicio = servicio;
    }

    public List<TServicio> getListaServicios() {
        ComprobantesManaged obj = new ComprobantesManaged();
        listaServicios = obj.buscarServiciosTodos();
        return listaServicios;
    }

    public void setListaServicios(List<TServicio> listaServicios) {
        this.listaServicios = listaServicios;
    }

    public TComprobantedet getComprobanteDet() {
        return comprobanteDet;
    }

    public void setComprobanteDet(TComprobantedet comprobanteDet) {
        this.comprobanteDet = comprobanteDet;
    }

    public List<TComprobantedet> getListaComprobanteDet() {
        return listaComprobanteDet;
    }

    public void setListaComprobanteDet(List<TComprobantedet> listaComprobanteDet) {
        this.listaComprobanteDet = listaComprobanteDet;
    }

    public TComprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(TComprobante comprobante) {
        this.comprobante = comprobante;
    }

    public List<TMoneda> getListaMonedas() {
        ComprobantesManaged obj = new ComprobantesManaged();
        listaMonedas = obj.buscarMonedasTodas();
        return listaMonedas;
    }

    public void setListaMonedas(List<TMoneda> listaMonedas) {
        this.listaMonedas = listaMonedas;
    }

    public List<TTipodoc> getListaTipoDocs() {
        ComprobantesManaged obj = new ComprobantesManaged();
        listaTipoDocs = obj.buscarTiposDocTodos();
        return listaTipoDocs;
    }

    public void setListaTipoDocs(List<TTipodoc> listaTipoDocs) {
        this.listaTipoDocs = listaTipoDocs;
    }
}
