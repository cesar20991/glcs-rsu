package emch.modelo.acceso;

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
    
    public List<TTrabajadorxcamion> buscarxTurno(String Turno) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("from TTrabajadorxcamion as ttxc where ttxc.TTurno.cdTurno = '"+Turno+"'").list();
    }

}