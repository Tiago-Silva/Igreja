package br.com.igreja.xml;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlRootElement;

import br.com.igreja.entidades.Dizimo;
import br.com.igreja.entidades.Igreja;
import br.com.igreja.entidades.Membro;
import br.com.igreja.enuns.BatismoEspirito;
import br.com.igreja.enuns.Funcao;
import br.com.igreja.enuns.Membro_Situacao;
import br.com.igreja.enuns.OrgaoRg;
import br.com.igreja.enuns.Sexo;

@XmlRootElement
public class MembroCompare implements Comparable<Membro> {
	
	@XmlElement (name = "ID")
	private int idmembro;
	
	@XmlElement (name = "Bairro")
	private String bairro;
	
	@XmlElement (name = "Batismo")
	private String batismo;
	
	@XmlElement (name = "Celular")
	private String celular;
	
	@XmlElement (name = "Cep")
	private String cep;
	
	@XmlElement (name = "Cidade")
	private String cidade;
	
	@XmlElement (name = "Cpf")
	private String cpf;
	
	@XmlElement (name = "Endereco")
	private String endereco;
	
	@XmlElement (name = "Estado")
	private String estado;
	
	@XmlElement (name = "Funcao")
	private Funcao funcao;
	
	@XmlElement (name = "Situacao")
	private Membro_Situacao situacao;
	
	@XmlElement (name = "Descricao")
	private String descricao;
	
	@XmlElement (name = "Nascimento")
	private String nascimento;
	
	@XmlElement (name = "Naturalidade")
	private String naturalidade;
	
	@XmlElement (name = "Nome")
	private String nome;
	
	@XmlElement (name = "OrgaoRg")
	private OrgaoRg orgaorg;
	
	@XmlElement (name = "OrgaoRgEstado")
	private String orgaorgestado;
	
	@XmlElement (name = "Rg")
	private String rg;
	
	@XmlElement (name = "Sexo")
	private Sexo sexo;
	
	@XmlElement (name = "Telefone")
	private String telefone;
	
	@XmlElement (name = "Batismo_Espirito")
	private BatismoEspirito batismo_espirito;
	
	@XmlElement (name = "Estado_Natural")
	private String estado_natural;
	
	@XmlElement (name = "Civil")
	private String civil;
	
	@XmlElement (name = "Foto")
	private byte[] foto;
	
	@XmlElement (name = "IgrejaBean")
	private Igreja igrejaBean;
	
	@XmlElements(value = {@XmlElement(name = "Dizimo")})
	private List<Dizimo> dizimos;
	
	@Override
	public int compareTo(Membro o) {
		// TODO Auto-generated method stub
		return 0;
	}

}
