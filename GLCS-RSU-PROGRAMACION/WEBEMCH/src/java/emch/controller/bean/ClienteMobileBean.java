package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;


@ManagedBean
@SessionScoped
public class ClienteMobileBean {
    private TCliente cliente;
    private List<TCliente> listaCliente;
    
    @PostConstruct
    public void init() {
        
    }
    
    public List<TCliente> getListaCliente() {
        ClienteManaged obj = new ClienteManaged();
        listaCliente = obj.buscarTodos();
        return listaCliente;
    }

    public void setListaCliente(List<TCliente> listaDespacho) {
        this.listaCliente = listaDespacho;
    }

    public TCliente getCliente() {
        return cliente;
    }

    public void setCliente(TCliente cliente) {
        this.cliente = cliente;
    }
}
