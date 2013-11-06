package emch.modelo.acceso;

import util.HibernateUtil;
import emch.modelo.entidades.*;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class ClienteManaged {

   Session sesion;
    Transaction trans;
    Query qry;

    
    public List<TCliente> buscarTodos() {
            List<TCliente> listacliente = null;
      /*  try {*/
            sesion = HibernateUtil.getSessionFactory().openSession();
            trans = sesion.beginTransaction();
            qry = sesion.createQuery("FROM TCliente");
            listacliente = (List<TCliente>) qry.list();
            return listacliente;
    }

    
}