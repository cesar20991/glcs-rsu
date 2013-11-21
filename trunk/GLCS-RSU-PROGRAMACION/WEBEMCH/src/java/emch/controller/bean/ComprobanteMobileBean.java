package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.Date;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class ComprobanteMobileBean {

    private TComprobante comprobante;
    private List<TComprobante> listaComprobante;
    private Date fecDesde;
    private Date fecHasta;
    String rucempresa = "";

    @PostConstruct
    public void init() {
    }

    public TComprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(TComprobante comprobante) {
        this.comprobante = comprobante;
    }

    public Date getFecDesde() {
        return fecDesde;
    }

    public void setFecDesde(Date fecDesde) {
        this.fecDesde = fecDesde;
    }

    public Date getFecHasta() {
        return fecHasta;
    }

    public void setFecHasta(Date fecHasta) {
        this.fecHasta = fecHasta;
    }

    public void irClearDespacho() {
        listaComprobante = null;
    }

    public void irBuscarComprobante() {
        VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
         listaComprobante = obj.listarComprobante(fecDesde, fecHasta, rucempresa);
    }

    public List<TComprobante> getListaComprobante() {
        return listaComprobante;
    }

    public void setListaComprobante(List<TComprobante> listaComprobante) {
        this.listaComprobante = listaComprobante;
    }
}
