package br.com.igreja;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.igreja.entidades.Igreja;
import br.com.igreja.entidades.PermissaoUsuario;
import br.com.igreja.entidades.Usuario;
import br.com.igreja.enuns.PermissaoUsuarioEnum;
import br.com.igreja.interfaceDao.InterfaceDaoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoPermissao;
import br.com.igreja.interfaceDao.InterfaceDaoUsuario;

@Controller
@Transactional
public class UsuarioControler {
	
	@Autowired
	private InterfaceDaoUsuario usuarioDao;
	
	@Autowired
	private InterfaceDaoIgreja igrejaDao;
	
	@Autowired
	private InterfaceDaoPermissao permissaoDao;
	
	@RequestMapping("UsuarioCadastro")
	public String registro(Map<String, Object> usuario, Model igrejas, Model role) {
		
		if (usuario.get("usuario") == null) {
			usuario.put("usuario", new Usuario());
		}
				
		igrejas.addAttribute("igrejas", igrejaDao.getLista(Igreja.class));
		role.addAttribute("roles", PermissaoUsuarioEnum.values());
		return "usuario/UsuarioCadastro";
	}
	
	@RequestMapping("salvaUsuario")
	public String salvaUsuario(Usuario usuario, @RequestParam(value = "imagem", required =  false) MultipartFile imagem,
								@RequestParam(value = "permissao", required = false) String permissao) {
		
		if (!imagem.isEmpty()) {
            try {
                usuario.setFoto(imagem.getBytes());
            } catch (Exception e) {
                return "You failed to upload " + usuario.getLogin() + " => " + e.getMessage();
            }
        } 
		
		String senha = DigestUtils.md5DigestAsHex(usuario.getSenha().getBytes());
		
		
		usuario.setSenha(senha);
		
		PermissaoUsuario permissaoUsuario = new PermissaoUsuario();
		
		permissaoUsuario.setRole(PermissaoUsuarioEnum.valueOf(permissao));
		permissaoUsuario.setUsuario1(usuario);
		
		usuarioDao.salvar(usuario);
		permissaoDao.salvar(permissaoUsuario);
		
		return "redirect:ListaTodosMembros";
	}
	
	@RequestMapping("ListaTodosUsuarios")
	public String ListaTodosUsuarios(Model usuarios) {
		
		usuarios.addAttribute("usuarios", usuarioDao.getTodosUsuarios());
		return "usuario/ListaTodosUsuarios";
	}

}
