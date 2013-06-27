/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package emch.modelo.acceso;

import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

/**
 *
 * @author Cesar
 */
public class ReporteManaged {
    
     Session sesion;
    Transaction trans;
    Query qry;
    
    public double obtenerTNxMes(String mes) {
        String nuevoID = "";
        /* try {*/
        qry = sesion.createSQLQuery("select idTNPesajexMes( "+mes+" );");
        ArrayList<String> idNuevo = (ArrayList<String>) qry.list();
        nuevoID = idNuevo.size() > 0 ? idNuevo.get(0) : "";
        double a = Double.parseDouble(nuevoID);
        /* } catch (Exception ex) {
         nuevoID = "";
         }*/
         return a;
    }
    
}
