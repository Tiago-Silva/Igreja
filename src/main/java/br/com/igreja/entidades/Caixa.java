package br.com.igreja.entidades;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import br.com.igreja.enuns.TipoCaixa;

/**
 * The persistent class for the caixa database table.
 * 
 */
@Entity
@Table(name = "caixa")
@NamedQuery(name = "Caixa.findAll", query = "SELECT c FROM Caixa c")
public class Caixa implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idcaixa;

	private String categoria;

	private String data;

	private String descricacao;

	@Column(name = "tipo")
	@Enumerated(EnumType.STRING)
	private TipoCaixa tipo;

	private BigDecimal valor;

	private BigDecimal saldo_anterior;

	private BigDecimal saldo_atual;

	private BigDecimal saida_anterior;

	private BigDecimal saida_atual;

	private String dia;

	private String mes;

	private String ano;

	// bi-directional many-to-one association to Igreja
	@ManyToOne
	private Igreja igreja;

	public Caixa() {
	}

	public int getIdcaixa() {
		return this.idcaixa;
	}

	public void setIdcaixa(int idcaixa) {
		this.idcaixa = idcaixa;
	}

	public String getCategoria() {
		return this.categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getData() {
		return this.data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getDescricacao() {
		return this.descricacao;
	}

	public void setDescricacao(String descricacao) {
		this.descricacao = descricacao;
	}

	public BigDecimal getValor() {
		return this.valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public TipoCaixa getTipo() {
		return tipo;
	}

	public void setTipo(TipoCaixa tipo) {
		this.tipo = tipo;
	}

	public BigDecimal getSaldo_anterior() {
		return saldo_anterior;
	}

	public void setSaldo_anterior(BigDecimal saldo_anterior) {
		this.saldo_anterior = saldo_anterior;
	}

	public BigDecimal getSaldo_atual() {
		return saldo_atual;
	}

	public void setSaldo_atual(BigDecimal saldo_atual) {
		this.saldo_atual = saldo_atual;
	}

	public BigDecimal getSaida_anterior() {
		return saida_anterior;
	}

	public void setSaida_anterior(BigDecimal saida_anterior) {
		this.saida_anterior = saida_anterior;
	}

	public BigDecimal getSaida_atual() {
		return saida_atual;
	}

	public void setSaida_atual(BigDecimal saida_atual) {
		this.saida_atual = saida_atual;
	}

	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getMes() {
		return mes;
	}

	public void setMes(String mes) {
		this.mes = mes;
	}

	public String getAno() {
		return ano;
	}

	public void setAno(String ano) {
		this.ano = ano;
	}

	public Igreja getIgreja() {
		return igreja;
	}

	public void setIgreja(Igreja igreja) {
		this.igreja = igreja;
	}
	
}