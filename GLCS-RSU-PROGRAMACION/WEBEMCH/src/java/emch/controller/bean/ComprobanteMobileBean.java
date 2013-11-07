package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
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
    
    @PostConstruct
    public void init() {
        
    }
    
    public List<TComprobante> getListaComprobante() {
        ComprobantesManaged obj = new ComprobantesManaged();
        listaComprobante = obj.buscarTodos();
        return listaComprobante;
    }

    public void setListaComprobante(List<TComprobante> listaComprobante) {
        this.listaComprobante = listaComprobante;
    }

    public TComprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(TComprobante comprobante) {
        this.comprobante = comprobante;
    }
}
