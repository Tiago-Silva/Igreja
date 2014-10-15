package br.com.igreja.interfaceDao;

import java.math.BigDecimal;
import java.util.List;

import br.com.igreja.entidades.Dizimo;

public interface InterfaceDaoDizimo extends InterfaceDaoBase<Dizimo> {
	
	List<Dizimo> getData(String data);
	
	List<Dizimo> getMembro(int idMembro);
	
	public BigDecimal getValor(int idigreja);
	
	List<Dizimo> getMesAtual();
	
	public BigDecimal getValorTrintaDias(int idigreja);
}
