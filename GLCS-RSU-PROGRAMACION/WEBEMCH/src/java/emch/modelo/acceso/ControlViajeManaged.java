package emch.modelo.acceso;

import util.HibernateUtil;
import emch.modelo.entidades.TControlviaje;
import emch.modelo.entidades.TControlviajeId;
import emch.modelo.entidades.TDespacho;
import java.util.List;
import org.hibernate.classic.Session;

/**
 *
 * @author rick
 */
public class ControlViajeManaged {

    public List<TDespacho> buscarTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("SELECT DISTINCT TD FROM TDespacho AS TD, TControlviaje AS TC WHERE TD.id.cdDespacho=TC.TDespachodet.id.cdDespacho").list();
    }

    public List<TControlviaje> buscarControlesPorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TControlviaje AS TC WHERE TC.TDespachodet.TDespacho.id.cdDespacho='" + id + "'").list();
    }

    public TControlviaje buscarPorId(TControlviajeId id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TControlviaje) session.load(TControlviaje.class, id);
    }

    public void actualizar(TControlviaje control) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.merge(control);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }
}
