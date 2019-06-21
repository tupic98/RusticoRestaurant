package com.ralvarenga.rustico.service;

import java.util.List;

import com.ralvarenga.rustico.domain.Sucursal;

public interface SucursalService {
	public List<Sucursal> getAllSucursales();

	public Sucursal getSucursalById(Long id);

	public Sucursal saveSucursal(Sucursal sucursal);

	public void deleteSucursal(Long id);
}
