package com.ralvarenga.rustico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ralvarenga.rustico.domain.Usuario;
import com.ralvarenga.rustico.repository.UsuarioRepository;

@Service
public class UsuarioServiceImpl implements UsuarioService {

	@Autowired
	UsuarioRepository usuarioRepository;

	@Override
	public Usuario loginUsuario(String username, String password) {
		return usuarioRepository.findByUUsuarioAndUClave(username, password);
	}

	@Override
	public List<Usuario> findAllUsers() {
		return usuarioRepository.findAll();
	}

	@Override
	public Usuario getUserById(Long id) {
		return usuarioRepository.findOne(id);
	}

}
