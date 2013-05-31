package emch.controller.bean;


import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;


@ManagedBean
@SessionScoped
public class PesajeBean {
    private TLiquidacion selectedLiquidacion;
    private List<TPesaje> listarPesaje;
    private List<TComprobante> listarComprobante;
    
    //-----------GenerarPesaje---------------------------
    private TPesaje pesaje;
    private List<TPesaje> generapesaje;
    //---------------------------------------------------
    
    @PostConstruct
    public void init() {
        
    }

    public TLiquidacion getSelectedLiquidacion() {
        return selectedLiquidacion;
    }

    public void setSelectedLiquidacion(TLiquidacion selectedLiquidacion) {
        this.selectedLiquidacion = selectedLiquidacion;
    }

    public List<TPesaje> getListarPesaje() {
        PesajeManaged objPes = new PesajeManaged();
        listarPesaje = objPes.listarPesaje(selectedLiquidacion);
        return listarPesaje;
    }

    public void setListarPesaje(List<TPesaje> listarPesaje) {
        this.listarPesaje = listarPesaje;
    }   
    
    public List<TComprobante> getListarComprobante() {
        ComprobanteManaged objCom = new ComprobanteManaged();
        listarComprobante = objCom.listarComprobante(selectedLiquidacion);
        return listarComprobante;
    }

    public void setListarComprobante(List<TComprobante> listarComprobante) {
        this.listarComprobante = listarComprobante;
    }
       
}
