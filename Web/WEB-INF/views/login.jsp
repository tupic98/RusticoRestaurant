<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
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
<link rel="stylesheet" href="resources/css/login.css">
<meta charset="UTF-8">
<title>Rustico Restaurante</title>
<script src="resources/js/jquery-3.3.0.js"></script>
<script type="text/javascript">
	function validateCredentials(){
		var data = $("#loginForm").serialize();
		console.log(data);
		$.ajax({
			url: "${pageContext.request.contextPath}/validateCredentials",
			type: "POST",
			data: data,
			success: function(data){
				Swal.fire({
					position: 'top-end',
					title: 'Success!',
					text: data,
					type: 'success',
					showConfirmButton: false,
					timer: 1500,
				}).then(() => {
					localStorage.setItem('jwt', 'logged');
					window.location.href = "${pageContext.request.contextPath}/facilities"
				});
			},
			error: function(error) {
				Swal.fire({
					title: 'Error!',
					text: error.responseText,
					type: 'error',
					showConfirmButton: false,
					timer: 1800,
				});
			},
		});
	}
</script>
<body>
	<nav>
		<div class="nav-wrapper">
				<a class="brand-logo">Restaurante Rustico</a>
			<ul id="nav-mobile" class="right hide-on-med-and-down">
			</ul>
		</div>
	</nav>
	<div class="center-align">
		<div class="z-depth-1 grey lighten-4 row"
			style="margin: 22vh 40vh 0 40vh; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

			<f:form class="col s12" name="loginForm" id="loginForm"
				action="${pageContext.request.contextPath}/verifyCredentials"
				method="post" modelAttribute="usuario">
				<div class="row">
					<div class="col s12"></div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<f:input class="validate" type='text' name='user' id='user'
							path="uUsuario" />
						<label for='user'>Ingrese usuario</label>
					</div>
				</div>

				<div class='row'>
					<div class='input-field col s12'>
						<f:input class='validate' type='password' name='password'
							path="uClave" id='password' />
						<label for='password'>Ingrese su contraseña </label>
					</div>
				</div>
				<br />
				<div class="row center-align">
					<button type="button" name='btn_login'
						class='col s12 btn btn-large waves-effect indigo'
						onClick="validateCredentials()">Login</button>
				</div>
			</f:form>
		</div>
	</div>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var elems = document.querySelectorAll('select');
			var instances = M.FormSelect.init(elems);
		});
	</script>
</body>
</html>