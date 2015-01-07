package br.com.igreja.entidades;

import java.io.Serializable;

import javax.persistence.*;

import br.com.igreja.enuns.PermissaoUsuarioEnum;


/**
 * The persistent class for the permissao_usuario database table.
 * 
 */
@Entity
@Table(name="permissao_usuario")
@NamedQuery(name="PermissaoUsuario.findAll", query="SELECT p FROM PermissaoUsuario p")
public class PermissaoUsuario implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name = "role")
	@Enumerated(EnumType.STRING)
	private PermissaoUsuarioEnum role;

	//bi-directional many-to-one association to Usuario
	@ManyToOne
	@JoinColumn(name="usuario_idusuario")
	private Usuario usuario1;

	public PermissaoUsuario() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getUsuario1() {
		return this.usuario1;
	}

	public void setUsuario1(Usuario usuario1) {
		this.usuario1 = usuario1;
	}
	
	public PermissaoUsuarioEnum getRole() {
		return role;
	}

	public void setRole(PermissaoUsuarioEnum role) {
		this.role = role;
	}
}