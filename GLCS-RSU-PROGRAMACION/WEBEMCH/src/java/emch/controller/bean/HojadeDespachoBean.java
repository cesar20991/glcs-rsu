package emch.controller.bean;

import emch.modelo.acceso.HojadeDespachoManaged;
import emch.modelo.acceso.TurnoManaged;
import emch.modelo.acceso.UbiGeoManaged;
import emch.modelo.entidades.TDespacho;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.swing.JOptionPane;

@ManagedBean
@RequestScoped
public class HojadeDespachoBean {

    private List<String> nombTurnos;
    private List<String> nombUbigeos;
    private TDespacho despacho;
    private String nombTurno;
    private String nombUbiGeo;

    public void insertarDespacho() {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        obj.insertar(getDespacho());
    }

    public HojadeDespachoBean() {
    }

    public TDespacho getDespacho() {
        return despacho;
    }

    public void setDespacho(TDespacho despacho) {
        this.despacho = despacho;
    }

    public List<String> getNombTurnos() {
        TurnoManaged obj = new TurnoManaged();
        setNombTurnos(obj.buscarNomTurnos());
        return nombTurnos;
    }

    public void setNombTurnos(List<String> nombTurnos) {
        this.nombTurnos = nombTurnos;
    }

    public void setNombTurno(String nombTurno) {
        this.nombTurno = nombTurno;
    }

    public String getNombTurno() {
        return nombTurno;
    }

    public List<String> getNombUbigeos() {
        UbiGeoManaged obj = new UbiGeoManaged();
        setNombUbigeos(obj.buscarNomUbigeo());
        return nombUbigeos;
    }

    public void setNombUbigeos(List<String> nombUbigeos) {
        this.nombUbigeos = nombUbigeos;
    }

    public String getNombUbiGeo() {
        return nombUbiGeo;
    }

    public void setNombUbiGeo(String nombUbiGeo) {
        this.nombUbiGeo = nombUbiGeo;
    }
    
}