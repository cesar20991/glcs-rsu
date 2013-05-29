/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.modelo.acceso;

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

    public List listarPesaje(Date FechaInicio, Date FechaFin) {
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

}
