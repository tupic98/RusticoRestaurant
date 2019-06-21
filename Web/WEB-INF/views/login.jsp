<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<body>
	<div class="center-align">
		<div class="z-depth-1 grey lighten-4 row"
			style="margin: 28vh 40vh 0 40vh; padding: 32px 48px 0px 48px; border: 1px solid #EEE;">

			<form class="col s12"
				action="${pageContext.request.contextPath}/verifyCredentials"
				method="post">
				<div class="row">
					<div class="col s12"></div>
				</div>

				<div class="row">
					<div class="input-field col s12">
						<input class="validate" type='text' name='user' id='user' /> <label
							for='user'>Ingrese usuario</label>
					</div>
				</div>

				<div class='row'>
					<div class='input-field col s12'>
						<input class='validate' type='password' name='password'
							id='password' /> <label for='password'>Ingrese su
							contraseña </label>
					</div>
				</div>
				<br />
				<div class="row center-align">
					<button type='submit' name='btn_login'
						class='col s12 btn btn-large waves-effect indigo'>Login</button>
				</div>
			</form>
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