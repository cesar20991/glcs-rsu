package emch.modelo.acceso;

import emch.modelo.entidades.TCamion;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author rick
 */
public class CamionManaged {

    public void insertar(TCamion camion) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            camion.setEstado(true);
            session.save(camion);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en insertar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public void actualizar(TCamion camion) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.merge(camion);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public void eliminar(TCamion camion) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.delete(camion);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en eliminar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public TCamion buscarPorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TCamion) session.load(TCamion.class, id);
    }

    public List<TCamion> buscarTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TCamion").list();
    }
}
