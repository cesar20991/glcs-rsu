package emch.modelo.acceso;

import emch.modelo.entidades.TDespacho;
import java.util.List;
import org.hibernate.Session;

public class HojadeDespachoManaged {

    public List<TDespacho> buscarTodos() {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return sesion.createQuery("FROM TDespacho").list();
    }

    public TDespacho buscarPorId(String id) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return (TDespacho) sesion.load(TDespacho.class, id);
    }

    public boolean actualizar(TDespacho despacho) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
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
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        try {
            sesion.beginTransaction();
            sesion.save(despacho);
            sesion.beginTransaction().commit();
        } catch (Exception e) {
            System.out.println("Error en insertar" + e.getMessage());
            sesion.beginTransaction().rollback();
            return false;
        }
        return true;
    }
}