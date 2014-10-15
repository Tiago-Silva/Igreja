package br.com.igreja.interfaceDao;

import java.util.List;

import br.com.igreja.entidades.PermissaoUsuario;
import br.com.igreja.entidades.Usuario;

public interface InterfaceDaoPermissao extends InterfaceDaoBase<PermissaoUsuario> {
	
	List<PermissaoUsuario> getUsuario(Usuario usuario);
	
	List<PermissaoUsuario> getIdUsuario(int idusuario);
	
	List<PermissaoUsuario> getUsuarioLogin(String login);
}
