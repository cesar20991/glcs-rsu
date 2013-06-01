/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.modelo.acceso;

import emch.modelo.entidades.TComprobante;
import emch.modelo.entidades.TDespacho;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TPesaje;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import util.HibernateUtil;

/**
 *
 * @author Monica
 */
public class VerificarComprobanteManaged {
    Session sesion;
    Transaction trans;
    Query qry;

    public List listarPesaje(Date FechaInicio, Date FechaFin,String rucemp) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date d = new Date();
        String fechaI,fechaF = "";
        if(FechaInicio!=null && FechaFin!=null){
            fechaI = sdf.format(FechaInicio);
            fechaF = sdf.format(FechaFin);
        }
        else { 
            fechaI = sdf.format(d.getDate());
            fechaF = sdf.format(d.getDate());
        }
        List<TPesaje> listapesaje = null;
       /* try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();            
            qry = sesion.createQuery("select a FROM TPesaje a where a.fechaPesaje between '"+fechaI+"' and  '"+fechaF+"'");
            listapesaje = (List<TPesaje>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
       }*/
        return listapesaje;
        }
    
    
        public List listarComprobante(Date FechaInicio, Date FechaFin,String rucemp){
               java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date d = new Date();
        String fechaI,fechaF = "";
        if(FechaInicio!=null && FechaFin!=null){
            fechaI = sdf.format(FechaInicio);
            fechaF = sdf.format(FechaFin);
        }
        else { 
            fechaI = sdf.format(d.getDate());
            fechaF = sdf.format(d.getDate());
        }
        List<TComprobante> listacomprobante = null;
       /* try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();            
            qry = sesion.createQuery("select a FROM TComprobante a where a.fechaComprobante between '"+fechaI+"' and  '"+fechaF+"'");
            listacomprobante = (List<TComprobante>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
       }*/
        return listacomprobante;
        }
        
         public List listarDespacho(Date FechaInicio, Date FechaFin,String rucemp){
             java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date d = new Date();
        String fechaI,fechaF = "";
        if(FechaInicio!=null && FechaFin!=null){
            fechaI = sdf.format(FechaInicio);
            fechaF = sdf.format(FechaFin);
        }
        else { 
            fechaI = sdf.format(d.getDate());
            fechaF = sdf.format(d.getDate());
        }
        List<TDespacho> listadespacho = null;
       /* try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();            
            qry = sesion.createQuery("select a FROM TDespacho a where a.fechaDespacho between '"+fechaI+"' and  '"+fechaF+"'");
            listadespacho = (List<TDespacho>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
       }*/
        return listadespacho;
        }
         
         public List listarLiquidacion(Date FechaInicio, Date FechaFin,String rucemp){
              java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date d = new Date();
        String fechaI,fechaF = "";
        if(FechaInicio!=null && FechaFin!=null){
            fechaI = sdf.format(FechaInicio);
            fechaF = sdf.format(FechaFin);
        }
        else { 
            fechaI = sdf.format(d.getDate());
            fechaF = sdf.format(d.getDate());
        }
        List<TLiquidacion> listaliquidacion = null;
       /* try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();            
            qry = sesion.createQuery("select a FROM TLiquidacion a where a.fechaApertura between '"+fechaI+"' and  '"+fechaF+"'");
            listaliquidacion = (List<TLiquidacion>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
       }*/
        return listaliquidacion;
    }

}
