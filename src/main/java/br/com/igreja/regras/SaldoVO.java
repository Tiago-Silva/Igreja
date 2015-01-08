package br.com.igreja.regras;

import java.math.BigDecimal;

import br.com.igreja.entidades.Caixa;

public class SaldoVO {
	
	private BigDecimal entrada;

	private BigDecimal saida;
	
	private Caixa caixa;
	
	public SaldoVO(Caixa caixa, BigDecimal entradaMes, BigDecimal saidaMes) {
		this.caixa = caixa;
		this.entrada = entradaMes;
		this.saida = saidaMes;
	}
	
	public BigDecimal getEntrada() {
		return entrada;
	}

	public void setEntrada(BigDecimal entrada) {
		this.entrada = entrada;
	}

	public BigDecimal getSaida() {
		return saida;
	}

	public void setSaida(BigDecimal saida) {
		this.saida = saida;
	}

	public Caixa getCaixa() {
		return caixa;
	}

	public void setCaixa(Caixa caixa) {
		this.caixa = caixa;
	}

}
