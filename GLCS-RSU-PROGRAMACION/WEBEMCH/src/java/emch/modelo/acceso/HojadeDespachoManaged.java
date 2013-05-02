package emch.modelo.acceso;

import emch.modelo.entidades.TDespacho;
import emch.modelo.entidades.TDespachoId;
import emch.modelo.entidades.TTurno;
import emch.modelo.entidades.TUbigeo;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

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

    public boolean insertar(TDespacho despacho) {
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
             despID.setRucE("20131368071");
             despacho.setUsuCrea("coropeza");
             despacho.setFechaReg(despacho.getFechaEmi());
             despacho.setId(despID);
            sesion.save(despacho);
            trans.commit();
        } catch (Exception e) {
            System.out.println("Error en insertar" + e.getMessage());           
            trans.rollback();
            return false;
        }
        return true;
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
}