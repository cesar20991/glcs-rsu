package emch.modelo.acceso;

import emch.modelo.entidades.TTurno;
import java.util.List;
import org.hibernate.Session;

public class TurnoManaged {
    
    public List<String> buscarNomTurnos() {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return sesion.createQuery("Select T.nombTurno FROM TTurno T").list();
    }
    
    public TTurno buscarPorNomb(String nombTurno) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return (TTurno) sesion.load(TTurno.class, nombTurno);
    }
}