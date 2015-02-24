package br.com.igreja.entidades;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.eclipse.persistence.oxm.annotations.XmlInverseReference;

/**
 * The persistent class for the dizimo database table.
 * 
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "dizimo")
@NamedQuery(name = "Dizimo.findAll", query = "SELECT d FROM Dizimo d")
public class Dizimo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int iddizimo;

	private String data;

	private String descricacao;

	private BigDecimal valor;

	private String mes;

	private String ano;

	// bi-directional many-to-one association to Membro
	@ManyToOne
	@JoinColumn(name = "membro_idmembro")
	@XmlInverseReference(mappedBy = "dizimos")
	private Membro membroBean;

	public Dizimo() {
	}

	public int getIddizimo() {
		return this.iddizimo;
	}

	public void setIddizimo(int iddizimo) {
		this.iddizimo = iddizimo;
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

	public Membro getMembroBean() {
		return membroBean;
	}

	public void setMembroBean(Membro membroBean) {
		this.membroBean = membroBean;
	}
	
}