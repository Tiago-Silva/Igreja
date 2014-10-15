package br.com.igreja.Dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.igreja.entidades.Usuario;
import br.com.igreja.interfaceDao.InterfaceDaoUsuario;

@Repository
public class UsuarioDao extends GenericJPADao<Usuario> implements InterfaceDaoUsuario {
	
	@PersistenceContext
	EntityManager em;
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public int getNome(String nome) {
		String jpql = "Select a.igrejaIdigreja from Usuario a where a.login = :login";
		TypedQuery<Integer> query = em.createQuery(jpql, Integer.class);
		query.setParameter("login", nome);
		int idigreja = query.getSingleResult();
		return idigreja;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public Usuario getUsuario(String login, String senha) {
		String jpql = "Select a from Usuario a where a.login = :login "
				+ " and a.senha = :senha";
		TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
		query.setParameter("login", login);
		query.setParameter("senha", DigestUtils.md5(senha));
		Usuario usuarios = query.getSingleResult();
		return usuarios;
	}

	@Override
	protected Class<Usuario> getClazz() {

		return Usuario.class;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public Usuario getUsuario(String nome) {
		String jpql = "Select a from Usuario a where a.login = :login";
		TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
		query.setParameter("login", nome);
		Usuario usuarios = query.getSingleResult();
		return usuarios;
	}
	
}
