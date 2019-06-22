package com.ralvarenga.rustico.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(schema = "public", name = "empleado")
public class Empleado {

	@Id
	@GeneratedValue(generator = "empleado_c_empleado_seq", strategy = GenerationType.AUTO)
	@SequenceGenerator(name = "empleado_c_empleado_seq", sequenceName = "public.empleado_c_empleado_seq", allocationSize = 1)
	@Column(name = "c_empleado")
	private Long cEmpleado;

	@Column(name = "e_nombre")
	private String eNombre;

	@Column(name = "e_edad")
	private Integer eEdad;

	@Column(name = "e_genero")
	private String eGenero;

	@Column(name = "e_estado")
	private Boolean eEstado;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "e_sucursal")
	private Sucursal eSucursal;

	public Empleado() {
	}

	public Empleado(Long cEmpleado, String eNombre, Integer eEdad, String eGenero, Boolean eEstado,
			Sucursal eSucursal) {
		this.cEmpleado = cEmpleado;
		this.eNombre = eNombre;
		this.eEdad = eEdad;
		this.eGenero = eGenero;
		this.eEstado = eEstado;
		this.eSucursal = eSucursal;
	}

	public Long getcEmpleado() {
		return cEmpleado;
	}

	public void setcEmpleado(Long cEmpleado) {
		this.cEmpleado = cEmpleado;
	}

	public String geteNombre() {
		return eNombre;
	}

	public void seteNombre(String eNombre) {
		this.eNombre = eNombre;
	}

	public Integer geteEdad() {
		return eEdad;
	}

	public void seteEdad(Integer eEdad) {
		this.eEdad = eEdad;
	}

	public String geteGenero() {
		return eGenero;
	}

	public void seteGenero(String eGenero) {
		this.eGenero = eGenero;
	}

	public Boolean geteEstado() {
		return eEstado;
	}

	public void seteEstado(Boolean eEstado) {
		this.eEstado = eEstado;
	}

	public Sucursal geteSucursal() {
		return eSucursal;
	}

	public void seteSucursal(Sucursal eSucursal) {
		this.eSucursal = eSucursal;
	}

	public String getEstadoDelegate() {
		return this.eEstado == null ? "" : this.eEstado == true ? "Activo" : "Inactivo";
	}

}
