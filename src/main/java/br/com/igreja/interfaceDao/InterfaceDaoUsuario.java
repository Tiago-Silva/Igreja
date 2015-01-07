package br.com.igreja.interfaceDao;

import java.util.List;

import br.com.igreja.entidades.Usuario;

public interface InterfaceDaoUsuario extends InterfaceDaoBase<Usuario> {
	
	int getNome(String nome);
	
	Usuario getUsuario(String login, String senha);
	
	Usuario getUsuario(String nome);
	
	List<Usuario> getTodosUsuarios();
	
	void gravar();
}
