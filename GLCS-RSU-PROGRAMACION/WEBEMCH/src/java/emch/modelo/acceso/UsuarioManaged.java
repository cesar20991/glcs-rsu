
package emch.modelo.acceso;

import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TPerfil;
import emch.modelo.entidades.TUsuario;
import java.util.List;

public interface UsuarioManaged {
    
    public TUsuario buscarPorUsuario(TUsuario usuario);
    public TEmpresa ListarEmpresa();
    public TEmpresa BuscarPorEmpresa(TEmpresa empresa);
    public TEmpresa buscarRuc(TUsuario usuario); 
    public List<TUsuario> ListarUsuarioTodos();
    public TUsuario buscarPorId(String id);
    public List ListarPerfilTodos();
    public boolean ingresarUsuario(TUsuario usuario);
    public boolean actualizarUsuario(TUsuario usuario);
    
}
