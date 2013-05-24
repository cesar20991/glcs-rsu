package emch.modelo.acceso;

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
}
