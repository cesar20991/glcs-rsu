/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.modelo.acceso;

import emch.modelo.entidades.TAsignarruta;
import emch.modelo.entidades.TDespachodet;
import emch.modelo.entidades.TLiquidacion;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import util.HibernateUtil;

/**
 *
 * @author Cesar
 */
public class MapsManaged {

    Session sesion;
    Transaction trans;
    Query qry;

    public List listarRutaAsignadaTodos() {
        List<TAsignarruta> listaLiq = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        qry = sesion.createQuery("FROM TAsignarruta");
        listaLiq = (List<TAsignarruta>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaLiq;
    }
    
    public List ListarDespachoxDespachoDet() {
        List<TDespachodet> listadespachoDet = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();            
            qry = sesion.createQuery( "SELECT ab from TDespachodet ab order by ab.TDespacho.nroDespacho");//  v inner join v.TDespachodets ab where v.id.cdDespacho ='"+ despacho+"'");
            listadespachoDet = (List<TDespachodet>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //finally{sesion.close();}
        return listadespachoDet;
    }
}
