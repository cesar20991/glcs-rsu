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
   

    public List ListarLiquidacionxCliente(TLiquidacion liquidacion) {
        List<TCliente> listaCliente = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT ab from TLiquidacion  v inner join v.TEmpresa ab where v.cdLiq ='" + liquidacion.getCdLiq() + "'");
            listaCliente = (List<TCliente>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //finally{sesion.close();}
        return listaCliente;
    }

    public List ListarLiquidacionxCliente(String liquidacion) {
        List<TCliente> listaCliente = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT ab from TLiquidacion  v inner join v.TEmpresa ab where v.cdLiq ='" + liquidacion + "'");
            listaCliente = (List<TCliente>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //finally{sesion.close();}
        return listaCliente;
    }

    
}