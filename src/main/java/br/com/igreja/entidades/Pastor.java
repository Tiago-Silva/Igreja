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
import javax.persistence.Lob;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import br.com.igreja.enuns.EstadoCivil;
import br.com.igreja.enuns.Estados;
import br.com.igreja.enuns.OrgaoRg;

/**
 * The persistent class for the pastor database table.
 * 
 */
@Entity
@Table(name = "pastor")
@NamedQuery(name = "Pastor.findAll", query = "SELECT p FROM Pastor p")
public class Pastor implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idpastor;

	private String bairro;

	private String celular;

	private String cep;

	private String cidade;
	@NotEmpty @NotNull
	private String cpf;

	private String endereco;

	@Column(name = "estado")
	@Enumerated(EnumType.STRING)
	private Estados estado;

	private String nascimento;

	private String naturalidade;

	@Size(max = 45, min = 4, message = "{pastor.formulario.nome.tamanho}")
	@NotNull
	@NotEmpty
	private String nome;

	@Column(name = "orgaorg")
	@Enumerated(EnumType.STRING)
	private OrgaoRg orgaorg;
	
	private String orgaorgestado;

	private String rg;

	private String telefone;

	private String estado_natural;

	private String pais_natural;

	private String consagracao;

	@Column(name = "civil")
	@Enumerated
	private EstadoCivil estadoCivil;

	@Lob
	private byte[] foto;

	// bi-directional many-to-one association to Igreja
	@OneToMany(mappedBy = "pastorBean")
	private List<Igreja> igrejas;

	public Pastor() {
	}

	public int getIdpastor() {
		return this.idpastor;
	}

	public void setIdpastor(int idpastor) {
		this.idpastor = idpastor;
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

	public String getCpf() {
		return this.cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getEndereco() {
		return this.endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getNascimento() {
		return this.nascimento;
	}

	public void setNascimento(String nascimento) {
		this.nascimento = nascimento;
	}

	public String getNaturalidade() {
		return this.naturalidade;
	}

	public void setNaturalidade(String naturalidade) {
		this.naturalidade = naturalidade;
	}

	public String getNome() {
		return this.nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public OrgaoRg getOrgaorg() {
		return orgaorg;
	}

	public void setOrgaorg(OrgaoRg orgaorg) {
		this.orgaorg = orgaorg;
	}

	public String getOrgaorgestado() {
		return orgaorgestado;
	}

	public void setOrgaorgestado(String orgaorgestado) {
		this.orgaorgestado = orgaorgestado;
	}

	public String getRg() {
		return this.rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public String getTelefone() {
		return this.telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public Estados getEstado() {
		return estado;
	}

	public void setEstado(Estados estado) {
		this.estado = estado;
	}

	public String getEstado_natural() {
		return estado_natural;
	}

	public void setEstado_natural(String estado_natural) {
		this.estado_natural = estado_natural;
	}

	public String getPais_natural() {
		return pais_natural;
	}

	public void setPais_natural(String pais_natural) {
		this.pais_natural = pais_natural;
	}

	public String getConsagracao() {
		return consagracao;
	}

	public void setConsagracao(String consagracao) {
		this.consagracao = consagracao;
	}

	public EstadoCivil getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(EstadoCivil estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public List<Igreja> getIgrejas() {
		return igrejas;
	}

	public void setIgrejas(List<Igreja> igrejas) {
		this.igrejas = igrejas;
	}
	
	public Igreja addIgreja(Igreja igreja) {
		getIgrejas().add(igreja);
		igreja.setPastorBean(this);

		return igreja;
	}

	public Igreja removeIgreja(Igreja igreja) {
		getIgrejas().remove(igreja);
		igreja.setPastorBean(null);

		return igreja;
	}
}