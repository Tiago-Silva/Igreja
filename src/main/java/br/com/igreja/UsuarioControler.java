package br.com.igreja;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import br.com.igreja.Dao.UsuarioDao;
import br.com.igreja.entidades.Usuario;

public class UsuarioControler {
	
	UsuarioDao usuarioDao;
	
	
	public String registro(Map<String, Object> usuario) {
		
		if (usuario.get("usuario") == null) {
			usuario.put("usuario", new Usuario());
		}
		
		return "usuario/UsuarioCadastro";
	}

}
