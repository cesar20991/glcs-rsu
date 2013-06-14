/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.modelo.acceso;

import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TEmpresa;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.classic.Session;
import util.HibernateUtil;

/**
 *
 * @author Cesar
 */
public class EmpresaManaged {
    
    public void insertar(TEmpresa empresa) {
        org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            String nuevoID = getIDEmpresa();
            empresa.setCdRuc(nuevoID);
            session.save(empresa);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en insertar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public String getIDEmpresa() {
        String nuevoID = "";
        try {
            org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
            Query qry = session.createSQLQuery("select idRuc();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        } catch (Exception e) {
            System.out.println("Error en getIDEmpresa(): " + e.getMessage());
        }
        return nuevoID;
    }

    public void actualizar(TEmpresa empresa) {
        org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.merge(empresa);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public void eliminar(TEmpresa empresa) {
        org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.delete(empresa);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en eliminar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public TEmpresa buscarPorId(String id) {
        org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
        return (TEmpresa) session.load(TEmpresa.class, id);
    }
    
    public List<TEmpresa> ListarEmpresa() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TEmpresa").list();
    }
    
}
