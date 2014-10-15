package br.com.igreja.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.igreja.interfaceDao.InterfaceDaoBase;

public abstract class GenericJPADao<T> implements InterfaceDaoBase<T> {
	
	protected abstract Class<T> getClazz();
	
	@PersistenceContext
	private EntityManager em;
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=false)
	public void salvar(T objeto) {
		em.persist(objeto);
		em.flush();
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<T> getLista(Class<T> classe) {
		return em.createQuery("Select a from " + classe.getSimpleName() + " a order by a.nome").getResultList();
	}
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=false)
	@Override
	public void excluir(T objeto) {
		objeto = em.merge(objeto);
		em.remove(objeto);
	}
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=false)
	@Override
	public void alterar(T objeto) {
		em.merge(objeto);
	}
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public T get(int id) {
		// TODO Auto-generated method stub
		return em.find(getClazz(), id);
	}
}
