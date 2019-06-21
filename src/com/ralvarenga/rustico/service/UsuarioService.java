package com.ralvarenga.rustico.service;

import java.util.List;

import com.ralvarenga.rustico.domain.Usuario;

public interface UsuarioService {
	public Usuario loginUsuario(String usuario, String password);

	public Usuario getUserById(Long id);

	public List<Usuario> findAllUsers();
}
