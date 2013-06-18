
package emch.modelo.acceso;

import emch.modelo.entidades.TCliente;
import emch.modelo.entidades.TEmpresa;
import emch.modelo.entidades.TUsuario;

public interface UsuarioManaged {
    
    public TUsuario buscarPorUsuario(TUsuario usuario);
    public TEmpresa ListarEmpresa();
    public TEmpresa BuscarPorEmpresa(TEmpresa empresa);
    public TEmpresa buscarRuc(TUsuario usuario); 
    
}
