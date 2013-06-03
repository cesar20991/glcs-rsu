package emch.modelo.acceso;

import emch.modelo.entidades.TAsistencia;
import emch.modelo.entidades.TAsistenciaxtrabajador;
import util.HibernateUtil;
import emch.modelo.entidades.TTrabajadorxcamion;
import java.util.List;
import org.hibernate.Session;
/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author Mario
 */
public class AsistenciaManaged {
    
    public List<TTrabajadorxcamion> buscarTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TTrabajadorxcamion").list();
    }
    
    public TTrabajadorxcamion buscarPorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TTrabajadorxcamion) session.load(TTrabajadorxcamion.class, id);
    }
    
    public void insertarAsistencia(TAsistencia tAsistencia) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(tAsistencia);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("------------------------------------------------------------------------------------------------");
            System.out.println("|ERROR EN INSERTAR: " + e.getMessage().toUpperCase() +"|\n |"+ e.getLocalizedMessage().toUpperCase() +"|");
            System.out.println("------------------------------------------------------------------------------------------------");
            session.beginTransaction().rollback();
        }
    }
    
    public void insertarAsistencia(TAsistenciaxtrabajador tAsistenciaxtrabajador) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(tAsistenciaxtrabajador);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("------------------------------------------------------------------------------------------------");
            System.out.println("|ERROR EN INSERTAR: " + e.getMessage().toUpperCase() +"|\n |"+ e.getLocalizedMessage().toUpperCase() +"|");
            System.out.println("------------------------------------------------------------------------------------------------");
            session.beginTransaction().rollback();
        }
    }

}