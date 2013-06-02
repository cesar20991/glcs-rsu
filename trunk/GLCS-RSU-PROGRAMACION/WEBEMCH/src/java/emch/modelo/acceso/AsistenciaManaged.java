package emch.modelo.acceso;

import emch.modelo.entidades.TTrabajadorxcamion;
import java.util.Iterator;
import java.util.List;
import org.hibernate.classic.Session;
import util.HibernateUtil;

public class AsistenciaManaged {

    public List<TTrabajadorxcamion> buscarxTurno(String turno) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createQuery("select txc.TCamion.cdCamion,txc.TTrabajador.cdTrabajador,"
                + "txc.TTrabajador.nombres,txc.TTrabajador.apellidos "
                + "From TTrabajadorxcamion as txc where txc.TTurno.cdTurno='"+turno+"'").list();
    }

    public void prueba() {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<TTrabajadorxcamion> list = session.createQuery("select txc.TCamion.cdCamion,txc.TTrabajador.cdTrabajador,"
                + "txc.TTrabajador.nombres,txc.TTrabajador.apellidos "
                + "From TTrabajadorxcamion as txc where txc.TTurno.cdTurno='TN02'").list();
            
            Iterator it = list.iterator();
            if (!it.hasNext()) {
                System.out.println("No any data!");
            } else {
                while (it.hasNext()) {
                    Object[] row = (Object[]) it.next();
                    for (int i = 0; i < row.length; i++) {
                        System.out.print(i+"-" +row[i]);
                        System.out.println();
                    }
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}
