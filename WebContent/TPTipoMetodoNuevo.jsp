<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jq/jquery.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.min.js"></script>
<title>Agregar Nuevo</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="jq/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="navbar.html" %>
<div id="nuevo" class="content text-center">
	<h2>Nuevo TBTipoMetodo</h2>
		<form action="http://localhost:8080/TareaIGFGrupo09/TPTipoMetodoInsertar.jsp">
			<div class="form-group">
				<label for="usr">Id Metodo:</label> <input type="text"
					class="form-control text-center" name="id">
			</div>
			<div class="form-group">
				<label for="usr">Nombre Metodo:</label> <input type="text"
					class="form-control text-center" name="nombre">
			</div>
			<div class="form-group">
				<label for="usr">Fecha de Ingreso:</label> <input type="text"
					class="form-control text-center" name="fecha">
			</div>
			<input type="submit" value="enviar" class="btn btn-success">
		</form>
	</div>
</body>
</html>