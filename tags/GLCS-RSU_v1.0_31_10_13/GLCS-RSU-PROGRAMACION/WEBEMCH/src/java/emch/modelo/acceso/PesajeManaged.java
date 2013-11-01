package emch.modelo.acceso;

import emch.modelo.entidades.TControlviaje;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TPesaje;
import emch.modelo.entidades.TComprobante;
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
        qry = sesion.createQuery("SELECT a FROM TPesaje a where a.TLiquidacion.cdLiq='" + selectedLiquidacion.getCdLiq() + "'");
        listaPes = (List<TPesaje>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaPes;
    }

    public List listarPesajes() {
        List<TPesaje> listaPes = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        qry = sesion.createQuery("SELECT a FROM TPesaje a");
        listaPes = (List<TPesaje>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaPes;
    }

    public List listarControlViaje() {
        List<TControlviaje> listaPes = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        qry = sesion.createQuery("SELECT cv FROM TControlviaje cv");
        listaPes = (List<TControlviaje>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaPes;
    }

    public boolean ingresarPesaje(TPesaje pesaje, TControlviaje selectedcv, String usuario) {
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            String idcl = obtenerIDPesaje();
            if (idcl.equals("")) {
                return false;
            }
            pesaje.setCdPesaje(idcl);      
            pesaje.setTControlviaje(selectedcv);
            pesaje.setEstadoPesaje("PP");
            pesaje.setFechaReg(pesaje.getFechaPesaje());             
            pesaje.setUsuCrea(usuario);
            sesion.save(pesaje);            
            //sesion.flush();
            trans.commit();
        } catch (Exception ex) {
            //despues agrego para que salgan mensajes de error            
            trans.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            sesion.close();
        }
        return true;
    }

    public boolean actualizarPesaje(TPesaje pesaje, TControlviaje selectedcv, String usuario) {
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            sesion.beginTransaction();
            sesion.merge(pesaje);
            sesion.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizar" + e.getMessage());
            sesion.beginTransaction().rollback();
            return false;
        } finally {
            sesion.close();
        }
        return true;
    }

    private String obtenerIDPesaje() {
        String nuevoID = "";
        /* try {*/
        qry = sesion.createSQLQuery("select idPesaje();");
        ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
        nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        /* } catch (Exception ex) {
         nuevoID = "";
         }*/
        return nuevoID;
    }
    
/*VER PESAJES SEGUN COMPROBANTE---------*/  
    public List listarPesajePorCliente(TComprobante selectedComprobante) {
        List<TPesaje> listaPes = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("SELECT a FROM TPesaje a where a.TLiquidacion.cdLiq='"+ selectedComprobante.getTLiquidacion().getCdLiq() +"'");
            listaPes = (List<TPesaje>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
        }*/
        return listaPes;
    }    
}
