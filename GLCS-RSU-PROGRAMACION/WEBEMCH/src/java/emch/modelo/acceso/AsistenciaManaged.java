package emch.modelo.acceso;

import java.util.List;
import org.hibernate.classic.Session;
import util.ConsultaTrabajadoresXTurno;
import util.HibernateUtil;

public class AsistenciaManaged {
    
    public List<ConsultaTrabajadoresXTurno> buscarxTurno(String turno) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return session.createSQLQuery("SELECT ttxc.cdCamion, ttxc.cdTrabajador, tt.nombres, tt.apellidos \n" +
                                    "FROM T_TrabajadorXCamion as ttxc \n" +
                                    "INNER JOIN T_Trabajador as tt ON \n" +
                                    "ttxc.cdTrabajador = tt.cdTrabajador \n" +
                                    "WHERE ttxc.cdTurno='"+turno+"'").list();
    }

}