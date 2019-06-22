package com.ralvarenga.rustico.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(schema = "public", name = "sucursal")
public class Sucursal {
	@Id
	@GeneratedValue(generator = "sucursal_c_sucursal_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "sucursal_c_sucursal_seq", sequenceName = "public.sucursal_c_sucursal_seq", allocationSize = 1)
	@Column(name = "c_sucursal")
	private Long cSucursal;

	@Column(name = "s_nombre")
	private String sNombre;

	@Column(name = "s_ubicacion")
	private String sUbicacion;

	@Column(name = "s_horario")
	private String sHorario;

	@Column(name = "s_nmesas")
	private Integer sNumeroMesas;

	@Column(name = "s_nomgerente")
	private String sNombreGerente;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "eSucursal", cascade = { CascadeType.MERGE, CascadeType.REFRESH,
			CascadeType.DETACH, CascadeType.REMOVE })
	private List<Empleado> empleados;

	public Sucursal() {
	}

	public Sucursal(Long cSucursal, String sNombre, String sUbicacion, String sHorario, Integer sNumeroMesas,
			String sNombreGerente, List<Empleado> empleados) {
		this.cSucursal = cSucursal;
		this.sNombre = sNombre;
		this.sUbicacion = sUbicacion;
		this.sHorario = sHorario;
		this.sNumeroMesas = sNumeroMesas;
		this.sNombreGerente = sNombreGerente;
		this.empleados = empleados;
	}

	public Long getcSucursal() {
		return cSucursal;
	}

	public void setcSucursal(Long cSucursal) {
		this.cSucursal = cSucursal;
	}

	public String getsNombre() {
		return sNombre;
	}

	public void setsNombre(String sNombre) {
		this.sNombre = sNombre;
	}

	public String getsUbicacion() {
		return sUbicacion;
	}

	public void setsUbicacion(String sUbicacion) {
		this.sUbicacion = sUbicacion;
	}

	public String getsHorario() {
		return sHorario;
	}

	public void setsHorario(String sHorario) {
		this.sHorario = sHorario;
	}

	public Integer getsNumeroMesas() {
		return sNumeroMesas;
	}

	public void setsNumeroMesas(Integer sNumeroMesas) {
		this.sNumeroMesas = sNumeroMesas;
	}

	public String getsNombreGerente() {
		return sNombreGerente;
	}

	public void setsNombreGerente(String sNombreGerente) {
		this.sNombreGerente = sNombreGerente;
	}

	public List<Empleado> getEmpleados() {
		return empleados;
	}

	public void setEmpleados(List<Empleado> empleados) {
		this.empleados = empleados;
	}

}
