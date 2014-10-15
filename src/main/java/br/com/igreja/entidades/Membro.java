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

import org.hibernate.validator.constraints.NotEmpty;

import br.com.igreja.enuns.BatismoEspirito;
import br.com.igreja.enuns.Funcao;
import br.com.igreja.enuns.Membro_Situacao;
import br.com.igreja.enuns.OrgaoRg;
import br.com.igreja.enuns.Sexo;

/**
 * The persistent class for the membro database table.
 * 
 */
@Entity
@Table(name = "membro")
@NamedQuery(name = "Membro.findAll", query = "SELECT m FROM Membro m")
public class Membro implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idmembro;

	private String bairro;

	private String batismo;

	private String celular;

	private String cep;

	private String cidade;
	
	@NotEmpty @NotNull
	private String cpf;

	private String endereco;

	private String estado;

	@Column(name = "funcao")
	@Enumerated(EnumType.STRING)
	private Funcao funcao;
	
	@Column(name = "situacao")
	@Enumerated(EnumType.STRING)
	private Membro_Situacao situacao;
	
	private String descricao;

	private String nascimento;

	private String naturalidade;
	
	@Size(max=50, min=4, message = "{membro.formulario.nome.tamanho}") @NotEmpty @NotNull
	private String nome;
	
	@Column(name = "orgaorg")
	@Enumerated(EnumType.STRING)
	private OrgaoRg orgaorg;
	
	private String orgaorgestado;

	private String rg;

	@Column(name = "sexo")
	@Enumerated(EnumType.STRING)
	private Sexo sexo;

	private String telefone;

	@Column(name = "batismo_espirito")
	@Enumerated(EnumType.STRING)
	private BatismoEspirito batismo_espirito;

	private String estado_natural;

	private String civil;

	@Lob
	private byte[] foto;

	// bi-directional many-to-one association to Dizimo
	@OneToMany(mappedBy = "membroBean")
	private List<Dizimo> dizimos;

	// bi-directional many-to-one association to Igreja
	@ManyToOne
	@JoinColumn(name = "igreja_idigreja")
	private Igreja igrejaBean;

	public Membro() {
	}

	public int getIdmembro() {
		return this.idmembro;
	}

	public void setIdmembro(int idmembro) {
		this.idmembro = idmembro;
	}

	public String getBairro() {
		return this.bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getBatismo() {
		return this.batismo;
	}

	public void setBatismo(String batismo) {
		this.batismo = batismo;
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

	public String getEstado() {
		return this.estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
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

	public String getEstado_natural() {
		return estado_natural;
	}

	public void setEstado_natural(String estado_natural) {
		this.estado_natural = estado_natural;
	}

	public String getCivil() {
		return civil;
	}

	public void setCivil(String civil) {
		this.civil = civil;
	}

	public Sexo getSexo() {
		return sexo;
	}

	public void setSexo(Sexo sexo) {
		this.sexo = sexo;
	}

	public Funcao getFuncao() {
		return funcao;
	}

	public void setFuncao(Funcao funcao) {
		this.funcao = funcao;
	}

	public BatismoEspirito getBatismo_espirito() {
		return batismo_espirito;
	}

	public void setBatismo_espirito(BatismoEspirito batismo_espirito) {
		this.batismo_espirito = batismo_espirito;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public List<Dizimo> getDizimos() {
		return dizimos;
	}

	public void setDizimos(List<Dizimo> dizimos) {
		this.dizimos = dizimos;
	}

	public Igreja getIgrejaBean() {
		return igrejaBean;
	}

	public void setIgrejaBean(Igreja igrejaBean) {
		this.igrejaBean = igrejaBean;
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
	
	public Membro_Situacao getSituacao() {
		return situacao;
	}

	public void setSituacao(Membro_Situacao situacao) {
		this.situacao = situacao;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Dizimo addDizimo(Dizimo dizimo) {
		getDizimos().add(dizimo);
		dizimo.setMembroBean(this);

		return dizimo;
	}

	public Dizimo removeDizimo(Dizimo dizimo) {
		getDizimos().remove(dizimo);
		dizimo.setMembroBean(null);

		return dizimo;
	}
}