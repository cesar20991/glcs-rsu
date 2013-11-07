package emch.modelo.acceso;

import util.HibernateUtil;
import emch.modelo.entidades.*;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author 
 */

public class LiquidacionClienteManaged {

    Session sesion;
    Transaction trans;
    Query qry;

    public List<TLiquidacion> buscarTodos() {
        List<TLiquidacion> listaliquidacion = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        trans = sesion.beginTransaction();
        qry = sesion.createQuery("FROM TLiquidacion");
        listaliquidacion = (List<TLiquidacion>) qry.list();
        return listaliquidacion;
    }
   

    public List ListarLiquidacionxCliente(TLiquidacion liquidacion,TEmpresa ruc) {
        List<TCliente> listaCliente = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT ab from TLiquidacion  v inner join v.TEmpresa ab inner join ab.TCliente c where v.cdRuc ='" + liquidacion.getCdLiq()+ "' and ab.cdRuc='"+ ruc.getCdRuc()+"'");
            listaCliente = (List<TCliente>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //finally{sesion.close();}
        return listaCliente;
    }

    public List ListarLiquidacionxCliente(String liquidacion,String ruc) {
        List<TCliente> listaCliente = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT ab from TLiquidacion  v inner join v.TEmpresa ab inner join ab.TCliente c where v.cdLiq ='" + liquidacion + "'and ab.cdRuc='"+ ruc+"'");
            listaCliente = (List<TCliente>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //finally{sesion.close();}
        return listaCliente;
    }

    
}