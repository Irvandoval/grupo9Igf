<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="org.apache.catalina.connector.Request"%>
<%@ page import="grupo09.negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="org.springframework.context.*"%>
<%@ page import="org.springframework.context.support.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<%@ page import="grupo09.dominio.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%
	ApplicationContext ac = WebApplicationContextUtils
			.getRequiredWebApplicationContext(getServletContext());
	CtrlASClase ctrlTba = (CtrlASClase) ac
			.getBean("ctrlASClase");
	List<ASClase> listTba = ctrlTba.daASClases();
	request.setAttribute("listaASClase", listTba);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jq/jquery.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.min.js"></script>
<title>Agregar Nuevo</title>
</head>
<body>
	<%@ include file="navbar.html"%>
	<div id="nuevo" class="content text-center">
		<h2>Nuevo ASObservacion</h2>
		<form
			action="http://localhost:8080/TareaIGFGrupo09/ASObservacionInsertar.jsp">
			<div class="form-group">
				<label for="usr">id Observacion:</label> <input type="text"
					class="form-control text-center" name="id_observacion">
			</div>
			<div class="form-group">
				<label for="usr"> as clase:</label> <select name="id_as_clase"
					class="form-control text-center">

					<c:forEach var="tbTClase" items="${listaASClase}">
						<option value='${tbTClase.cClase}'>
							<c:out value="${tbTClase.dClase}"></c:out>
						</option>

					</c:forEach>
				</select>

			</div>
			
			<div class="form-group">
				<label for="usr">b Activo:</label> <input type="text"
					class="form-control text-center" name="bactivo">
			</div>
			
			<div class="form-group">
				<label for="usr">nombre:</label> <input type="text"
					class="form-control text-center" name="nombre">
			</div>
			<div class="form-group">
				<label for="usr">usuario:</label> <input type="text"
					class="form-control text-center" name="usuario">
			</div>
			<div class="form-group">
				<label for="usr">Fecha Creacion:</label> <input type="text"
					class="form-control text-center" name="fecha">
			</div>
			<input type="submit" value="enviar" class="btn btn-success">
		</form>
	</div>
</body>
</html>