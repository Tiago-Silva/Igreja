package br.com.igreja.interfaceDao;

import java.math.BigDecimal;
import java.util.List;

import br.com.igreja.entidades.Caixa;
import br.com.igreja.entidades.Igreja;
import br.com.igreja.enuns.TipoCaixa;

public interface InterfaceDaoCaixa extends InterfaceDaoBase<Caixa> {
	
	List<Caixa> getData();
	
	List<Caixa> getTipo(TipoCaixa tipoCaixa);
	
	List<Caixa> getMes();
	
	List<Caixa> getAno();
	
	public BigDecimal TotalEntradaSaidaMes(TipoCaixa tipoCaixaEntrada);
	
	List<Caixa> getIgrejaIdMes(int igrejaIdigreja);
	
	List<Caixa> getIgrejaIdAno(int igrejaIdigreja);
	
	public Igreja getIgreja(int igrejaIdigreja);
	
	public BigDecimal TotalEntradaSaidaMesIgrejaId(TipoCaixa tipoCaixa, int igrejaIdigreja);
	
	public BigDecimal saldoAtual(TipoCaixa tipoCaixa, int igrejaIdigreja);
}
