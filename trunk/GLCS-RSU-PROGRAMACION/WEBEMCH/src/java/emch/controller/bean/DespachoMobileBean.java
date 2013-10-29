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
public class DespachoMobileBean {
    private TDespacho despacho;
    private List<TDespacho> listaDespacho;
    
    @PostConstruct
    public void init() {
        
    }
    
    public List<TDespacho> getListaDespacho() {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listaDespacho = obj.buscarTodos();
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
}
