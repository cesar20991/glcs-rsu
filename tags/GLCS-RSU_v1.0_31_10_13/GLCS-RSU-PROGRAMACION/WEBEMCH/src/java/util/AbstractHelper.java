
package util;

import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

public class AbstractHelper {
    
    protected Session session;
    protected Transaction transaction;
    protected Query query;
    private String nombreTabla;
    
    public AbstractHelper() {
    }

    public void setNombreTabla(String nombreTabla) {
        this.nombreTabla = nombreTabla;
    }
    
    /**
     * Listar todos los elementos de una tabla usando List  
     */    
    public ClaseResultado obtenerLista() {        
        ClaseResultado cr = new ClaseResultado();
        try {
            List list = null;
            session = HibernateUtil.getSessionFactory().openSession();            
            list = session.createQuery("from " + nombreTabla).list();            
            cr.setList(list);            
        } catch (Exception e) {
            cr.setMsjerror("Error al listar la tabla "+nombreTabla);
            cr.setMsjexception("Error en ..." + e.getMessage());
        } 
        return cr;
    }
    
    /**
     * Listar todos los elementos de una tabla por fechas  
     */    
    public ClaseResultado obtenerListaxFechas(Date fechainicio,Date fechafin ) {        
        ClaseResultado cr = new ClaseResultado();
        try {
            List list = null;
            session = HibernateUtil.getSessionFactory().openSession();            
            list = session.createQuery("from " + nombreTabla + " between " + fechainicio + " and " + fechafin).list();            
            cr.setList(list);             
        } catch (Exception e) {
            cr.setMsjerror("Error al listar la tabla "+nombreTabla);
            cr.setMsjexception("Error en ..." + e.getMessage());
        } 
        return cr;
    }
}
