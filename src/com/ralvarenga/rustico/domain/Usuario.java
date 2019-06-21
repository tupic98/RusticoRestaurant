package com.ralvarenga.rustico.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(schema = "public", name = "usuario")
public class Usuario {
	@Id
	@GeneratedValue(generator = "usuario_c_usuario_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "usuario_c_usuario_seq", sequenceName = "public.usuario_c_usuario_seq", allocationSize = 1)
	@Column(name = "c_usuario")
	private Long cUsuario;

	@Column(name = "u_usuario")
	private String uUsuario;

	@Column(name = "u_clave")
	private String uClave;

	public Long getcUsuario() {
		return cUsuario;
	}

	public void setcUsuario(Long cUsuario) {
		this.cUsuario = cUsuario;
	}

	public String getuUsuario() {
		return uUsuario;
	}

	public void setuUsuario(String uUsuario) {
		this.uUsuario = uUsuario;
	}

	public String getuClave() {
		return uClave;
	}

	public void setuClave(String uClave) {
		this.uClave = uClave;
	}

	public Usuario(Long cUsuario, String uUsuario, String uClave) {
		this.cUsuario = cUsuario;
		this.uUsuario = uUsuario;
		this.uClave = uClave;
	}

	public Usuario() {
	}

}
