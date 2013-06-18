package emch.modelo.acceso;

import emch.modelo.entidades.TLiquidacion;
import java.util.List;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author rick
 */
public class LiquidacionesManaged {

    public List<TLiquidacion> buscarTodos(String ruc) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TLiquidacion AS TL WHERE TL.TEmpresa.rucE='" + ruc + "'").list();
    }
}
