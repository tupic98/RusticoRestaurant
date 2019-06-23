<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="resources/css/materialize.min.css" />
<script src="resources/js/materialize.min.js"></script>
<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<link rel="stylesheet" href="resources/css/forms.css">
<meta charset="UTF-8">
<title>Rustico Restaurante</title>
</head>
<body>
	<nav class="brown">
		<div class="nav-wrapper">
			<a class="brand-logo">Restaurante Rustico</a>
			<ul id="nav-mobile" class="right hide-on-med-and-down">
			</ul>
		</div>
	</nav>
	<h1>Datos del empleado</h1>
	<form:form action="${pageContext.request.contextPath}/saveEmployee"
		method="POST" modelAttribute="employee">
		<form:input type="hidden" name="idEmployee" path="cEmpleado"
			value="${employee.cEmpleado}" />
			<input type="hidden" name="idFacility" value="${idFacility}">
		<div class="row">
			<div class="input-field col s12">
				<form:input class="validate" type='text' name='eNombre' id='eNombre'
					path="eNombre" value="${employee.eNombre}" />
				<label for='eNombre'>Ingrese el nombre del empleado:</label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<form:input class="validate" type='number' name='eEdad' id='eEdad'
					path="eEdad" value="${employee.eEdad}" />
				<label for='eEdad'>Ingrese la edad del empleado:</label>
			</div>
		</div>

		<div class="row">
			<h6>Genero del empleado: </h6> <label> <form:radiobutton
					name="genero" path="eGenero" value="Femenino"></form:radiobutton> <span>Femenino</span>
			</label> <label> <form:radiobutton name="genero" path="eGenero"
					value="Masculino"></form:radiobutton> <span>Masculino</span>
			</label>
		</div>

		<div class="row">
			<h6>Estado del empleado: </h6> <label> <form:radiobutton
					name="estado" path="eEstado" value="true"></form:radiobutton> <span>Activo</span>
			</label> <label> <form:radiobutton name="estado" path="eEstado"
					value="false"></form:radiobutton> <span>Inactivo</span>
			</label>
		</div>
		<div class="row right-align" style="width: calc(100vw - 32px);">
			<button
				class="btn btn-small green waves-effect waves-light right-align"
				type="submit" name="save">
				Guardar <i class="material-icons right">save</i>
			</button>
			<a
				onclick="history.go(-1); return false;"
				class="waves-effect btn btn-small waves-light red right-align"><i
				class="material-icons right">cancel</i>Cancelar</a>
		</div>
	</form:form>
</body>
</html>