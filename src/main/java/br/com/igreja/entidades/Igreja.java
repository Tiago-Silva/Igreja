package br.com.igreja.entidades;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import org.eclipse.persistence.oxm.annotations.XmlInverseReference;
import org.hibernate.validator.constraints.NotEmpty;

import br.com.igreja.enuns.Estados;
import br.com.igreja.enuns.TipoIgreja;

/**
 * The persistent class for the igreja database table.
 * 
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
@Entity
@Table(name = "igreja")
@NamedQuery(name = "Igreja.findAll", query = "SELECT i FROM Igreja i")
public class Igreja implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idigreja;
	@Size(max = 45, min = 4, message = "{igreja.formulario.bairro.tamanho}")
	private String bairro;

	private String celular;

	private String cep;
	@Size(max = 45, min = 4, message = "{igreja.formulario.cidade.tamanho}")
	private String cidade;
	@Size(max = 18, min = 14, message = "{igreja.formulario.cnpj.tamanho}")
	private String cnpj;
	@Size(max = 45, min = 4, message = "{igreja.formulario.endereco.tamanho}")
	private String endereco;

	@Column(name = "estado")
	@Enumerated(EnumType.STRING)
	private Estados estado;
	@Size(max = 45, min = 4, message = "{igreja.formulario.nome.tamanho}")
	@NotEmpty
	@NotNull
	private String nome;

	private String pastor;

	private String telefone;

	private String fundacao;

	@Column(name = "tipo")
	@Enumerated(EnumType.STRING)
	private TipoIgreja tipoIgreja;

	@Lob
	private byte[] foto;

	// bi-directional many-to-one association to Caixa
	@OneToMany(mappedBy = "igreja")
	private List<Caixa> caixas;

	// bi-directional many-to-one association to Membro
	@OneToMany(mappedBy = "igrejaBean")
	private List<Membro> membros;

	// bi-directional many-to-one association to Pastor
	@ManyToOne
	@JoinColumn(name = "pastor_idpastor")
	@XmlInverseReference(mappedBy = "igrejas")
	private Pastor pastorBean;

	public Igreja() {
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public int getIdigreja() {
		return this.idigreja;
	}

	public void setIdigreja(int idigreja) {
		this.idigreja = idigreja;
	}

	public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCelular() {
		return this.celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getCep() {
		return this.cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getCidade() {
		return this.cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCnpj() {
		return this.cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getEndereco() {
		return this.endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getPastor() {
		return this.pastor;
	}

	public void setPastor(String pastor) {
		this.pastor = pastor;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public TipoIgreja getTipoIgreja() {
		return tipoIgreja;
	}

	public void setTipoIgreja(TipoIgreja tipoIgreja) {
		this.tipoIgreja = tipoIgreja;
	}

	public Estados getEstado() {
		return estado;
	}

	public void setEstado(Estados estado) {
		this.estado = estado;
	}

	public String getFundacao() {
		return fundacao;
	}

	public void setFundacao(String fundacao) {
		this.fundacao = fundacao;
	}

	public List<Caixa> getCaixas() {
		return caixas;
	}

	public void setCaixas(List<Caixa> caixas) {
		this.caixas = caixas;
	}

	public List<Membro> getMembros() {
		return membros;
	}

	public void setMembros(List<Membro> membros) {
		this.membros = membros;
	}

	public Pastor getPastorBean() {
		return pastorBean;
	}

	public void setPastorBean(Pastor pastorBean) {
		this.pastorBean = pastorBean;
	}
	
	public Membro addMembro(Membro membro) {
		getMembros().add(membro);
		membro.setIgrejaBean(this);

		return membro;
	}

	public Membro removeMembro(Membro membro) {
		getMembros().remove(membro);
		membro.setIgrejaBean(null);

		return membro;
	}
}