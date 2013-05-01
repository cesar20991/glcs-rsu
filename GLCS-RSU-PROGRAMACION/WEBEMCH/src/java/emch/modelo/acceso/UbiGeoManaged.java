package emch.modelo.acceso;

import emch.modelo.entidades.TUbigeo;
import java.util.List;
import org.hibernate.Session;

public class UbiGeoManaged {

    public List<String> buscarNomUbigeo() {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return sesion.createQuery("Select T.nombre FROM TUbigeo T").list();
    }

    public TUbigeo buscarPorNomb(String nombTurno) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        return (TUbigeo) sesion.load(TUbigeo.class, nombTurno);
    }
}