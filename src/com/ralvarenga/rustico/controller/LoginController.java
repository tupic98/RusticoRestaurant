package com.ralvarenga.rustico.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		Usuario user = new Usuario();
		mav.addObject("user", user);
		mav.setViewName("login");
		return mav;
	}

	@PostMapping("/verifyCredentials")
	public ModelAndView validateCredentials(@RequestParam(value = "user") String username,
			@RequestParam(value = "password") String password, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		if (usuarioService.loginUsuario(username, password) == null) {
			mav.addObject("message", "Username or password is wrong! Please try again");
			mav.setViewName("login");
			return mav;
		}
		return new ModelAndView("redirect:/facilities");
	}

}
