package emch.modelo.acceso;

import emch.modelo.entidades.TTrabajador;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author rick
 */
public class TrabajadorXCamionManaged {

    public List<TTrabajador> buscarChoferes() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TTrabajador AS tt WHERE tt.TTipotrabajador.cdTipoTrabajador='TP5' AND tt.estado=true").list();
    }
}
