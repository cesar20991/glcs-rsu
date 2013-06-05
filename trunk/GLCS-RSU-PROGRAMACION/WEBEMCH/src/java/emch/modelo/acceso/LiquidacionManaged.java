package emch.modelo.acceso;

import emch.modelo.entidades.TEstadoliq;
import emch.modelo.entidades.TEstadoxliquidacion;
import emch.modelo.entidades.TEstadoxliquidacionId;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TPesaje;
import emch.modelo.entidades.TTipoliquidacion;
import emch.modelo.entidades.TTipotrabajador;
import emch.modelo.entidades.TTrabajador;
import emch.modelo.entidades.TUbigeo;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import util.HibernateUtil;

public class LiquidacionManaged {

    Session sesion;
    Transaction trans;
    Query qry;

    public List listarLiquidacion() {
        List<TLiquidacion> listaLiq = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        qry = sesion.createQuery("FROM TLiquidacion");
        listaLiq = (List<TLiquidacion>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaLiq;
    }

    public List ListarTipoLiquidacion() {
        List<TTipoliquidacion> listaTLiq = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        qry = sesion.createQuery("FROM TTipoliquidacion");
        listaTLiq = (List<TTipoliquidacion>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaTLiq;
    }

    //---------Lista pesaje que todavia no fueron cobrados por el cliente---------------------//
    public List listarPesajePendiente(String rucemp, Date fechaInicio, Date fechaFin) {
        List<TPesaje> listaTLiq = null;
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            //String fechaI=sdf.format(fechaInicio);
            //String fechaF=sdf.format(fechaFin);
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT p FROM TPesaje p inner join p.TControlviaje cv where p.estadoPesaje='PP' and cv.TDespachodet.id.cdRuc='" + rucemp + "' ");//and p.fechaPesaje between '"+fechaI+"' and '"+fechaF+"'");            
            //qry = sesion.createQuery("SELECT p FROM TPesaje p where p.estadoPesaje='P' and p.TControlviaje.TDespachodet.id.cdRuc='" + rucemp + "' and p.fechaPesaje between '"+fechaI+"' and '"+fechaF+"'");            
            listaTLiq = (List<TPesaje>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
            ex.getMessage();
        } /*finally {
         sesion.close();
         }*/
        return listaTLiq;
    }
    public List listarPesajePendienteCons(String rucemp, String cdliq,Date fechaInicio, Date fechaFin) {
        List<TPesaje> listaTLiq = null;
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            //String fechaI=sdf.format(fechaInicio);
            //String fechaF=sdf.format(fechaFin);
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT p FROM TPesaje p where p.estadoPesaje='P' and p.TLiquidacion.cdLiq='"+cdliq+"' and p.TControlviaje.TDespachodet.id.cdRuc='" + rucemp + "' ");//and p.fechaPesaje between '"+fechaI+"' and '"+fechaF+"'");            
            listaTLiq = (List<TPesaje>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
            ex.getMessage();
        } /*finally {
         sesion.close();
         }*/
        return listaTLiq;
    }
    

    public boolean IngresarLiquidacion(TLiquidacion liquidacion, TPesaje[] selectedPesaje) {
        FacesContext context1 = FacesContext.getCurrentInstance();
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            String idcl = obtenerIDLiquidacion();
            if (idcl.equals("")) {
                //context1.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Error al generar NUMERACION","");
                return false;
            }
            liquidacion.setCdLiq(idcl);
            sesion.save(liquidacion);
            actualizarPesajexLiquidacion(liquidacion, selectedPesaje);
            ingresarEstadoxLiquidacionInicial(liquidacion, false);
            //if (!trans.wasCommitted()) {
            trans.commit();
            //}
        } catch (Exception ex) {
            //despues agrego para que salgan mensajes de error            
            context1.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Error al generar Liquidación", ex.getMessage()));
            trans.rollback();
            //ex.printStackTrace();
            return false;
        } finally {
            sesion.close();
        }
        return true;
    }

    private String obtenerIDLiquidacion() {
        String nuevoID = "";
        try {
            qry = sesion.createSQLQuery("select idLiquidacion2();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            System.out.println("llamando a funcion");
            System.out.println(idNuevo);
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        } catch (Exception ex) {
            nuevoID = "";
        }
        return nuevoID;
    }

    /*METODO QUE AL GENERA LIQUIDACION EMPIEZA CON EL ESTADO INICIAL - PENDIENTE*/
    public void ingresarEstadoxLiquidacionInicial(TLiquidacion liquidacion, boolean ver) {
        try {
            TEstadoliq obj = new TEstadoliq();
            obj.setCdEstadoLiq("EL1");
            TEstadoxliquidacionId estadoLiq = new TEstadoxliquidacionId();
            estadoLiq.setCdLiq(liquidacion.getCdLiq());
            estadoLiq.setCdEstadoLiq("EL1");
            estadoLiq.setFechaEstado(liquidacion.getFechaApertura());
            TEstadoxliquidacion nuevo = new TEstadoxliquidacion();
            nuevo.setId(estadoLiq);
            nuevo.setObs("Liquidación Pendiente para ser cobrada");
            nuevo.setTEstadoliq(obj);
            nuevo.setTLiquidacion(liquidacion);
            sesion.save(nuevo);
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }

    /*METODO QUE ACTUALIZA LOS PESAJES ASOCIADOS A LA LIQUIDACION GENERADA*/
    public void actualizarPesajexLiquidacion(TLiquidacion liquidacion, TPesaje[] pesaje) {
        FacesContext context1 = FacesContext.getCurrentInstance();
        try {
            for (TPesaje tp : pesaje) {
                TPesaje dtopesaje = new TPesaje();
                dtopesaje = tp;
                dtopesaje.setTLiquidacion(liquidacion);
                sesion.merge(dtopesaje);
                //sesion.beginTransaction().commit(); no volver a hacer esto xD
            }
        } catch (Exception e) {
            sesion.beginTransaction().rollback();
            context1.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN, "Error al Actualiza Pesaje Asociados de Liquidacion", e.getMessage()));
        }
    }
    
    /*LISTADO DE ESTADOS POR LIQUIDACION*/
    public List ObtenerEstadoLiq(TLiquidacion liquidacion){
        List<TEstadoxliquidacion> listaTLiq = null;        
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT e FROM TEstadoxliquidacion e where e.id.cdLiq='"+liquidacion.getCdLiq()+"'");            
            listaTLiq = (List<TEstadoxliquidacion>) qry.list();
        } catch (Exception ex) {
            ex.getMessage();
        } /*finally {
         sesion.close();
         }*/
        return listaTLiq;
    }
    
}
