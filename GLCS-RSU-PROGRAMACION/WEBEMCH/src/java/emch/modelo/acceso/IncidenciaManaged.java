package emch.modelo.acceso;

import emch.modelo.entidades.TControlviaje;
import emch.modelo.entidades.TLiquidacion;
import emch.modelo.entidades.TPesaje;
import emch.modelo.entidades.TComprobante;
import emch.modelo.entidades.TIncidencia;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import util.HibernateUtil;

public class IncidenciaManaged {

    Session sesion;
    Transaction trans;
    Query qry;

    public List listarControl() {
        List<TControlviaje> listaCon = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        trans = sesion.beginTransaction();
        qry = sesion.createQuery("FROM TControlviaje");
        listaCon = (List<TControlviaje>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaCon;
    }
    
    public List listarControlPorIncidencia(TControlviaje selectedControl) {
        List<TControlviaje> listaCon = null;
        /*  try {*/
        sesion = HibernateUtil.getSessionFactory().openSession();
        trans = sesion.beginTransaction();
        qry = sesion.createQuery("SELECT b FROM TIncidencia b where b.TControlviaje.id.cdControlViaje = '" + selectedControl.getId().getCdControlViaje() + "'");
        listaCon = (List<TControlviaje>) qry.list();
        /* } catch (Exception ex) {
         ex.printStackTrace();
         } finally {
         sesion.close();
         }*/
        return listaCon;
    }
    

    public boolean ingresarIncidencia(TIncidencia incidencia) {
       try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            String idcl = obtenerIDIncidencia();
            if (idcl.equals("")) {
                return false;
            }
            incidencia.setCdInc(idcl);
            sesion.save(incidencia);
            trans.commit();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Se  agrego Incidencia correctamente", "Verificar"));            
        } catch (Exception ex) {
            //despues agrego para que salgan mensajes de error
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error al agregar Incidencia correctamente", "Verificar"));            
            trans.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            sesion.close();
        }
        return true;
    }
    
    private String obtenerIDIncidencia() {
        String nuevoID = "";
       /* try {*/
            qry = sesion.createSQLQuery("select idIncidencia();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
      /* } catch (Exception ex) {
            nuevoID = "";
        }*/
        return nuevoID;
    }
    
}
