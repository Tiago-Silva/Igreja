package br.com.igreja.Dao;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.igreja.entidades.Dizimo;
import br.com.igreja.interfaceDao.InterfaceDaoDizimo;

@Repository
public class DizimoDao extends GenericJPADao<Dizimo> implements InterfaceDaoDizimo {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Dizimo> getData(String data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Dizimo> getMembro(int idMembro) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public BigDecimal getValor(int idigreja) {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(date);
		String jpql = "Select sum(a.valor) from Dizimo a where a.mes = :mes "
				+ " and membroBean.igrejaBean.idigreja = :idigreja";
		TypedQuery<BigDecimal> query = em.createQuery(jpql, BigDecimal.class);
		query.setParameter("mes", mes);
		query.setParameter("idigreja", idigreja);
		BigDecimal dizimoValorMes = query.getSingleResult();
		return dizimoValorMes;
	}

	@Override
	protected Class<Dizimo> getClazz() {
		return Dizimo.class;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Dizimo> getMesAtual() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(date);
		
		String jpql = "Select a from Dizimo a where a.mes = :mes";
		Query query = em.createQuery(jpql);
		query.setParameter("mes", mes);
		List<Dizimo> dizimos = query.getResultList();
		return dizimos;
	}

	@Override
	public BigDecimal getValorTrintaDias(int idigreja) {
		Date date = new Date();
		int mesSubtrair = -30;
		Date m = new Date(date.getTime()-((1000*24*60*60)*mesSubtrair));
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(date);
		DateFormat calendarFormat = new SimpleDateFormat("MM");
		String dataInicial = calendarFormat.format(m);
		System.out.println("Data do dizimo:  " + dataInicial);
		
		String jpql = "Select sum(a.valor) from Dizimo a where membroBean.igrejaBean.idigreja = :idigreja "
				+ " and a.mes between :dataInicial and :dataFinal";
		TypedQuery<BigDecimal> query = em.createQuery(jpql, BigDecimal.class);
		query.setParameter("dataInicial", dataInicial);
		query.setParameter("dataFinal", mes);
		query.setParameter("idigreja", idigreja);
		BigDecimal dizimoValorTrintaDias = query.getSingleResult();
		return dizimoValorTrintaDias;
	}

}
