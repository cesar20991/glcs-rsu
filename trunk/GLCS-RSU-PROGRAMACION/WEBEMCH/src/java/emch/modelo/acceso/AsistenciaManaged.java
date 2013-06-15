package emch.modelo.acceso;

import emch.modelo.entidades.TAsistencia;
import emch.modelo.entidades.TAsistenciaxtrabajador;
import emch.modelo.entidades.TTrabajador;
import util.HibernateUtil;
import emch.modelo.entidades.TTrabajadorxcamion;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author Mario
 */
public class AsistenciaManaged {

    public List<TTrabajador> todosTrabajador() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TTrabajador").list();
    }

    public List<TAsistencia> todasAsistencias() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TAsistencia").list();
    }

    public List<TTrabajador> todosTrabajadoresSinAsistencia(String cdAsistencia) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("SELECT T FROM TTrabajador AS T WHERE (T.cdTrabajador) "
                + "NOT IN(SELECT Taxt.TTrabajador.cdTrabajador FROM TAsistenciaxtrabajador AS Taxt WHERE Taxt.TAsistencia.cdAsistencia = '" + cdAsistencia + "')").list();
    }

    public TAsistenciaxtrabajador AsistenciaxTrabajador(TAsistencia ta, TTrabajador tt) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            Criteria criteria = session.createCriteria(TAsistenciaxtrabajador.class)
                    .add(Restrictions.eq("TAsistencia", ta))
                    .add(Restrictions.eq("TTrabajador", tt));
            TAsistenciaxtrabajador taxt = (TAsistenciaxtrabajador) criteria.uniqueResult();
            return taxt;
            
        } finally {
            session.close();
        }
    }

    public boolean ExisteIdAsistencia(String cdAsistencia) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int i = session.createQuery("FROM TAsistencia AS Ta WHERE Ta.cdAsistencia = '" + cdAsistencia + "' ").list().size();
        return i != 0 ? true : false;
    }

    public List<TTrabajadorxcamion> buscarTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TTrabajadorxcamion").list();
    }

    public TTrabajadorxcamion buscarPorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TTrabajadorxcamion) session.load(TTrabajadorxcamion.class, id);
    }

    public List<TAsistenciaxtrabajador> buscarXTrabajador(String CdTrabajador) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TAsistenciaxtrabajador as taxt WHERE taxt.TTrabajador.cdTrabajador = '" + CdTrabajador + "' "
                + "                 and taxt.asiste = 'false' and taxt.fustifica = 'false'").list();
    }

    public void insertarAsistencia(TAsistencia tAsistencia) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(tAsistencia);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("------------------------------------------------------------------------------------------------");
            System.out.println("|ERROR EN INSERTAR: " + e.getMessage().toUpperCase() + "|\n |" + e.getLocalizedMessage().toUpperCase() + "|");
            System.out.println("------------------------------------------------------------------------------------------------");
            session.beginTransaction().rollback();
        }
    }

    public void insertarAsistenciaxTrabajador(TAsistenciaxtrabajador tAsistenciaxtrabajador) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(tAsistenciaxtrabajador);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("------------------------------------------------------------------------------------------------");
            System.out.println("|ERROR EN INSERTAR: " + e.getMessage().toUpperCase() + "|\n |" + e.getLocalizedMessage().toUpperCase() + "|");
            System.out.println("------------------------------------------------------------------------------------------------");
            session.beginTransaction().rollback();
        }
    }

}
