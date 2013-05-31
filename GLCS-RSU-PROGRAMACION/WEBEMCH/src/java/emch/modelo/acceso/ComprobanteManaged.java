package emch.modelo.acceso;

import emch.modelo.entidades.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import util.HibernateUtil;

public class ComprobanteManaged {

    Session sesion;
    Transaction trans;
    Query qry;

    public List listarComprobante(TLiquidacion selectedLiquidacion) {
        List<TComprobante> listaCom = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("SELECT a FROM TComprobante a where a.TLiquidacion.cdLiq='"+selectedLiquidacion.getCdLiq()+"'");
            listaCom = (List<TComprobante>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
        }*/
        return listaCom;
    }

}