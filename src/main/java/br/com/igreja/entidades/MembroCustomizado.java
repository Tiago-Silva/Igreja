package br.com.igreja.entidades;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "membro")
@XmlAccessorType(XmlAccessType.FIELD)
public class MembroCustomizado implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int idmembro;
	
	private String nome;
	
	public MembroCustomizado() {}
	
	public MembroCustomizado(int idmembro, String nome) {
		this.idmembro = idmembro;
		this.nome = nome;
	}

	public int getIdmembro() {
		return idmembro;
	}

	public void setIdmembro(int idmembro) {
		this.idmembro = idmembro;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
}
