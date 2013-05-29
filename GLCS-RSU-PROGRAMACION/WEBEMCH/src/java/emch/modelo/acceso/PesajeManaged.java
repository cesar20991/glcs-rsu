package emch.modelo.acceso;

import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TPesaje;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import util.HibernateUtil;

public class PesajeManaged {

    Session sesion;
    Transaction trans;
    Query qry;

    public List listarPesaje(TLiquidacion selectedLiquidacion) {
        List<TPesaje> listaPes = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("FROM TPesaje where cdLiq="+selectedLiquidacion.getCdLiq());
            listaPes = (List<TPesaje>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
        }*/
        return listaPes;
    }


   

}
