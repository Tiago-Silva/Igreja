package br.com.igreja.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.igreja.entidades.Igreja;
import br.com.igreja.enuns.TipoIgreja;
import br.com.igreja.interfaceDao.InterfaceDaoIgreja;

@Repository
public class IgrejaDao extends GenericJPADao<Igreja> implements InterfaceDaoIgreja {
	
	@PersistenceContext
	private EntityManager em;
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Igreja> getNome(String nome) {
		String jpql = "select a from Igreja a where a.nome = :nome";
		Query query = em.createQuery(jpql);
		query.setParameter("nome", nome);
		List<Igreja> igrejas = query.getResultList();
		return igrejas;
	}

	@Override
	public List<Igreja> getPastor(String nomePastor) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Igreja> getCidade(String cidade) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Class<Igreja> getClazz() {
		return Igreja.class;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Igreja> getTipo(TipoIgreja tipoIgreja) {
		String jpql = "select a from Igreja a where a.tipoIgreja = :tipoIgreja";
		Query query = em.createQuery(jpql);
		query.setParameter("tipoIgreja", tipoIgreja);
		List<Igreja> igrejas = query.getResultList();
		return igrejas;
	}

	@Override
	public String getIgrejaNome(int idigreja) {
		String jpql = "select a.nome from Igreja a where a.idigreja = :idigreja";
		TypedQuery<String> query = em.createQuery(jpql, String.class);
		query.setParameter("idigreja", idigreja);
		String nome = query.getSingleResult();
		return nome;
	}

	@Override
	public Igreja getIgreja(int idigreja) {
		// TODO Auto-generated method stub
		return null;
	}

}
