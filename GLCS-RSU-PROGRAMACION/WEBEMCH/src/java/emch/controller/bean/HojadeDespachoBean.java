package emch.controller.bean;

import emch.modelo.acceso.*;
import emch.modelo.entidades.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.AjaxBehaviorEvent;
import javax.faces.model.DataModel;
import javax.swing.JOptionPane;

@ManagedBean
@SessionScoped
public class HojadeDespachoBean {

    private TDespacho despacho;
    private List<TUbigeo> listarUbigeoSel;
    private List<TDespacho> listadespacho2;
    private List<TDespachodet> selectDespachoDet;
    private List<TTrabajadorxcamion> listadotrabajadorXcamion;
    private List<TDespachodet> listaDespachoDet;
    private List<TTrabajadorxcamion> trabajadorXcamion;
    private List<TTurno> listurno;
    private DataModel listadespacho;
    private boolean esEdicion;
    private String accion;
    private String mensajeError;
    private TTrabajadorxcamion[] selectedTrabxCamion;
    private TDespachodet despachodet;

    @PostConstruct
    public void init() {
        despacho = new TDespacho();
        despacho.setTUbigeo(new TUbigeo());
        despacho.setTEmpresa(new TEmpresa());
        despacho.setTTurno(new TTurno());
        getListadespacho2();
    }

    public String irAgregar() {
        setEsEdicion(false);
        setDespacho(new TDespacho());
        despacho.setTTurno(new TTurno());
        despacho.setTUbigeo(new TUbigeo());
        despacho.setTEmpresa(new TEmpresa());
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
        despacho.setId(new TDespachoId(cdDes, RucE));//(new TTipotrabajador
        despacho.setTUbigeo(new TUbigeo(codigoUb, "", false));
        despacho.setTTurno(new TTurno(codigoTur, ""));
        despacho.setTEmpresa(new TEmpresa("RC0001", null, "", "", null, "", ""));
        setSelectedTrabxCamion(selectedTrabxCamion);
        return "nuevahojadespacho";
    }

    public TDespacho getDespacho() {
        return despacho;
    }

    public void setDespacho(TDespacho despacho) {
        this.despacho = despacho;
    }

    public List<TUbigeo> getListarUbigeoSel() {
        HojadeDespachoManaged objTrb = new HojadeDespachoManaged();
        listarUbigeoSel = objTrb.listarUbigeo();
        return listarUbigeoSel;
    }

    public void setListarUbigeoSel(List<TUbigeo> listarUbigeoSel) {
        this.listarUbigeoSel = listarUbigeoSel;
    }

    public String ingresar() {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listadotrabajadorXcamion = Arrays.asList(getSelectedTrabxCamion());
        boolean resultado = isEsEdicion() ? obj.actualizar(despacho)
                : obj.insertar(despacho, listadotrabajadorXcamion);
        if (resultado) {
            return "HojaDeDespacho";
        } else {
            return ""; //futuros errores
        }
    }

    public void irActualiza_despacho() throws IOException {
        FacesContext.getCurrentInstance().getExternalContext().redirect("HojaDeDespacho.xhtml");
    }

    public void EliminarDespacho(ActionEvent actionEvent) throws IOException {
        if (despacho.getId().getCdDespacho() != null) {
            HojadeDespachoManaged obj = new HojadeDespachoManaged();
            despacho.setEvaluacion("NO");
            listadotrabajadorXcamion = Arrays.asList(getSelectedTrabxCamion());
            boolean resultado = obj.actualizar(despacho);
            obj.EstadoDespachoDet(despacho);
            FacesContext.getCurrentInstance().getExternalContext().redirect("HojaDeDespacho.xhtml");
        }
    }

    public List<TDespacho> getListadespacho2() {
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listadespacho2 = obj.buscarTodos();
        return listadespacho2;
    }

    public void setListadespacho2(List<TDespacho> listadespacho2) {
        this.listadespacho2 = listadespacho2;
    }

    public DataModel getListadespacho() {
        return listadespacho;
    }

    public void setListadespacho(DataModel listadespacho) {
        this.listadespacho = listadespacho;
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

    public String getMensajeError() {
        return mensajeError;
    }

    public void setMensajeError(String mensajeError) {
        this.mensajeError = mensajeError;
    }

    public List<TDespachodet> getSelectDespachoDet() {
        return selectDespachoDet;
    }

    public void setSelectDespachoDet(List<TDespachodet> selectDespachoDet) {
        this.selectDespachoDet = selectDespachoDet;
    }

    public List<TTrabajadorxcamion> getTrabajadorXcamion() {
        TrabajadorxCamionManaged obj = new TrabajadorxCamionManaged();
        trabajadorXcamion = obj.listarTrabajadorXCamion();
        return trabajadorXcamion;
    }

    public void setTrabajadorXcamion(List<TTrabajadorxcamion> trabajadorXcamion) {
        this.trabajadorXcamion = trabajadorXcamion;
    }

    public List<TTurno> getListurno() {
        HojadeDespachoManaged objTrb = new HojadeDespachoManaged();
        listurno = objTrb.listarturno();
        return listurno;
    }

    public void setListurno(List<TTurno> listurno) {
        this.listurno = listurno;
    }

    public TTrabajadorxcamion[] getSelectedTrabxCamion() {
        return selectedTrabxCamion;
    }

    public void setSelectedTrabxCamion(TTrabajadorxcamion[] selectedTrabxCamion) {
        this.selectedTrabxCamion = selectedTrabxCamion;
    }

    public String irListoAgregar() {
        setListadotrabajadorXcamion(null);
        setListadotrabajadorXcamion(Arrays.asList(getSelectedTrabxCamion()));
        return "nuevahojadespacho";
    }

    public List<TTrabajadorxcamion> getListadotrabajadorXcamion() {
        return listadotrabajadorXcamion;
    }

    /**
     * @param listadotrabajadorXcamion the listadotrabajadorXcamion to set
     */
    public void setListadotrabajadorXcamion(List<TTrabajadorxcamion> listadotrabajadorXcamion) {
        this.listadotrabajadorXcamion = listadotrabajadorXcamion;
    }

    public List<TDespachodet> getListaDespachoDet() {
        //HojadeDespachoManaged obj = new HojadeDespachoManaged();
        //listaDespachoDet = obj.ListarDespachoxDespachoDet();     
        return listaDespachoDet;
    }

    public void setListaDespachoDet(List<TDespachodet> listaDespachoDet) {
        this.listaDespachoDet = listaDespachoDet;
    }
    String despachoA = "";

    public void buscarconsull3(AjaxBehaviorEvent event) {
        despachoA = despacho.getId().getCdDespacho();
        HojadeDespachoManaged obj = new HojadeDespachoManaged();
        listaDespachoDet = obj.ListarDespachoxDespachoDet(getDespacho());
    }

    public String irAsignarRuta() {
        return "asignarruta";
    }

    public TDespachodet getDespachodet() {
        return despachodet;
    }

    public void setDespachodet(TDespachodet despachodet) {
        this.despachodet = despachodet;
    }
}