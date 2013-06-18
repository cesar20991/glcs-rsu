package emch.modelo.acceso;

import emch.modelo.entidades.TCliente;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TUsuario;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

public class UsuarioManagedImpl implements UsuarioManaged {

    @Override
    public TUsuario buscarPorUsuario(TUsuario usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "SELECT u FROM TUsuario u where u.nomUsu=:user and u.pass=:pass";
        Query query = session.createQuery(sql);
        query.setString("user", usuario.getNomUsu());
        query.setString("pass", usuario.getPass());
        return (TUsuario) query.uniqueResult();
    }
    
   @Override
   public TEmpresa buscarRuc(TUsuario usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "SELECT ab FROM TCliente c  inner join c.TEmpresa ab where c.TUsuario.nomUsu=:nonUsu";
        Query query = session.createQuery(sql);
        query.setString("nonUsu", usuario.getNomUsu());
        return (TEmpresa) query.uniqueResult();
    }

    @Override
    public TEmpresa ListarEmpresa() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "FROM TEmpresa";
        Query query = session.createQuery(sql);
        return (TEmpresa) query.list();
    }

    @Override
    public TEmpresa BuscarPorEmpresa(TEmpresa empresa) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "SELECT u FROM TEmpresa u where u.cdRuc=:cdruc";
        Query query = session.createQuery(sql);
        query.setString("cdruc", empresa.getCdRuc());
        return (TEmpresa) query.uniqueResult();
    }
}
