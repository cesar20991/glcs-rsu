/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.modelo.acceso;

import emch.modelo.entidades.TAsignarruta;
import emch.modelo.entidades.TDespachodet;
import emch.modelo.entidades.TDespachodetId;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TLiquidacion;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
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

    public List listarEmpresa() {
        List<TEmpresa> listaLiq = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        qry = sesion.createQuery("FROM TEmpresa");
        listaLiq = (List<TEmpresa>) qry.list();
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
            qry = sesion.createQuery("SELECT ab from TDespachodet ab order by ab.TDespacho.nroDespacho");//  v inner join v.TDespachodets ab where v.id.cdDespacho ='"+ despacho+"'");
            listadespachoDet = (List<TDespachodet>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //finally{sesion.close();}
        return listadespachoDet;
    }

    public boolean ingresarRuta(TAsignarruta asignarruta, TDespachodet selecteddespachodet) {
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            String idcl = obtenerIDAsignarruta();
            if (idcl.equals("")) {
                return false;
            }
            asignarruta.setTDespachodet(selecteddespachodet);
            asignarruta.setCdRuta(idcl);
            sesion.save(asignarruta);
            trans.commit();
        } catch (Exception ex) {
            context.addMessage(null, new FacesMessage("Error al asignar ruta", "Verificar"));
            //despues agrego para que salgan mensajes de error            
            trans.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            sesion.close();
        }
        return true;
    }

    private String obtenerIDAsignarruta() {
        String nuevoID = "";
        /* try {*/
        qry = sesion.createSQLQuery("select idAsignaruta();");
        ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
        nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        /* } catch (Exception ex) {
         nuevoID = "";
         }*/
        return nuevoID;
    }
    
     public List listarRutaAsignadaxCamion(TDespachodet despachodet) {
        List<TAsignarruta> listaLiq = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        qry = sesion.createQuery("SELECT ab FROM TAsignarruta  ab where ab.TDespachodet.id.cdDespacho='"+despachodet.getId().getCdDespacho()+"' and ab.TDespachodet.id.nro='"+despachodet.getId().getNro()+"'");
        listaLiq = (List<TAsignarruta>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaLiq;
    }

    
}
