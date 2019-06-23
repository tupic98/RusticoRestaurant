package com.ralvarenga.rustico.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ralvarenga.rustico.domain.Usuario;
import com.ralvarenga.rustico.service.UsuarioService;

@Controller
public class LoginController {

	@Autowired
	UsuarioService usuarioService;

	@GetMapping("/")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		Usuario usuario = new Usuario();
		mav.addObject("usuario", usuario);
		mav.setViewName("login");
		return mav;
	}

	@PostMapping("/validateCredentials")
	public @ResponseBody ResponseEntity<String> validate(@Valid @ModelAttribute Usuario usuario, BindingResult result) {
		if (result.hasErrors()) {
			return new ResponseEntity<String>("Either user or password field is incorrect", HttpStatus.NOT_FOUND);
		}
		if (usuarioService.loginUsuario(usuario.getuUsuario(), usuario.getuClave()) == null) {
			return new ResponseEntity<String>("Username or password incorrect!", HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("Login correct", HttpStatus.OK);
	}
}
