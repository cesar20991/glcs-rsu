package emch.controller.bean;

import emch.modelo.acceso.AsistenciaManaged;
import emch.modelo.entidades.TAsistencia;
import emch.modelo.entidades.TAsistenciaxtrabajador;
import emch.modelo.entidades.TAsistenciaxtrabajadorId;
import emch.modelo.entidades.TTrabajador;
import emch.modelo.entidades.TTurno;
import java.util.Date;
import java.util.List;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class AsistenciaBean {

    private Date fechajust = new Date();
    private Date fechaActual = new Date();
    private String sfechaActual = fechaActual.getDate() + " / " + (fechaActual.getMonth() + 1) + " / " + (fechaActual.getYear() - 100);
    private String cdAsistencia = "";
    private List<TTrabajador> listatrabajador;
    private List<TTrabajador> listatrabajador2;
    private List<TAsistencia> listaAsistencia;
    private TTrabajador trabajador;
    private TAsistencia asistencia;
    private TAsistencia asistenciaCuadro;
    private TTurno turno;

    public AsistenciaBean() {
        trabajador = new TTrabajador();
        if (fechaActual.getHours() >= 8 & fechaActual.getHours() < 20) {
            cdAsistencia += "M" + fechaActual.getDate();
            turno = new TTurno("TN01", "Mañana");
        } else if ((fechaActual.getHours() >= 20 || fechaActual.getHours() < 8)) {
            cdAsistencia += "N" + (fechaActual.getDate() + 1);
            turno = new TTurno("TN02", "Noche");
        }
        AsistenciaManaged obj = new AsistenciaManaged();
        TAsistencia ta = new TAsistencia(cdAsistencia, turno, fechaActual, "mar1693", fechaActual);
        if (!obj.ExisteIdAsistencia(cdAsistencia)) {
            obj.insertarAsistencia(ta);
        }
        asistenciaCuadro = new TAsistencia(cdAsistencia, turno, fechaActual, "mar1693", fechaActual);
    }

    public Date getFechajust() {
        return fechajust;
    }

    public void setFechajust(Date fechajust) {
        this.fechajust = fechajust;
    }

    public Date getFechaActual() {
        return fechaActual;
    }

    public void setFechaActual(Date fechaActual) {
        this.fechaActual = fechaActual;
    }

    public String getSfechaActual() {
        return sfechaActual;
    }

    public void setSfechaActual(String sfechaActual) {
        this.sfechaActual = sfechaActual;
    }

    public List<TTrabajador> getListatrabajador() {
        AsistenciaManaged obj = new AsistenciaManaged();
        if (!obj.ExisteIdAsistencia(cdAsistencia)) {
            listatrabajador = obj.todosTrabajador();
        } else {
            listatrabajador = obj.todosTrabajadoresSinAsistencia(cdAsistencia);
        }
        return listatrabajador;
    }

    public void setListatrabajador(List<TTrabajador> listatrabajador) {
        this.listatrabajador = listatrabajador;
    }

    public List<TTrabajador> getListatrabajador2() {
        AsistenciaManaged obj = new AsistenciaManaged();
        listatrabajador2 = obj.todosTrabajador();
        return listatrabajador2;
    }

    public void setListatrabajador2(List<TTrabajador> listatrabajador2) {
        this.listatrabajador2 = listatrabajador2;
    }

    public TTrabajador getTrabajador() {
        return trabajador;
    }

    public void setTrabajador(TTrabajador trabajador) {
        this.trabajador = trabajador;
    }

    public String getCdAsistencia() {
        return cdAsistencia;
    }

    public void setCdAsistencia(String cdAsistencia) {
        this.cdAsistencia = cdAsistencia;
    }

    public void MarcarAsistencia(TTrabajador trabajador) {
        AsistenciaManaged obj = new AsistenciaManaged();
        TAsistenciaxtrabajadorId asistenciaxtrabajadorId = new TAsistenciaxtrabajadorId(trabajador.getCdTrabajador(), cdAsistencia);
        TAsistenciaxtrabajador asistenciaxtrabajador = new TAsistenciaxtrabajador(asistenciaxtrabajadorId, trabajador, asistencia, true, false, false);
        obj.insertarAsistenciaxTrabajador(asistenciaxtrabajador);
    }

    public void MarcarTardanza(TTrabajador trabajador) {
        AsistenciaManaged obj = new AsistenciaManaged();
        TAsistenciaxtrabajadorId asistenciaxtrabajadorId = new TAsistenciaxtrabajadorId(trabajador.getCdTrabajador(), cdAsistencia);
        TAsistenciaxtrabajador asistenciaxtrabajador = new TAsistenciaxtrabajador(asistenciaxtrabajadorId, trabajador, asistencia, false, true, false);
        obj.insertarAsistenciaxTrabajador(asistenciaxtrabajador);
    }

    public void ModificarAsistencia(TTrabajador trabajador, int i) {
        TAsistenciaxtrabajadorId asistenciaxtrabajadorId = new TAsistenciaxtrabajadorId(trabajador.getCdTrabajador(), asistenciaCuadro.getCdAsistencia());
        TAsistenciaxtrabajador asistenciaxtrabajador = null;
        AsistenciaManaged obj = new AsistenciaManaged();
        switch (i) {
            case 1:
                asistenciaxtrabajador = new TAsistenciaxtrabajador(asistenciaxtrabajadorId, trabajador, asistencia, true, false, false);
                obj.ModificarAsistenciaxTrabajador(asistenciaxtrabajador);
                break;
            case 2:
                asistenciaxtrabajador = new TAsistenciaxtrabajador(asistenciaxtrabajadorId, trabajador, asistencia, false, true, false);
                obj.ModificarAsistenciaxTrabajador(asistenciaxtrabajador);
                break;
            case 3:
                asistenciaxtrabajador = new TAsistenciaxtrabajador(asistenciaxtrabajadorId, trabajador, asistencia, false, false, true);
                obj.insertarAsistenciaxTrabajador(asistenciaxtrabajador);
                break;
        }
    }

    public List<TAsistencia> getListaAsistencia() {
        AsistenciaManaged obj = new AsistenciaManaged();
        listaAsistencia = obj.todasAsistencias();
        return listaAsistencia;
    }

    public void setListaAsistencia(List<TAsistencia> listaAsistencia) {
        this.listaAsistencia = listaAsistencia;
    }

    public TAsistencia getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(TAsistencia asistencia) {
        this.asistencia = asistencia;
    }

    public TAsistencia getAsistenciaCuadro() {
        return asistenciaCuadro;
    }

    public void setAsistenciaCuadro(TAsistencia asistenciaCuadro) {
        this.asistenciaCuadro = asistenciaCuadro;
    }

    public String EstadoAsistenciaxTrabajador(TTrabajador tTrabajador) {
        AsistenciaManaged obj = new AsistenciaManaged();
        TAsistenciaxtrabajador taxt = obj.AsistenciaxTrabajador(asistenciaCuadro, tTrabajador);
        if (taxt == null) {
            return "Falto";
        } else if (taxt.getAsiste()) {
            return "Asistio";
        } else if (taxt.getTardanza()) {
            return "Tardanza";
        } else if (taxt.getFustifica()) {
            return "Falta Justificada";
        }
        return "";
    }

    public void PreperarASistenciaCuadro(TAsistencia ta) {
        asistenciaCuadro = ta;
    }
}
