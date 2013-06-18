package emch.modelo.acceso;

import emch.modelo.entidades.TComprobante;
import emch.modelo.entidades.TComprobantedet;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TMoneda;
import emch.modelo.entidades.TServicio;
import emch.modelo.entidades.TTipodoc;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author rick
 */
public class ComprobantesManaged {

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

    public List<TMoneda> buscarMonedasTodas() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TMoneda").list();
    }

    public List<TTipodoc> buscarTiposDocTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TTipodoc").list();
    }

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
}
