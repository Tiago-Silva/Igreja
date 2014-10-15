package br.com.igreja.Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.igreja.entidades.Membro;
import br.com.igreja.enuns.Funcao;
import br.com.igreja.interfaceDao.InterfaceDaoMembro;

@Repository
public class MembroDao extends GenericJPADao<Membro> implements InterfaceDaoMembro {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Membro> getNome(String nome) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Membro> getIgreja(int idigreja) {
		String jpql = "Select a from Membro a where a.igrejaBean.idigreja = :idigreja order by a.nome";
		Query query = em.createQuery(jpql);
		query.setParameter("idigreja", idigreja);
		List<Membro> membros = query.getResultList();
		return membros;
	}

	@Override
	protected Class<Membro> getClazz() {
		return Membro.class;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public Membro getMembro(int idmembro) {
		String jpql = "Select a from Membro a where a.idmembro = :idmembro";
		TypedQuery<Membro> query = em.createQuery(jpql, Membro.class);
		query.setParameter("idmembro", idmembro);
		Membro membros = query.getSingleResult();
		return membros;
	}
	
	@Secured({"ROLE_SECRETARIO_SEDE","ROLE_TESOUREIRO_SEDE","ROLE_TESOUREIRO_CONGREGACAO","ROLE_SECRETARIO_CONGREGACAO"})
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Membro> getFuncao(Funcao funcao, int idigreja) {
		String jpql = "Select a from Membro a where a.funcao = :funcao "
				+ " and a.igrejaBean.idigreja = :igrejaIdigreja";
		Query query = em.createQuery(jpql);
		query.setParameter("funcao", funcao);
		query.setParameter("igrejaIdigreja", idigreja);
		List<Membro> membros = query.getResultList();
		return membros;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Membro> getIdmembro(int id) {
		String jpql = "Select a.idmembro,a.nome,a.cpf,a.rg,a.orgaorg,a.nascimento,a.naturalidade,a.endereco,a.cep,a.bairro,a.cidade,"
				+ "a.estado,a.orgaorgestado,a.sexo,a.batismo,a.funcao,a.telefone,a.estado_natural,a.celular,a.civil,a.igrejaBean.idigreja"
				+ " from Membro a where a.idmembro = :idmembro order by a.nome";
		Query query = em.createQuery(jpql);
		query.setParameter("idmembro", id);
		List<Membro> membros = query.getResultList();
		return membros;
	}

	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Membro> getIgrejaJson(int idigreja) {
		String jpql = "Select a.idmembro,a.nome from Membro a where a.igrejaBean.idigreja = :idigreja order by a.nome";
		Query query = em.createQuery(jpql);
		query.setParameter("idigreja", idigreja);
		List<Membro> membros = query.getResultList();
		return membros;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Membro> getIgrejaSedeJson(int idigreja) {
		String jpql = "Select a.idmembro,a.nome,a.cpf,a.rg,a.endereco,a.bairro,a.cidade,"
				+ "a.telefone,a.celular,a.situacao,a.igrejaBean.idigreja"
				+ " from Membro a where a.igrejaBean.idigreja = :idigreja order by a.nome";
		Query query = em.createQuery(jpql);
		query.setParameter("idigreja", idigreja);
		List<Membro> membros = query.getResultList();
		return membros;
	}

}
