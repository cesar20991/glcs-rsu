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
public class DespachoMobileBean {

    private TDespacho despacho;
    private List<TDespacho> listaDespacho;
    private Date fecDesde;
    private Date fecHasta;
    private TDespacho selectedDespacho;
    private List<TDespachodet> listaDespachoDet;
    String rucempresa = "";

    public void DespachoMobileBean() {
    }

    public void irBuscarDespacho() {
        // NO PUEDO TRAER CALENDAR SALE NULL
        //VerificarComprobanteManaged obj = new VerificarComprobanteManaged();
        //listaDespacho = obj.listarDespacho(fecDesde, fecHasta, rucempresa);
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listaDespacho = obj.buscarTodos();
    }

    public void irClearDespacho() {
        listaDespacho = null;
    }

    public void buscarDespachoDet() {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        if (selectedDespacho != null) {
            listaDespachoDet = obj.ListarDespachoxDespachoDet(selectedDespacho);
        }
    }

    public List<TDespacho> getListaDespacho() {
        //HojadeDespachoManaged obj = new HojadeDespachoManaged();
        //listaDespacho = obj.buscarTodos();
        return listaDespacho;
    }

    public void setListaDespacho(List<TDespacho> listaDespacho) {
        this.listaDespacho = listaDespacho;
    }

    public TDespacho getDespacho() {
        return despacho;
    }

    public void setDespacho(TDespacho despacho) {
        this.despacho = despacho;
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

    public TDespacho getSelectedDespacho() {
        return selectedDespacho;
    }

    public void setSelectedDespacho(TDespacho selectedDespacho) {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listaDespachoDet = obj.ListarDespachoxDespachoDet(selectedDespacho);
        this.selectedDespacho = selectedDespacho;
    }

    public List<TDespachodet> getListaDespachoDet() {
        return listaDespachoDet;
    }

    public void setListaDespachoDet(List<TDespachodet> listaDespachoDet) {
        this.listaDespachoDet = listaDespachoDet;
    }
}
