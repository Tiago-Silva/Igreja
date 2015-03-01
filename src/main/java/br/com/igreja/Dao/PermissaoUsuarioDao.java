package br.com.igreja.Dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import br.com.igreja.entidades.PermissaoUsuario;
import br.com.igreja.entidades.Usuario;
import br.com.igreja.interfaceDao.InterfaceDaoPermissao;

@Repository
public class PermissaoUsuarioDao extends GenericJPADao<PermissaoUsuario> implements InterfaceDaoPermissao {
	
	@PersistenceContext
	EntityManager em;
	
	@Override
	public List<PermissaoUsuario> getUsuario(Usuario usuario) {
		if (usuario == null) {
			return new ArrayList<PermissaoUsuario>();
		}
		String jpql = "select a from PermissaoUsuario a where a.usuario = :usuario ";
		Query query = em.createQuery(jpql);
		query.setParameter("usuario", usuario);
		List<PermissaoUsuario> permissoes = query.getResultList();
		return permissoes;
	}

	@Override
	protected Class<PermissaoUsuario> getClazz() {

		return PermissaoUsuario.class;
	}

	@Override
	public List<PermissaoUsuario> getIdUsuario(int idusuario) {
		String jpql = "select a.role from PermissaoUsuario a where a.usuario1.idusuario = :idusuario";
		Query query = em.createQuery(jpql);
		query.setParameter("idusuario", idusuario);
		List<PermissaoUsuario> permissoes = query.getResultList();
		return permissoes;
	}

	@Override
	public List<PermissaoUsuario> getUsuarioLogin(String login) {
		String jpql = "select a.role from PermissaoUsuario a where a.usuario_login = :login";
		Query query = em.createQuery(jpql);
		query.setParameter("login", login);
		List<PermissaoUsuario> permissoes = query.getResultList();
		return permissoes;
	}

}
