/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.modelo.acceso;

import emch.modelo.entidades.TEmpresa;
import java.util.List;
import org.hibernate.classic.Session;
import util.HibernateUtil;

/**
 *
 * @author Cesar
 */
public class EmpresaManaged {
    
    public List<TEmpresa> ListarEmpresa() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("FROM TEmpresa").list();
    }
    
}
