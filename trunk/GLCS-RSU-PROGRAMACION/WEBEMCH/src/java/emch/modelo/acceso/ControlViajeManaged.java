package emch.modelo.acceso;

import util.HibernateUtil;
import emch.modelo.entidades.TControlviaje;
import emch.modelo.entidades.TControlviajeId;
import emch.modelo.entidades.TDespacho;
import emch.modelo.entidades.TDespachodet;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.classic.Session;

/**
 *
 * @author rick
 */
public class ControlViajeManaged {

    public List<TDespacho> buscarTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("SELECT DISTINCT TD FROM TDespacho AS TD, TControlviaje AS TC WHERE TD.id.cdDespacho=TC.TDespachodet.id.cdDespacho ORDER BY TD.nroDespacho ASC").list();
    }

    public List<TDespacho> buscarFaltantes() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("SELECT DISTINCT TDD.TDespacho FROM TDespachodet AS TDD WHERE (TDD.id.nro,TDD.id.cdDespacho,TDD.id.cdRuc) NOT IN(SELECT TC.TDespachodet.id.nro,TC.TDespachodet.id.cdDespacho,TC.TDespachodet.id.cdRuc FROM TControlviaje AS TC) ORDER BY TDD.TDespacho.id.cdDespacho ASC").list();
    }

    public List<TDespachodet> buscarDespachosDet(String cdDespacho) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("SELECT TDD FROM TDespachodet AS TDD WHERE (TDD.id.nro,TDD.id.cdDespacho,TDD.id.cdRuc) NOT IN(SELECT TC.TDespachodet.id.nro,TC.TDespachodet.id.cdDespacho,TC.TDespachodet.id.cdRuc FROM TControlviaje AS TC)  AND TDD.TDespacho.id.cdDespacho='" + cdDespacho + "' ORDER BY TDD.TDespacho.id.cdDespacho ASC").list();
    }

    public void insertar(TDespachodet tDespachodet) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            for (int i = 1; i <= 2; i++) {
                String nuevoID = getIDControl();
                TControlviajeId id = new TControlviajeId();
                id.setCdControlViaje(nuevoID);
                id.setNroViaje(i);
                TControlviaje nuevo = new TControlviaje();
                nuevo.setId(id);
                nuevo.setTDespachodet(tDespachodet);
                nuevo.setFechaEmi(tDespachodet.getTDespacho().getFechaEmi());
                nuevo.setHoraEstimada("");
                nuevo.setHoraReal("");
                nuevo.setObs("");
                session.save(nuevo);
            }
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en insertar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public String getIDControl() {
        String nuevoID = "";
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            Query qry = session.createSQLQuery("select idControlviaje();");
            ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
            nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        } catch (Exception e) {
            System.out.println("Error en getIDCamion(): " + e.getMessage());
        }
        return nuevoID;
    }

    public List<TControlviaje> buscarControlesPorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TControlviaje AS TC WHERE TC.TDespachodet.TDespacho.id.cdDespacho='" + id + "'").list();
    }

    public TControlviaje buscarPorId(TControlviajeId id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TControlviaje) session.load(TControlviaje.class, id);
    }

    public void actualizar(TControlviaje control) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.merge(control);
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en actualizar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }

    public void eliminar(TControlviaje control) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.delete("FROM TControlviaje AS TC WHERE TC.TDespachodet.id.nro=" + control.getTDespachodet().getId().getNro() + " AND TC.TDespachodet.id.cdDespacho='" + control.getTDespachodet().getId().getCdDespacho() + "' AND TC.TDespachodet.id.cdRuc='" + control.getTDespachodet().getId().getCdRuc() + "'");
            session.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en eliminar: " + e.getMessage());
            session.beginTransaction().rollback();
        }
    }
}
