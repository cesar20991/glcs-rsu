/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.modelo.acceso;

import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TUbigeo;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import util.HibernateUtil;

/**
 *
 * @author Cesar
 */
public class EmpresaManaged {
    
     Session sesion;
    Transaction trans;
    Query qry;

    public boolean ingresarEmpresa(TEmpresa empresa) {
       try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            String idcl = obtenerIDEmpresa();
            if (idcl.equals("")) {
                return false;
            }
            empresa.setCdRuc(idcl);
            sesion.save(empresa);
            trans.commit();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Se  agrego Empresa correctamente", "Verificar"));            
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

    public boolean actualizarEmpresa(TEmpresa empresa) {
            sesion = HibernateUtil.getSessionFactory().openSession();
            try {
                 sesion.beginTransaction();
                 sesion.merge(empresa);
                 sesion.beginTransaction().commit();
                 FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Se  Actualizó Empresa correctamente", "Verificar"));            
            } catch (Exception e) {
                
                 System.out.println("Error en actualizar" + e.getMessage());
                 sesion.beginTransaction().rollback();
                 return false;
             }
            finally {
                 sesion.close();
             }
            return true;
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
    
    private String obtenerIDEmpresa() {
        String nuevoID = "";
       /* try {*/
            qry = sesion.createSQLQuery("select idRuc();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
      /* } catch (Exception ex) {
            nuevoID = "";
        }*/
        return nuevoID;
    }

    public TEmpresa buscarPorId(String id) {
        sesion = HibernateUtil.getSessionFactory().openSession();
        return (TEmpresa) sesion.load(TEmpresa.class, id);
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
    
    public List obtenerEmpresaTodos() {
        List<TEmpresa> listaempresa = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("FROM TEmpresa");
            listaempresa = (List<TEmpresa>) qry.list();
       /* } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            sesion.close();
       }*/
        return listaempresa;
    }
   /* public void insertar(TEmpresa empresa) {
        org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            String nuevoID = getIDEmpresa();
            empresa.setCdRuc(nuevoID);
            session.save(empresa);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en insertar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public String getIDEmpresa() {
        String nuevoID = "";
        try {
            org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
            Query qry = session.createSQLQuery("select idRuc();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        } catch (Exception e) {
            System.out.println("Error en getIDEmpresa(): " + e.getMessage());
        }
        return nuevoID;
    }

    public void actualizar(TEmpresa empresa) {
        org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.merge(empresa);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public void eliminar(TEmpresa empresa) {
        org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.delete(empresa);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en eliminar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public TEmpresa buscarPorId(String id) {
        org.hibernate.Session session = HibernateUtil.getSessionFactory().openSession();
        return (TEmpresa) session.load(TEmpresa.class, id);
    }
    
    */
    public List<TEmpresa> ListarEmpresa() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TEmpresa").list();
    }
}
