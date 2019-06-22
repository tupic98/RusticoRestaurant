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
<meta charset="UTF-8">
<title>Rustico Restaurante</title>

</head>
<body>
	<form action="${pageContext.request.contextPath}/createFacility" method="post">
		<input type="submit" value="Agregar una sucursal nueva">
	</form>

	<table>
		<tr>
			<th>Nombre Sucursal</th>
			<th>Ubicación</th>
			<th>Horario</th>
			<th>Numero de mesas</th>
			<th>Nombre gerente</th>
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
						<input type="hidden" value="${facilities.cSucursal}" name="idFacility">
						<input type="submit" value="Editar">
					</form>
					<form action="${pageContext.request.contextPath}/deleteFacility"
						method="post">
						<input type="hidden" value="${facilities.cSucursal}" name="idFacility">
						<input type="submit" value="Eliminar">
					</form>
					<form action="${pageContext.request.contextPath}/facilityProfile"
						method="get">
						<input type="hidden" value="${facilities.cSucursal}" name="idFacility">
						<input type="submit" value="Ver Perfil">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>