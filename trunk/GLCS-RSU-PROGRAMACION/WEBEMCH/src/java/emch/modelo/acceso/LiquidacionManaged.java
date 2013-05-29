package emch.modelo.acceso;

import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TTipotrabajador;
import emch.modelo.entidades.TTrabajador;
import emch.modelo.entidades.TUbigeo;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import util.HibernateUtil;

public class LiquidacionManaged {

    Session sesion;
    Transaction trans;
    Query qry;

    public List listarLiquidacion() {
        List<TLiquidacion> listaLiq = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("FROM TLiquidacion");
            listaLiq = (List<TLiquidacion>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
        }*/
        return listaLiq;
    }

}
