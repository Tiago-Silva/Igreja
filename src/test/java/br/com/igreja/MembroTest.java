package br.com.igreja;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.igreja.entidades.Usuario;
import br.com.igreja.interfaceDao.InterfaceDaoUsuario;

public class MembroTest {
	
	@Autowired
	private InterfaceDaoUsuario usuarioDao;
	
	@Test
	public void ListaTodosMembros() {
		
		Usuario usuario = usuarioDao.getUsuario("tiago");
		
		System.out.println("Usuario: " + usuario.getLogin());
	}
}
