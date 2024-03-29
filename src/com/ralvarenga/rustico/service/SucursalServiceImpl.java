package com.ralvarenga.rustico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ralvarenga.rustico.domain.Sucursal;
import com.ralvarenga.rustico.repository.SucursalRepository;

@Service
public class SucursalServiceImpl implements SucursalService {

	@Autowired
	SucursalRepository sucursalRepository;

	@Override
	public List<Sucursal> getAllSucursales() {
		return sucursalRepository.findAll();
	}

	@Override
	public Sucursal getSucursalById(Long id) {
		return sucursalRepository.findOne(id);
	}

	@Override
	public Sucursal saveSucursal(Sucursal sucursal) {
		return sucursalRepository.saveAndFlush(sucursal);
	}

	@Override
	public void deleteSucursal(Long id) {
		sucursalRepository.delete(id);
	}

}
