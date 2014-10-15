package br.com.igreja.entidades;

import java.io.Serializable;

import javax.persistence.*;

import org.springframework.context.annotation.Scope;

import java.util.List;


/**
 * The persistent class for the usuario database table.
 * 
 */
@Scope("session")
@Entity
@Table(name="usuario")
@NamedQuery(name="Usuario.findAll", query="SELECT u FROM Usuario u")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idusuario;

	private String autorizacao;

	@Lob
	private byte[] foto;

	@Column(name="igreja_idigreja")
	private int igrejaIdigreja;

	private String role1;

	private String senha;
	
	private String login;

	//bi-directional many-to-one association to PermissaoUsuario
	@OneToMany(mappedBy="usuario1")
	private List<PermissaoUsuario> permissaoUsuarios1;

	public Usuario() {
	}

	public int getIdusuario() {
		return this.idusuario;
	}

	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}

	public String getAutorizacao() {
		return this.autorizacao;
	}

	public void setAutorizacao(String autorizacao) {
		this.autorizacao = autorizacao;
	}

	public byte[] getFoto() {
		return this.foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public int getIgrejaIdigreja() {
		return this.igrejaIdigreja;
	}

	public void setIgrejaIdigreja(int igrejaIdigreja) {
		this.igrejaIdigreja = igrejaIdigreja;
	}

	public String getRole1() {
		return this.role1;
	}

	public void setRole1(String role1) {
		this.role1 = role1;
	}

	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public List<PermissaoUsuario> getPermissaoUsuarios1() {
		return this.permissaoUsuarios1;
	}

	public void setPermissaoUsuarios1(List<PermissaoUsuario> permissaoUsuarios1) {
		this.permissaoUsuarios1 = permissaoUsuarios1;
	}

	public PermissaoUsuario addPermissaoUsuarios1(PermissaoUsuario permissaoUsuarios1) {
		getPermissaoUsuarios1().add(permissaoUsuarios1);
		permissaoUsuarios1.setUsuario1(this);

		return permissaoUsuarios1;
	}

	public PermissaoUsuario removePermissaoUsuarios1(PermissaoUsuario permissaoUsuarios1) {
		getPermissaoUsuarios1().remove(permissaoUsuarios1);
		permissaoUsuarios1.setUsuario1(null);

		return permissaoUsuarios1;
	}

}