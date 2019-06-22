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
</head>
<body>
	<h1>Sucursal ${facility.sNombre}</h1>
	<div id="container2">
		<table class="striped" style="padding: 2vh 5vw 2vh 5vw">
			<tr>
				<th>Ubicacion</th>
				<th>Horario de atención</th>
				<th>Numero de mesas</th>
				<th>Gerente</th>
				<td>Acciones</td>
			</tr>
			<tr>
				<td>${facility.sUbicacion}</td>
				<td>${facility.sHorario}</td>
				<td>${facility.sNumeroMesas}</td>
				<td>${facility.sNombreGerente}</td>
				<td>
					<form action="${pageContext.request.contextPath}/deleteFacility"
						method="post">
						<input type="hidden" value="${facility.cSucursal}"
							name="idFacility"> <input type="submit" value="Eliminar">
					</form>
					<form action="${pageContext.request.contextPath}/addEmployee"
						method="post">
						<input type="hidden" value="${facility.cSucursal}"
							name="idFacility"> <input type="submit"
							value="Agregar Empleado">
					</form>
				</td>
			</tr>
		</table>

	</div>
	<div id="container3" style="padding: 2vh 5vw 2vh 5vw">
		<table>
			<tr>
				<th>Nombre Empleado</th>
				<th>Edad</th>
				<th>Genero</th>
				<th>Estado</th>
			</tr>
			<c:forEach items="${employees}" var="employees">
				<tr>
					<td>${employees.eNombre}</td>
					<td>${employees.eEdad}</td>
					<td>${employees.eGenero}</td>
					<td>${employees.estadoDelegate}</td>
					<td>
						<form action="${pageContext.request.contextPath}/updateEmployee"
							method="post">
							<input type="hidden" value="${facility.cSucursal}"
								name="idFacility"> <input type="hidden"
								value="${employees.cEmpleado}" name="idEmployee"> <input
								type="submit" value="Editar">
						</form>
						<form action="${pageContext.request.contextPath}/deleteEmployee"
							method="post">
							<input type="hidden" value="${facility.cSucursal}"
								name="idFacility"> <input type="hidden"
								value="${employees.cEmpleado}" name="ifEmployee"> <input
								type="submit" value="Eliminar">
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>

	</div>
</body>
</html>