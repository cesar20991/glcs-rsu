package emch.modelo.acceso;

import emch.modelo.entidades.TTipotrabajador;
import emch.modelo.entidades.TTrabajador;
import emch.modelo.entidades.TUbigeo;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

public class TrabajadorManaged {

    Session sesion;
    Transaction trans;
    Query qry;

    public boolean ingresarTrabajador(TTrabajador trabajador) {
       /* try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            String idcl = obtenerIDTrabajador();
            if (idcl.equals("")) {
                return false;
            }
            trabajador.setCdTrabajador(idcl);
            sesion.save(trabajador);
            trans.commit();
        /*} catch (Exception ex) {
            //despues agrego para que salgan mensajes de error            
            trans.rollback();
            ex.printStackTrace();
            return false;
        /*} finally {
            sesion.close();
        }*/
        return true;
    }

    public void actualizar(TTrabajador trabajador) {
        sesion = HibernateUtil.getSessionFactory().openSession();
       /* try {*/
            sesion.beginTransaction();
            sesion.merge(trabajador);
            TUbigeo ubi = new TUbigeo();
            actualizarUbigeo(ubi);
            TTipotrabajador tip = new TTipotrabajador();
            actualizarTipo(tip);
            sesion.beginTransaction().commit();
       /* } catch (Exception e) {
            System.out.println("Error en actualizar" + e.getMessage());
            sesion.beginTransaction().rollback();
        }*/
    }

    public void actualizarUbigeo(TUbigeo ubigeo) {
        sesion = HibernateUtil.getSessionFactory().openSession();
       /* try {*/
            sesion.beginTransaction();
            sesion.merge(ubigeo);
            sesion.beginTransaction().commit();
      /*  } catch (Exception e) {
            System.out.println("Error en actualizar" + e.getMessage());
            sesion.beginTransaction().rollback();
        }*/
    }

    public void actualizarTipo(TTipotrabajador tipo) {
        sesion = HibernateUtil.getSessionFactory().openSession();
        /*try {*/
            sesion.beginTransaction();
            sesion.merge(tipo);
            sesion.beginTransaction().commit();
        /*} catch (Exception e) {
            System.out.println("Error en actualizar" + e.getMessage());
            sesion.beginTransaction().rollback();
        }*/
    }

    private String obtenerIDTrabajador() {
        String nuevoID = "";
       /* try {*/
            qry = sesion.createSQLQuery("select idtrabajador();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
      /* } catch (Exception ex) {
            nuevoID = "";
        }*/
        return nuevoID;
    }

    public TTrabajador buscarPorId(String id) {
        sesion = HibernateUtil.getSessionFactory().openSession();
        return (TTrabajador) sesion.load(TTrabajador.class, id);
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

    public List listarTipoTrabajador() {
        List<TTipotrabajador> listatipo = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("FROM TTipotrabajador");
            listatipo = (List<TTipotrabajador>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
        }*/
        return listatipo;
    }

    public List obtenerTrabajadorTodos() {
        List<TTrabajador> listatrabajador = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("FROM TTrabajador");
            listatrabajador = (List<TTrabajador>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
       }*/
        return listatrabajador;
    }
}
