package util;

public class ConsultaTrabajadoresXTurno {
    String cdCamion;
    String cdTrabajador;
    String Nombres;
    String Apellidos;

    public ConsultaTrabajadoresXTurno(String cdCamion, String cdTrabajador, String Nombres, String Apellidos) {
        this.cdCamion = cdCamion;
        this.cdTrabajador = cdTrabajador;
        this.Nombres = Nombres;
        this.Apellidos = Apellidos;
    }

    public String getCdCamion() {
        return cdCamion;
    }

    public void setCdCamion(String cdCamion) {
        this.cdCamion = cdCamion;
    }

    public String getCdTrabajador() {
        return cdTrabajador;
    }

    public void setCdTrabajador(String cdTrabajador) {
        this.cdTrabajador = cdTrabajador;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }
    
    
}