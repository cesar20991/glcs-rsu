
package emch.modelo.acceso;

import emch.modelo.entidades.*;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import util.HibernateUtil;

public class TrabajadorxCamionManaged {
    
    Session sesion;
    Transaction trans;
    Query qry;
    
    public List listarTrabajadorXCamion() {
        List<TTrabajadorxcamion> listatipo = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("FROM TTrabajadorxcamion");
            listatipo = (List<TTrabajadorxcamion>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
        }*/
        return listatipo;
    }
}
