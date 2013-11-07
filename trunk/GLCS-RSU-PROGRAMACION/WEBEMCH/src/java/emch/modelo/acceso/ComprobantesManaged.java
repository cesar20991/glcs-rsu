package emch.modelo.acceso;

import emch.modelo.entidades.TComprobante;
import emch.modelo.entidades.TComprobantedet;
import emch.modelo.entidades.TEstadoliq;
import emch.modelo.entidades.TEstadoxliquidacion;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TServicio;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
    
public class ComprobantesManaged {
    
    Session sesion;
    Transaction trans;
    Query qry;
    
    public List<TComprobante> buscarTodos() {
            List<TComprobante> listacomprobante = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("FROM TComprobante");
            listacomprobante = (List<TComprobante>) qry.list();
            return listacomprobante;
    }

    public TLiquidacion buscarPorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TLiquidacion) session.load(TLiquidacion.class, id);
    }

    public List<TServicio> buscarServiciosTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TServicio").list();
    }

    public List<TComprobantedet> buscarComprobantesDetTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TComprobantedet").list();
    }

//    public List<TMoneda> buscarMonedasTodas() {
//        Session session = HibernateUtil.getSessionFactory().openSession();
//        return session.createQuery("FROM TMoneda").list();
//    }
//
//    public List<TTipodoc> buscarTiposDocTodos() {
//        Session session = HibernateUtil.getSessionFactory().openSession();
//        return session.createQuery("FROM TTipodoc").list();
//    }

    public String getIDComprobante() {
        String nuevoID = "";
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query qry = session.createSQLQuery("SELECT idComprobante();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        } catch (Exception e) {
            System.out.println("Error en getIDComprobante(): " + e.getMessage());
        }
        return nuevoID;
    }

    public void insertarComprobante(TComprobante comprobante) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(comprobante);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en insertarComprobante: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public void actualizarComprobante(TComprobante comprobante) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.merge(comprobante);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizarComprobante: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public void eliminar(TComprobante comprobante) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.delete(comprobante);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en eliminar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }
    
    public TComprobante buscarComprobantePorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TComprobante) session.load(TComprobante.class, id);
    }
    
    public String getIDComprobanteDet() {
        String nuevoID = "";
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query qry = session.createSQLQuery("SELECT idComprobanteDet();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        } catch (Exception e) {
            System.out.println("Error en getIDComprobante(): " + e.getMessage());
        }
        return nuevoID;
    }
    
    public void insertarComprobanteDet(TComprobantedet comprobanteDet) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(comprobanteDet);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en insertarComprobanteDet: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }
    
    public TEstadoliq getNuevoEstado(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TEstadoliq) session.createQuery("FROM TEstadoliq AS TE WHERE TE.cdEstadoLiq='EL2'").list().get(0);
    }
    
    public void insertarEstadoXLiquidacion(TEstadoxliquidacion exl){
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(exl);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en insertarEstadoXLiquidacion: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }
}
