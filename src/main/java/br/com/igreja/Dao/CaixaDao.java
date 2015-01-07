package br.com.igreja.Dao;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.igreja.entidades.Caixa;
import br.com.igreja.entidades.Igreja;
import br.com.igreja.enuns.TipoCaixa;
import br.com.igreja.interfaceDao.InterfaceDaoCaixa;

@Repository
public class CaixaDao extends GenericJPADao<Caixa> implements InterfaceDaoCaixa {
	
	@PersistenceContext
	private EntityManager em;
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Caixa> getData() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		String data = dateFormat.format(date);
		String jpql = "Select a from Caixa a where a.data = :data";
		Query query = em.createQuery(jpql);
		query.setParameter("data", data);
		List<Caixa> caixas = query.getResultList();
		return caixas;
	}

	@Override
	public List<Caixa> getTipo(TipoCaixa tipoCaixa) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Class<Caixa> getClazz() {
		return Caixa.class;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Caixa> getMes() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(date);
		String jpql = "Select a from Caixa a where a.mes = :mes";
		Query query = em.createQuery(jpql);
		query.setParameter("mes", mes);
		List<Caixa> caixas = query.getResultList();
		return caixas;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Caixa> getAno() {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy");
		String ano = dateFormat.format(date);
		String jpql = "Select a from Caixa a where a.ano = :ano";
		Query query = em.createQuery(jpql);
		query.setParameter("ano", ano);
		List<Caixa> caixas = query.getResultList();
		return caixas;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	public BigDecimal TotalEntradaSaidaMes(TipoCaixa tipoCaixaEntrada) {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(date);
		
		String jpql = "Select sum(a.valor) from Caixa a where a.tipo = :tipo "
				+ " and a.mes = :mes";
		TypedQuery<BigDecimal> query = em.createQuery(jpql, BigDecimal.class);
		
		query.setParameter("tipo", tipoCaixaEntrada);
		query.setParameter("mes", mes);
		
		BigDecimal valorTotalEntradaSaidaMes = query.getSingleResult();
		
		return valorTotalEntradaSaidaMes;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Caixa> getIgrejaIdMes(int igrejaIdigreja) {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(date);
		String jpql = "Select a from Caixa a where a.mes = :mes "
				+ " and a.igreja.idigreja = :igrejaIdigreja";
		Query query = em.createQuery(jpql);
		query.setParameter("mes", mes);
		query.setParameter("igrejaIdigreja", igrejaIdigreja);
		List<Caixa> caixas = query.getResultList();
		return caixas;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public List<Caixa> getIgrejaIdAno(int igrejaIdigreja) {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy");
		String ano = dateFormat.format(date);
		String jpql = "Select a from Caixa a where a.ano = :ano "
				+ " and a.igreja.idigreja = :igrejaIdigreja";
		Query query = em.createQuery(jpql);
		query.setParameter("ano", ano);
		query.setParameter("igrejaIdigreja", igrejaIdigreja);
		List<Caixa> caixas = query.getResultList();
		return caixas;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public Igreja getIgreja(int igrejaIdigreja) {
		String jpql = "Select a from Caixa a where a.igreja.idigreja = :igrejaIdigreja";
		TypedQuery<Igreja> query = em.createQuery(jpql, Igreja.class);
		query.setParameter("igrejaIdigreja", igrejaIdigreja);
		Igreja igrejas = query.getSingleResult();
		return igrejas;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public BigDecimal TotalEntradaSaidaMesIgrejaId(TipoCaixa tipoCaixa,
			int igrejaIdigreja) {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(date);
		
		String jpql = "Select sum(a.valor) from Caixa a where a.tipo = :tipo "
				+ " and a.mes = :mes and a.igreja.idigreja = :igrejaIdigreja";
		TypedQuery<BigDecimal> query = em.createQuery(jpql, BigDecimal.class);
		
		query.setParameter("tipo", tipoCaixa);
		query.setParameter("mes", mes);
		query.setParameter("igrejaIdigreja", igrejaIdigreja);
		
		BigDecimal valorTotalEntradaSaidaMes = query.getSingleResult();
		
		BigDecimal retorno = new BigDecimal("0.0");
		
		if(valorTotalEntradaSaidaMes == null) {
			return retorno;
		} else {
			return retorno = retorno.add(valorTotalEntradaSaidaMes);
		}
	}
	
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.SERIALIZABLE, readOnly=true)
	@Override
	public BigDecimal saldoAtual(TipoCaixa tipoCaixa, int igrejaIdigreja) {
		Date date = new Date();
		int mesSubtrair = -30;
		Date m = new Date(date.getTime()-((1000*24*60*60)*mesSubtrair));
		
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(date);
		DateFormat calendarFormat = new SimpleDateFormat("MM");
		String dataInicial = calendarFormat.format(m);
		
		String jpql = "Select sum(a.valor) from Caixa a where a.tipo = :tipo and a.igreja.idigreja = :igrejaIdigreja "
				+ " and a.mes between :dataInicial and :dataFinal";
		TypedQuery<BigDecimal> query = em.createQuery(jpql, BigDecimal.class);
		
		query.setParameter("tipo", tipoCaixa);
		query.setParameter("igrejaIdigreja", igrejaIdigreja);
		query.setParameter("dataInicial", dataInicial);
		query.setParameter("dataFinal", mes);
		
		BigDecimal saldoTotalEntradaSaidaMes = query.getSingleResult();
		return saldoTotalEntradaSaidaMes;
	}

	@Override
	public BigDecimal entradaMesAnterior(TipoCaixa tipoCaixa, int igrejaIdigreja) {
		
		GregorianCalendar gc = new GregorianCalendar();
		
		gc.add(gc.MONTH, -1);
		
		Date data = gc.getTime();
		
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(data);
		
		String jpql = "Select sum(a.valor) from Caixa a where a.tipo = :tipo "
				+ " and a.mes = :mes and a.igreja.idigreja = :igrejaIdigreja";
		TypedQuery<BigDecimal> query = em.createQuery(jpql, BigDecimal.class);
		
		query.setParameter("tipo", tipoCaixa);
		query.setParameter("mes", mes);
		query.setParameter("igrejaIdigreja", igrejaIdigreja);
		
		BigDecimal valorTotalEntradaSaidaMes = query.getSingleResult();
		
		BigDecimal retorno = new BigDecimal("0.0");
		
		if(valorTotalEntradaSaidaMes == null) {
			return retorno;
		} else {
			return retorno = retorno.add(valorTotalEntradaSaidaMes);
		}
	}

	@Override
	public BigDecimal saidaMesAnterior(TipoCaixa tipoCaixa, int igrejaIdigreja) {
		
		GregorianCalendar gc = new GregorianCalendar();
		
		gc.add(gc.MONTH, -1);
		
		Date data = gc.getTime();
		
		DateFormat dateFormat = new SimpleDateFormat("MM");
		String mes = dateFormat.format(data);
		
		String jpql = "Select sum(a.valor) from Caixa a where a.tipo = :tipo "
				+ " and a.mes = :mes and a.igreja.idigreja = :igrejaIdigreja";
		TypedQuery<BigDecimal> query = em.createQuery(jpql, BigDecimal.class);
		
		query.setParameter("tipo", tipoCaixa);
		query.setParameter("mes", mes);
		query.setParameter("igrejaIdigreja", igrejaIdigreja);
		
		BigDecimal valorTotalSaidaMes = query.getSingleResult();
		
		BigDecimal retorno = new BigDecimal("0.0");
		
		if(valorTotalSaidaMes == null) {
			return retorno;
		} else {
			return retorno = retorno.add(valorTotalSaidaMes);
		}
		
	}

}