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
	$(document).ready(function() {
		if (!localStorage.getItem('jwt')) {
			window.location.href = "${pageContext.request.contextPath}/";
		}
	});
</script>
</head>
<body>
	<nav>
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
	<div id="container" style="padding: 2vh 5vw 2vh 5vw">
		<table class="striped">
			<tr>
				<th>Nombre Sucursal</th>
				<th>Ubicación</th>
				<th>Horario</th>
				<th>Numero de mesas</th>
				<th>Nombre gerente</th>
				<th>Acciones</th>
			</tr>
			<c:forEach items="${facilities}" var="facilities">
				<tr>
					<td>${facilities.sNombre}</td>
					<td>${facilities.sUbicacion}</td>
					<td>${facilities.sHorario}</td>
					<td>${facilities.sNumeroMesas}</td>
					<td>${facilities.sNombreGerente}</td>
					<td>
						<form action="${pageContext.request.contextPath}/updateFacility"
							method="post">
							<a href="" onclick="document.forms[1].submit(); return false;"
								class="waves-effect waves-light btn-small"><i
								class="material-icons right">update</i>Actualizar</a> <input
								type="hidden" value="${facilities.cSucursal}" name="idFacility">
						</form>
						<form action="${pageContext.request.contextPath}/deleteFacility"
							method="post">
							<a href="" onclick="document.forms[2].submit(); return false;"
								class="waves-effect red waves-light btn-small"><i
								class="material-icons right">cloud</i>Eliminar</a> <input
								type="hidden" value="${facilities.cSucursal}" name="idFacility">
						</form>
						<form action="${pageContext.request.contextPath}/facilityProfile"
							method="get">
							<a href="" onclick="document.forms[3].submit(); return false;"
								class="waves-effect blue waves-light btn-small"><i
								class="material-icons right">account_circle</i>Ver perfil</a> <input
								type="hidden" value="${facilities.cSucursal}" name="idFacility">
						</form>
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
				class="btn-floating red"><i class="material-icons">add</i></a></li>
		</ul>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('.fixed-action-btn');
			var instances = M.FloatingActionButton.init(elems, {
				direction : 'top'
			});
		});
	</script>
</body>
</html>