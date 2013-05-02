package emch.modelo.acceso;

import emch.modelo.entidades.TDespacho;
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