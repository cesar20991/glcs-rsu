package emch.modelo.acceso;

import emch.modelo.entidades.TCamion;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author rick
 */
public class CamionManaged {

    public List<TCamion> buscarTodos() {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return sesion.createQuery("FROM TCamion").list();
    }

    public TCamion buscarPorId(String id) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return (TCamion) sesion.get(TCamion.class, id);
    }

    public void actualizar(TCamion camion) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            sesion.beginTransaction();
            sesion.merge(camion);
            sesion.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizar" + e.getMessage());
            sesion.beginTransaction().rollback();
        }
    }

    public void agregarCamion(TCamion nuevo) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            sesion.beginTransaction();
            sesion.save(nuevo);
            sesion.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizar" + e.getMessage());
            sesion.beginTransaction().rollback();
        }
    }
}
