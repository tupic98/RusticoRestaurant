package com.ralvarenga.rustico.service;

import java.util.List;

import com.ralvarenga.rustico.domain.Empleado;

public interface EmpleadoService {
	public List<Empleado> findAllEmployees();

	public Empleado findEmployeeById(Long id);

	public Empleado saveEmployee(Empleado empleado);

	public void deleteEmployee(Long id);
}
