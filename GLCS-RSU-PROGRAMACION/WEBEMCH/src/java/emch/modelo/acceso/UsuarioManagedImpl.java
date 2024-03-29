package emch.modelo.acceso;

import emch.modelo.entidades.TAccesoe;
import emch.modelo.entidades.TAccesom;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TPerfil;
import emch.modelo.entidades.TUsuario;
import java.util.ArrayList;
import java.util.List;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class UsuarioManagedImpl implements UsuarioManaged {

    @Override
    public TUsuario buscarPorUsuario(TUsuario usuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "SELECT u FROM TUsuario u where u.nomUsu=:user and u.pass=:pass AND u.estado=1";
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

    @Override
    public List<TUsuario> ListarUsuarioTodos() {
        List<TUsuario> lista = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "FROM TUsuario";
        Query query = session.createQuery(sql);
        lista = query.list();
        return lista;
    }

    @Override
    public TUsuario buscarPorId(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        return (TUsuario) session.load(TUsuario.class, id);
    }

    @Override
    public List ListarPerfilTodos() {
        List<TPerfil> lista = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        String sql = "FROM TPerfil";
        Query query = session.createQuery(sql);
        lista = (List<TPerfil>) query.list();
        return lista;
    }
    Transaction trans;
    Session session;

    @Override
    public boolean ingresarUsuario(TUsuario usuario) {
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            trans = session.beginTransaction();
            session.save(usuario);
            trans.commit();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Se  agrego Usuario " + usuario.getNomUsu() + " correctamente", "Verificar"));
        } catch (Exception ex) {
            //despues agrego para que salgan mensajes de error          
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "El usuario " + usuario.getNomUsu() + " ya existe", "Verificar"));
            trans.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            session.close();
        }
        return true;
    }

    @Override
    public boolean actualizarUsuario(TUsuario usuario) {
        session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.merge(usuario);
            session.beginTransaction().commit();
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_INFO, "Se  Actualizó Usuario " + usuario.getNomUsu() + " correctamente", "Verificar"));
        } catch (Exception e) {
            System.out.println("Error en actualizar" + e.getMessage());
            session.beginTransaction().rollback();
            return false;
        } finally {
            session.close();
        }
        return true;
    }

    @Override
    public List obtenerListadoMenu(String nomusuario, String ruce) {
        List<TAccesom> listaAccesoM = null;
        try {
            //TRAIGO PERFIL DEL USUARIO
            List<TUsuario> usuarioList = null;
            Session sessionU = HibernateUtil.getSessionFactory().openSession();
            String sqlU = "SELECT u FROM TUsuario u where u.nomUsu='" + nomusuario + "'";
            Query queryU = sessionU.createQuery(sqlU);
            usuarioList = queryU.list();
            if (usuarioList.size() > 0) {
                //BUSCO CON Q EMPRESA ACCEDE Y CON Q PERFIL ENTRO      
                List<TAccesoe> listaAccesoE = null;
                Session session = HibernateUtil.getSessionFactory().openSession();
                String sql = "SELECT ae FROM TAccesoe ae WHERE ae.TEmpresa.cdRuc='" + ruce + "' AND ae.TPerfil.cdPerfil='" + usuarioList.get(0).getTPerfil().getCdPerfil() + "'";
                Query query = session.createQuery(sql);
                listaAccesoE = query.list();
                if (usuarioList.size() > 0) {
                    // TRAIGO LOS MENUS DE ACUERDO A EL USUARIO Y LA EMPRESA Q ACCEDE
                    Session sessionM = HibernateUtil.getSessionFactory().openSession();
                    String sqlM = "SELECT am FROM TAccesom am Where am.TGrupoacceso.cdGa=" + listaAccesoE.get(0).getTGrupoacceso().getCdGa();
                    Query queryM = sessionM.createQuery(sqlM);
                    listaAccesoM = queryM.list();
                }
                else{
                    //NO SE PEUDE BUSCAR
                }
            }
            else{
                //NO SE PEUDE BUSCAR
            }
            return listaAccesoM;
        } catch (Exception e) {
            System.out.println("Error en actualizar" + e.getMessage());
            session.beginTransaction().rollback();
            return listaAccesoM;
        }
    }
}
