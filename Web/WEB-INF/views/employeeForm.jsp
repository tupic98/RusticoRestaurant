<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<script src="resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="resources/css/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<meta charset="UTF-8">
<title>Rustico Restaurante</title>
</head>
<body>
	<h1>Datos del empleado</h1>
	<form:form action="${pageContext.request.contextPath}/saveEmployee"
		method="POST" modelAttribute="employee">
		<form:input type="hidden" name="idEmployee" path="cEmpleado"
			value="${employee.cEmpleado}" />
		<input type="hidden" name="idFacility" value="${idFacility}">
		<label>Ingrese el nombre de la sucursal: </label>
		<form:input type="text" name="eNombre" path="eNombre"
			value="${employee.eNombre}" />
		<br>
		<label>Ingrese la edad del empleado: </label>
		<form:input type="text" name="eEdad" path="eEdad"
			value="${employee.eEdad}" />
		<br>

		<label>Genero del empleado: </label>
		<form:radiobutton name="genero" path="eGenero" value="Femenino" />
		<label>Femenino</label>
		<form:radiobutton name="genero" path="eGenero" value="Masculino" />
		<label>Masculino</label>
		<br>

		<label>Estado del empleado: </label>
		<form:radiobutton name="estado" path="eEstado" value="true" />
		<label>Activo</label>
		<form:radiobutton name="estado" path="eEstado" value="false" />
		<label>Inactivo</label>
		<br>
		<input type="submit" value="save">
	</form:form>
</body>
</html>