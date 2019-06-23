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
<script src="resources/js/jquery-3.3.0.js"></script>
<script type="text/javascript">
	function saveFacility(){
		var data = $("#facilityForm").serialize();
		console.log(data);
		$.ajax({
			url: "${pageContext.request.contextPath}/saveFacility",
			type: "POST",
			data: data,
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
	<h3 class="center-align">Datos de la sucursal</h3>
	<form:form action="${pageContext.request.contextPath}/saveFacility"
		method="POST" modelAttribute="facility" id="facilityForm"
		name="facilityForm">
		<form:input type="hidden" name="code" id="code" path="cSucursal"
			value="${facility.cSucursal}" />

		<div class="row" style="margin: 0 2vw 0 2vw;">
			<div class="input-field col s6">
				<form:input class="validate" type='text' name='name' id='name'
					path="sNombre" value="${facility.sNombre}" />
				<label for='name'>Ingrese el nombre de la sucursal:</label>
				<form:errors path="sNombre" cssStyle="color:#ff0000;"></form:errors>
			</div>
			<div class="input-field col s6">
				<form:input class="validate" type='text' name='ubic' id='ubic'
					path="sUbicacion" value="${facility.sUbicacion}" />
				<label for='ubic'>Ingrese la ubicación de la sucursal:</label>
				<form:errors path="sUbicacion" cssStyle="color:#ff0000;"></form:errors>
			</div>

		</div>
		<div class="row" style="margin: 0 2vw 0 2vw;">
			<div class="input-field col s5">
				<form:input class="validate" type='text' name='horario' id='horario'
					path="sHorario" value="${facility.sHorario}" />
				<label for='horario'>Ingrese el horario de la sucursal:</label>
				<form:errors path="sHorario" cssStyle="color:#ff0000;"></form:errors>
			</div>

			<div class="input-field col s5">
				<form:input class="validate" type='text' name='nomGerente'
					id='nomGerente' path="sNombreGerente"
					value="${facility.sNombreGerente}" />
				<label for='nomGerente'>Ingrese el nombre del gerente a
					cargo de la sucursal:</label>
				<form:errors path="sNombreGerente" cssStyle="color:#ff0000;"></form:errors>
			</div>
			<div class="input-field col s2">
				<form:input class="validate" type='number' min="0" name='numMesas'
					id='numMesas' path="sNumeroMesas" value="${facility.sNumeroMesas}" />
				<label for='numMesas'>Ingrese la cantidad de mesas:</label>
				<form:errors path="sNumeroMesas" cssStyle="color:#ff0000;"></form:errors>
			</div>
		</div>
		<div class="row right-align" style="width: calc(100vw - 32px);">
			<button
				class="btn btn-small green waves-effect waves-light right-align"
				type="button" name="save" onClick="saveFacility()">
				Guardar <i class="material-icons right">save</i>
			</button>
			<a
				onclick="location.href='${pageContext.request.contextPath}/facilities'"
				class="waves-effect btn btn-small waves-light red right-align"><i
				class="material-icons right">cancel</i>Cancelar</a>
		</div>
	</form:form>
</body>
</html>