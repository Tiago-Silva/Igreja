package br.com.igreja.Dao;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

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
		CriteriaBuilder builder = em.getCriteriaBuilder();
        CriteriaQuery<Usuario> criteriaQuery = builder.createQuery(Usuario.class);
        Root<Usuario> a = criteriaQuery.from(Usuario.class);
        criteriaQuery.select(a);

        List<Predicate> predicates = new ArrayList<>();


        ParameterExpression<String> log = builder.parameter(String.class, "login");
        ParameterExpression<String> sen = builder.parameter(String.class, "senha");
        predicates.add(builder.equal(a.get("login"), log));
        predicates.add(builder.equal(a.get("senha"), sen));
        criteriaQuery.where(predicates.toArray(new Predicate[0]));

        TypedQuery<Usuario> query = em.createQuery(criteriaQuery);
        query.setParameter("login", login);
        query.setParameter("senha", DigestUtils.md5(senha));
        Usuario usuarios = query.getSingleResult();
        System.out.println("Login e senha: " + usuarios.getLogin() + "  -" + usuarios.getSenha());
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

	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=false)
	public void gravar() {
		
		Usuario us = new Usuario();
		us.setIgrejaIdigreja(1);
		us.setLogin("ariston");
		us.setSenha("ariston");
		
		MessageDigest md = null;
		
		String senha = null;
		
		try {
			md = MessageDigest.getInstance("MD5");
			byte messageDigest[] = md.digest(us.getSenha().getBytes("UTF-8"));
			
			StringBuilder hexString = new StringBuilder();
			for (byte b : messageDigest) {
				hexString.append(String.format("%02X", 0xFF & b));
			}
			senha = hexString.toString();
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		us.setSenha(senha);
		em.persist(us);
		em.flush();
	}

	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	public List<Usuario> getTodosUsuarios() {
		String jpql = "Select a from Usuario a";
		Query query = em.createQuery(jpql);
		List<Usuario> usuarios = query.getResultList();
		return usuarios;
	}
	
}
