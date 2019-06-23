package com.ralvarenga.rustico.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ralvarenga.rustico.domain.Empleado;
import com.ralvarenga.rustico.repository.EmpleadoRepository;

@Service
public class EmpleadoServiceImpl implements EmpleadoService {

	@Autowired
	EmpleadoRepository empleadoRepository;

	@Override
	public List<Empleado> findAllEmployees() {
		return empleadoRepository.findAll();
	}

	@Override
	public Empleado findEmployeeById(Long id) {
		return empleadoRepository.findOne(id);
	}

	@Override
	public Empleado saveEmployee(Empleado empleado) {
		return empleadoRepository.saveAndFlush(empleado);
	}

	@Override
	public void deleteEmployee(Long id) {
		empleadoRepository.delete(id);
	}

}
