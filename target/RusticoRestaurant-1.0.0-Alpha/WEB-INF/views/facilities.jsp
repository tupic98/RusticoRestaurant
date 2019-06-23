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
<link rel="stylesheet" href="resources/css/facilities.css">
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
	};

</script>
</head>
<body>
	<nav class="brown">
		<div class="nav-wrapper">
			<a href="${pageContext.request.contextPath}/" class="brand-logo">Restaurante
				Rustico</a>
			<ul id="nav-mobile" class="right hide-on-med-and-down">
			</ul>
		</div>
	</nav>
	<form action="${pageContext.request.contextPath}/createFacility"
		method="post">
		<input type="hidden" value="Agregar una sucursal nueva">
	</form>
	<div id="container"
		style="padding: 2vh 0 0 0; width: 100vw; display: flex; justify-content: center">
		<table class="striped highlight bordered centered center-align"
			style="max-width: 97%;">
			<tr>
				<th class="center-align brown darken-4 white-text">Nombre
					Sucursal</th>
				<th class="center-align brown darken-4 white-text">Ubicación</th>
				<th class="center-align brown darken-4 white-text">Horario</th>
				<th class="center-align brown darken-4 white-text">Numero de
					mesas</th>
				<th class="center-align brown darken-4 white-text">Nombre
					gerente</th>
				<th class="center-align brown darken-4 white-text">Acciones</th>
			</tr>
			<c:forEach items="${facilities}" var="facility">
				<tr>
					<td>${facility.sNombre}</td>
					<td>${facility.sUbicacion}</td>
					<td>${facility.sHorario}</td>
					<td>${facility.sNumeroMesas}</td>
					<td>${facility.sNombreGerente}</td>
					<td>
						<div class="row"
							style="display: flex; justify-content: center; margin-bottom: 0px !important;">
							<form action="${pageContext.request.contextPath}/updateFacility"
								method="post" class="col s12">
								<input type="hidden" value="${facility.cSucursal}"
									name="idFacility">
								<button class="btn-flat waves-effect waves-teal tooltipped"
									type="submit" name="Actualizar" data-position="top"
									data-tooltip="Editar sucursal: ${facility.sNombre}">
									<i class="material-icons">create</i>
								</button>
							</form>
							<form action="${pageContext.request.contextPath}/deleteFacility"
								method="post" class="col s12" name="deleteFacilityForm"
								id="deleteFacilityForm">
								<input type="hidden" value="${facility.cSucursal}"
									name="idFacility">
								<button onClick="deleteFacility(${facility.cSucursal})"
									class="btn-flat waves-effect waves-teal tooltipped"
									type="button" name="Actualizar" data-position="top"
									data-tooltip="Eliminar sucursal: ${facility.sNombre}">
									<i class="material-icons">delete</i>
								</button>
							</form>
							<form action="${pageContext.request.contextPath}/facilityProfile"
								method="get" class="col s12">
								<input type="hidden" value="${facility.cSucursal}"
									name="idFacility">
								<button 
									class="btn-flat waves-effect waves-teal tooltipped"
									type="submit" name="Actualizar" data-position="top"
									data-tooltip="Ver perfil de: ${facility.sNombre}">
									<i class="material-icons">account_circle</i>
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
				onclick="document.forms[0].submit(); return false;"
				class="btn-floating blue tooltipped" data-position="left"
				data-tooltip="Agregar sucursal"><i class="material-icons">add</i></a></li>
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