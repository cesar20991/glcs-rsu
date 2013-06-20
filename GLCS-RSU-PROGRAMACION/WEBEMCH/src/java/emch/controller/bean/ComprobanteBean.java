package emch.controller.bean;

import emch.modelo.acceso.ComprobanteManaged;
import emch.modelo.entidades.TComprobante;
import emch.modelo.entidades.TComprobantedet;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TMoneda;
import emch.modelo.entidades.TServicio;
import emch.modelo.entidades.TTipodoc;
import java.math.BigDecimal;
import java.util.List;
import java.util.Properties;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.AjaxBehaviorEvent;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Cesar
 */
@ManagedBean
@SessionScoped
public class ComprobanteBean extends UsuarioBean {

    private TComprobante comprobante;
    private List<TComprobante> listarComprobante;
    private List<TServicio> listarServicio;
    private TLiquidacion selectedliquidacion;
    private List<TServicio> listadoDeServicios;
    private TServicio servicio;
    private TComprobantedet comprobantedet;
    private List<TComprobantedet> listcompdet;
    private List<TComprobante> listarComprobantes;
    private List<TComprobantedet> listarComprobantesDets;
    
    /*--------DATOS CORREO--------*/
    private String De;
    private String PwRemitente="";
    private String Para;
    private String Asunto="";
    private String Mensaje="";
    /*----------------------------*/

    public ComprobanteBean() {
        comprobante = new TComprobante();
        comprobante.setTLiquidacion(new TLiquidacion());
        comprobante.setTMoneda(new TMoneda());
        comprobante.setTTipodoc(new TTipodoc());

        servicio = new TServicio();
        comprobantedet = new TComprobantedet();
        comprobantedet.setTServicio(new TServicio());
    }

    public String ingresar() {
        return "";
    }

    public String insertar() {
        FacesContext context = FacesContext.getCurrentInstance();
        return "";
    }

    public String irRegresar() {
        return "liquidaciones";
    }

    public String irAgregar() {
        return "nuevahojadespacho";
    }

    public String irPesaje() {
        return "pesajes";
    }

    public String irComprobante() {
        return "comprobantes";
    }

    public List<TComprobante> getListarComprobante() {
        return listarComprobante;
    }

    public void setListarComprobante(List<TComprobante> listarComprobante) {
        this.listarComprobante = listarComprobante;
    }

    public TComprobante getComprobante() {
        return comprobante;
    }

    public void setComprobante(TComprobante comprobante) {
        this.comprobante = comprobante;
    }

    public TLiquidacion getSelectedliquidacion() {
        return selectedliquidacion;
    }

    public void setSelectedliquidacion(TLiquidacion selectedliquidacion) {
        this.selectedliquidacion = selectedliquidacion;
    }

    public List<TServicio> getListarServicio() {
        return listarServicio;
    }

    public void setListarServicio(List<TServicio> listarServicio) {
        this.listarServicio = listarServicio;
    }

    public List<TServicio> getListadoDeServicios() {
        ComprobanteManaged obj = new ComprobanteManaged();
        listadoDeServicios = obj.listarServicio();
        return listadoDeServicios;
    }

    public void setListadoDeServicios(List<TServicio> listadoDeServicios) {
        this.listadoDeServicios = listadoDeServicios;
    }

    public List<TServicio> getTrabajadorXcamion() {
        return listadoDeServicios;
    }

    public TServicio getServicio() {
        return servicio;
    }

    public void setServicio(TServicio servicio) {
        this.servicio = servicio;
    }

    public TComprobantedet getComprobantedet() {
        return comprobantedet;
    }

    public void setComprobantedet(TComprobantedet comprobantedet) {
        this.comprobantedet = comprobantedet;
    }

    public String irListoAgregar() {
        comprobantedet.setTServicio(servicio);
        comprobantedet.setItem("1");
        BigDecimal total = new BigDecimal("1.00").setScale(2);
        BigDecimal CanTN = new BigDecimal("1.00");
        BigDecimal precio = new BigDecimal("1.00");
        CanTN.multiply(getComprobantedet().getCantTn());
        precio.multiply(CanTN);
        total.multiply(precio);
        comprobantedet.setTotal(total);
        comprobantedet.setTComprobante(new TComprobante("CP00000001", null, null, null, null, "", "", total, total, CanTN, "", null, ""));
        listcompdet.add(comprobantedet);
        return "nuevocomprobante";
    }

    public List<TComprobantedet> getListcompdet() {
        return listcompdet;
    }

    public void setListcompdet(List<TComprobantedet> listcompdet) {
        this.listcompdet = listcompdet;
    }

    public List<TComprobante> getListarComprobantes() {
        ComprobanteManaged obj = new ComprobanteManaged();
        setListarComprobantes(obj.listarComprobantes());
        return listarComprobantes;
    }

    public void setListarComprobantes(List<TComprobante> listarComprobantes) {
        this.listarComprobantes = listarComprobantes;
    }
    String comprobanteA = "";
    public void buscarCompDet(AjaxBehaviorEvent event) {
        comprobanteA = comprobante.getIdComprobante();
        ComprobanteManaged obj = new ComprobanteManaged();
        listarComprobantesDets = obj.listarComprobantesDets(comprobante);
    }
    
    public void ResulCorreo(AjaxBehaviorEvent event) {
        De = "ola q ase";
        Para ="la llamita";
        Mensaje = "Pago del Comprobante " + comprobante.getIdComprobante();
    }    

    public List<TComprobantedet> getListarComprobantesDets() {
        return listarComprobantesDets;
    }

    public void setListarComprobantesDets(List<TComprobantedet> listarComprobantesDets) {
        this.listarComprobantesDets = listarComprobantesDets;
    }

    public String getDe() {
        return De;
    }

    public void setDe(String De) {
        this.De = De;
    }

    public String getPwRemitente() {
        return PwRemitente;
    }

    public void setPwRemitente(String PwRemitente) {
        this.PwRemitente = PwRemitente;
    }

    public String getPara() {
        return Para;
    }

    public void setPara(String Para) {
        this.Para = Para;
    }

    public String getAsunto() {
        return Asunto;
    }

    public void setAsunto(String Asunto) {
        this.Asunto = Asunto;
    }

    public String getMensaje() {
        return Mensaje;
    }

    public void setMensaje(String Mensaje) {
        this.Mensaje = Mensaje;
    }
    
    /*----------------------ENVIO DE CORREO------------------------*/
    
     public String enviarEmail() {
        try {
            // Propiedades de la conexión
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            // Preparamos la sesion
            Session session = Session.getDefaultInstance(props);

            //Recoger los datos (OBTENIDOS DEL JSF)
            //Obtenemos los destinatarios
            String destinos[] = getPara().split(",");
            // Construimos el mensaje
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(getDe()));
            Address[] receptores = new Address[destinos.length];
            int j = 0;
            while (j < destinos.length) {
                receptores[j] = new InternetAddress(destinos[j]);
                j++;
            }
            //receptores.
            message.addRecipients(Message.RecipientType.TO, receptores);
            message.setSubject(getAsunto());
            message.setText(getMensaje());
            // Lo enviamos.
            Transport t = session.getTransport("smtp");
            t.connect(getDe(), getPwRemitente());
            t.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
            // Cierre de la conexion.
            t.close();
            return"";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    /*-------------------------------------------------------------*/

}
