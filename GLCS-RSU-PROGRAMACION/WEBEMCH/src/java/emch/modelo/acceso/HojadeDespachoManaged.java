package emch.modelo.acceso;

import util.HibernateUtil;
import emch.modelo.entidades.*;
import emch.modelo.entidades.TDespachoId;
import emch.modelo.entidades.TTurno;
import emch.modelo.entidades.TUbigeo;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author 
 */

public class HojadeDespachoManaged {

    Session sesion;
    Transaction trans;
    Query qry;

    public List<TDespacho> buscarTodos() {
        List<TDespacho> listadespacho = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        trans = sesion.beginTransaction();
        qry = sesion.createQuery("FROM TDespacho");
        listadespacho = (List<TDespacho>) qry.list();
        return listadespacho;
    }

    public TDespacho buscarPorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TDespacho) session.load(TDespacho.class, id);
    }

    public boolean actualizar(TDespacho despacho) {
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            sesion.beginTransaction();
            sesion.merge(despacho);
            sesion.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizar" + e.getMessage());
            sesion.beginTransaction().rollback();
        }
        return true;
    }

    public boolean insertar(TDespacho despacho, List<TTrabajadorxcamion> trabajadorxcamion) {
        sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            sesion.beginTransaction();
            trans = sesion.beginTransaction();
            String idcl = obtenerIDDespacho();
            if (idcl.equals("")) {
                return false;
            }
            Date hoy = new Date();
            TDespachoId despID = new TDespachoId();
            despID.setCdDespacho(idcl);
            despID.setCdRuc("RC0001");
            despacho.setUsuCrea("coropeza");
            despacho.setFechaReg(despacho.getFechaEmi());
            despacho.setId(despID);
            sesion.save(despacho);
            ingresarDespachoDet(despacho, trabajadorxcamion);
            trans.commit();
        } catch (Exception e) {
            System.out.println("Error en insertar" + e.getMessage());
            trans.rollback();
            return false;
        }
        return true;
    }

    public void ingresarDespachoDet(TDespacho despacho, List<TTrabajadorxcamion> trabajadorxcamion) {
        try {
            int a = 1;
            for (TTrabajadorxcamion tp : trabajadorxcamion) {
                TDespachodetId id = new TDespachodetId();
                id.setCdDespacho(despacho.getId().getCdDespacho());
                id.setNro(a);
                id.setCdRuc("RC0001");
                TDespachodet dtodet = new TDespachodet();
                dtodet.setId(id);
                dtodet.setCantViaje(2);
                dtodet.setTDespacho(despacho);
                dtodet.setTTrabajadorxcamion(tp);
                sesion.save(dtodet);
                a++;
            }
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }

    public List listarUbigeo() {
        List<TUbigeo> listaubigeo = null;
        /* try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        trans = sesion.beginTransaction();
        qry = sesion.createQuery("FROM TUbigeo");
        listaubigeo = (List<TUbigeo>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaubigeo;
    }

    public List listarturno() {
        List<TTurno> listaturno = null;
        /* try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        trans = sesion.beginTransaction();
        qry = sesion.createQuery("FROM TTurno");
        listaturno = (List<TTurno>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaturno;
    }

    private String obtenerIDDespacho() {
        String nuevoID = "";
        /* try {*/
        qry = sesion.createSQLQuery("select idDespacho();");
        ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
        nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        /* } catch (Exception ex) {
         nuevoID = "";
         }*/
        return nuevoID;
    }

    public List ListarDespachoxDespachoDet(TDespacho despacho) {
        List<TDespachodet> listadespachoDet = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT ab from TDespacho  v inner join v.TDespachodets ab where v.id.cdDespacho ='" + despacho.getId().getCdDespacho() + "'");
            listadespachoDet = (List<TDespachodet>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //finally{sesion.close();}
        return listadespachoDet;
    }

    public List ListarDespachoxDespachoDet(String despacho) {
        List<TDespachodet> listadespachoDet = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT ab from TDespacho  v inner join v.TDespachodets ab where v.id.cdDespacho ='" + despacho + "'");
            listadespachoDet = (List<TDespachodet>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //finally{sesion.close();}
        return listadespachoDet;
    }

    public List buscaTrabxCamion(String despacho) {
        List<TTrabajadorxcamion> listatrabxc = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            qry = sesion.createQuery("SELECT ab  from TDespachodet v inner join v.TTrabajadorxcamion  ab where v.id.cdDespacho='" + despacho + "'");
            listatrabxc = (List<TTrabajadorxcamion>) qry.list();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return listatrabxc;
    }

}