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
	<h1>Datos de la sucursal</h1>
	<form:form action="${pageContext.request.contextPath}/saveFacility"
		method="POST" modelAttribute="facility">
		<form:input type="hidden" name="code" path="cSucursal"
			value="${facility.cSucursal}" />
		<label>Ingrese el nombre de la sucursal: </label>
		<form:input type="text" name="name" path="sNombre"
			value="${facility.sNombre}" />
		<br>
		<label>Ingrese la ubicación de la sucursal: </label>
		<form:input type="text" name="ubic" path="sUbicacion"
			value="${facility.sUbicacion}" />
		<br>
		<label>Ingrese el horario de la sucursal: </label>
		<form:input type="text" name="horarios" path="sHorario"
			value="${facility.sHorario}" />
		<br>
		<label>Ingrese el numero de mesas: </label>
		<form:input type="number" name="numMesas" path="sNumeroMesas"
			value="${facility.sNumeroMesas}" />
		<br>
		<label>Ingrese el nombre del gerente a cargo de la sucursal: </label>
		<form:input type="text" name="nombGer" path="sNombreGerente"
			value="${facility.sNombreGerente}" />
		<br>
		<input type="submit" value="save">
	</form:form>
</body>
</html>