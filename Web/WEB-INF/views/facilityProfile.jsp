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
<link rel="stylesheet" href="resources/css/facilities.css">
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<meta charset="UTF-8">
<title>Rustico Restaurante</title>
<script src="resources/js/jquery-3.3.0.js"></script>
<script type="text/javascript">
	function deleteFacility(id){
		$.ajax({
			url: "${pageContext.request.contextPath}/deleteFacility",
			type: "POST",
			data: {idFacility: id},
			success: function(data){
				Swal.fire({
					title: 'Success!',
					text: data,
					type: 'success',
					showConfirmButton: false,
					timer: 1800,
				}).then(() => {
					window.location.href = "${pageContext.request.contextPath}/facilities"
				});
			},
			error: function(error) {
				Swal.fire({
					title: 'Oops!',
					text: error.responseText,
					type: 'error',
					showConfirmButton: false,
					timer: 1800,
				});
			},
		});
	}
	function deleteEmployee(idFacility, idEmployee){
		$.ajax({
			url: "${pageContext.request.contextPath}/deleteEmployee",
			type: "POST",
			data: {idFacility: idFacility, idEmployee: idEmployee},
			success: function(data){
				Swal.fire({
					title: 'Success!',
					text: data,
					type: 'success',
					showConfirmButton: false,
					timer: 1800,
				}).then(() => {
					window.location.href = "${pageContext.request.contextPath}/facilityProfile?idFacility=" + idFacility;
				});
			},
			error: function(error) {
				Swal.fire({
					title: 'Oops!',
					text: error.responseText,
					type: 'error',
					showConfirmButton: false,
					timer: 1800,
				});
			},
		});
	}
</script>
</head>
<body>
	<nav class="brown">
		<div class="nav-wrapper">
			<a class="brand-logo">Restaurante Rustico</a>
			<ul id="nav-mobile" class="right hide-on-med-and-down">
			</ul>
		</div>
	</nav>
	<h3 class="center-align">Perfil de sucursal "${facility.sNombre}"</h3>
	<div id="container2"
		style="width: 100vw; display: flex; justify-content: center;">
		<table class="striped centered center-align" style="max-width: 95%">
			<tr>
				<th class="center-align brown darken-4 white-text">Ubicacion</th>
				<th class="center-align brown darken-4 white-text">Horario de
					atención</th>
				<th class="center-align brown darken-4 white-text">Numero de
					mesas</th>
				<th class="center-align brown darken-4 white-text">Gerente</th>
			</tr>
			<tr>
				<td>${facility.sUbicacion}</td>
				<td>${facility.sHorario}</td>
				<td>${facility.sNumeroMesas}</td>
				<td>${facility.sNombreGerente}</td>

			</tr>
		</table>
		<form action="${pageContext.request.contextPath}/deleteFacility"
			method="post">
			<input type="hidden" value="${facility.cSucursal}" name="idFacility">
		</form>
		<form action="${pageContext.request.contextPath}/addEmployee"
			method="post">
			<input type="hidden" value="${facility.cSucursal}" name="idFacility">
		</form>
	</div>
	<h4 class="center-align">Listado de empleados</h4>
	<div id="container3" style="padding: 0 0 5vh 0; width: 100vw; display: flex; justify-content: center; align-content: center;">
		<table class="striped highlight bordered centered center-align" style="max-width:80%">
			<tr>
				<th class="center-align brown darken-4 white-text">Nombre
					Empleado</th>
				<th class="center-align brown darken-4 white-text">Edad</th>
				<th class="center-align brown darken-4 white-text">Genero</th>
				<th class="center-align brown darken-4 white-text">Estado</th>
				<th class="center-align brown darken-4 white-text">Acciones</th>
			</tr>
			<c:forEach items="${employees}" var="employee">
				<tr>
					<td>${employee.eNombre}</td>
					<td>${employee.eEdad}</td>
					<td>${employee.eGenero}</td>
					<td>${employee.estadoDelegate}</td>
					<td>
						<div class="row" style="display:flex; justify-content: center; margin-bottom: 0px !important;">
							<form action="${pageContext.request.contextPath}/updateEmployee"
								method="post" class="col s12">
								<input type="hidden" value="${facility.cSucursal}"
									name="idFacility"> <input type="hidden"
									value="${employee.cEmpleado}" name="idEmployee">
								<button class="btn-flat waves-effect waves-teal tooltipped"
									type="submit" name="Actualizar" data-position="top"
									data-tooltip="Editar empleado: ${employee.eNombre}">
									<i class="material-icons">create</i>
								</button>
							</form>
							<form action="${pageContext.request.contextPath}/deleteEmployee"
								method="post" class="col s12">
								<input type="hidden" value="${facility.cSucursal}"
									name="idFacility"> <input type="hidden"
									value="${employee.cEmpleado}" name="idEmployee">
								<button onClick="deleteEmployee(${facility.cSucursal}, ${employee.cEmpleado})" class="btn-flat waves-effect waves-teal tooltipped"
									type="button" name="Actualizar" data-position="top"
									data-tooltip="Eliminar empleado: ${employee.eNombre}">
									<i class="material-icons">delete</i>
								</button>
							</form>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="fixed-action-btn">
		<a class="btn-floating btn-large red"> <i
			class="large material-icons">dehaze</i>
		</a>
		<ul>
			<li><a href=""
				onclick="location.href='${pageContext.request.contextPath}/facilities'; return false;"
				class="btn-floating blue tooltipped" data-position="left"
				data-tooltip="Go home"><i class="material-icons">home</i></a></li>
			<li><a
				onClick="deleteFacility(${facility.cSucursal})"
				class="btn-floating red tooltipped" data-position="left"
				data-tooltip="Eliminar sucursal: ${facility.sNombre}"><i
					class="material-icons">delete</i></a></li>

			<li><a href=""
				onclick="document.forms[1].submit(); return false;"
				class="btn-floating green tooltipped" data-position="left"
				data-tooltip="Agregar empleado"><i class="material-icons">person_add</i></a></li>
		</ul>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.fixed-action-btn');
			var instances = M.FloatingActionButton.init(elems, {
				direction : 'top'
			});
		});
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.tooltipped');
			var instances = M.Tooltip.init(elems);
		});
	</script>
</body>
</html>