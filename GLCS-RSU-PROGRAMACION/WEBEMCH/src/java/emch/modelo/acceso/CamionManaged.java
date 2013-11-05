package emch.modelo.acceso;

import util.HibernateUtil;
import emch.modelo.entidades.TCamion;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author rick
 */
public class CamionManaged {

    public void insertar(TCamion camion) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            String nuevoID = getIDCamion();
            camion.setCdCamion(nuevoID);
            camion.setEstado(true);
            camion.setUnidad((int) (Math.random()*1000));
            session.save(camion);
            session.beginTransaction().commit();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Se  agrego Camión correctamente", "Verificar"));
        } catch (Exception e) {
            System.out.println("Error en insertar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public String getIDCamion() {
        String nuevoID = "";
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query qry = session.createSQLQuery("select idCamion();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        } catch (Exception e) {
            System.out.println("Error en getIDCamion(): " + e.getMessage());
        }
        return nuevoID;
    }

    public void actualizar(TCamion camion) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.merge(camion);
            session.beginTransaction().commit();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Se  Actualizó Camión correctamente", "Verificar")); 
        } catch (Exception e) {
            System.out.println("Error en actualizar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public void eliminar(TCamion camion) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.delete(camion);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en eliminar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public TCamion buscarPorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TCamion) session.load(TCamion.class, id);
    }

    public List<TCamion> buscarTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TCamion").list();
    }
}
