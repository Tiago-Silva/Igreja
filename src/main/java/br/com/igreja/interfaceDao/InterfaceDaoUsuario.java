package br.com.igreja.interfaceDao;

import br.com.igreja.entidades.Usuario;

public interface InterfaceDaoUsuario extends InterfaceDaoBase<Usuario> {
	
	int getNome(String nome);
	
	Usuario getUsuario(String login, String senha);
	
	Usuario getUsuario(String nome);
	
}
