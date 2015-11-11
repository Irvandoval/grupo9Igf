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
	
	CtrlASObservacion ctrlClase = (CtrlASObservacion) ac.getBean("ctrlASObservacion");

	List<ASClase> listTba = ctrlTba.daASClases();
	request.setAttribute("listaAplicativo", listTba);
	

	String id = request.getParameter("id");

	ASObservacion asc = ctrlClase.obtenerByID(Integer.parseInt(id));

	
	int idA = asc.getAsClase()
			.getcClase();
	request.setAttribute("idAplicativo", idA);
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
			action="http://localhost:8080/TareaIGFGrupo09/ASObservacionEditar.jsp">
			<div class="form-group">
				<label for="usr">id observacion:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_observacion"
					value="<%=asc.getcObservacion()%>">
			</div>
			
			<div class="form-group">
				<label for="usr">as clase:</label> <select name="id_as_clase"
					class="form-control text-center">
					<c:forEach var="tbAplicativo" items="${listaAplicativo}">


						<c:if test="${ tbAplicativo.cClase ==  idAplicativo}">
							<option value='${tbAplicativo.cClase}' selected>
								<c:out value="${tbAplicativo.dClase}"></c:out>
							</option>

						</c:if>
						<c:if test="${ tbAplicativo.cClase !=  idAplicativo}">
							<option value='${tbAplicativo.cClase}'>
								<c:out value="${tbAplicativo.dClase}"></c:out>
							</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group">
				<label for="usr">bactivo:</label> <input type="text"
					class="form-control text-center" name="bactivo"
					value="<%=asc.getbActivo()%>">
			</div>
			<div class="form-group">
				<label for="usr">nombre:</label> <input type="text"
					class="form-control text-center" name="nombre"
					value="<%=asc.getdObservacion()%>">
			</div>
			<div class="form-group">
				<label for="usr">usuario:</label> <input type="text"
					class="form-control text-center" name="usuario"
					value='<%=asc.getcUsuario()%>'>
			</div>
			<div class="form-group">
				<label for="usr">Fecha de ingreso:</label> <input type="text"
					class="form-control text-center" name="fecha"
					value="<%=asc.getfIngreso()%>">
			</div>
			<input type="submit" value="enviar" class="btn btn-success">
		</form>
	</div>
</body>
</html>