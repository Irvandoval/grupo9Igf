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
	
	CtrlASMetodo ctrlTbm = (CtrlASMetodo) ac
			.getBean("ctrlASMetodo");
	
	CtrlTBTipoAtributo ctrlTbtc = (CtrlTBTipoAtributo) ac
			.getBean("ctrlTBTipoAtributo");
	
	List<ASClase> listTba = ctrlTba.daASClases();
	request.setAttribute("listaASClase", listTba);
	
	List<ASMetodo> listTbm = ctrlTbm.daASClases();
	request.setAttribute("listaASMetodo", listTbm);
	
	List<TBTipoAtributo> listTtc = ctrlTbtc.daTBTipoAtributos();
	request.setAttribute("listaTBTipoAtributo", listTtc);
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
		<h2>Nuevo ASAtributo</h2>
		<form 
		     action="http://localhost:8080/TareaIGFGrupo09/ASAtributoInsertar.jsp">
			<div class="form-group">
				<label for="usr">id clase:</label> <select name="id_clase"
					class="form-control text-center">

					<c:forEach var="ASClase" items="${listaASClase}">
						<option value='${ASClase.cClase}'>
							<c:out value="${ASClase.cClase}"></c:out>
						</option>

					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="usr">id atributo:</label> <input type="text"
					class="form-control text-center" name="id_atributo">
			</div>
			<div class="form-group">
				<label for="usr">id metodo:</label> <select name="id_metodo"
					class="form-control text-center">

					<c:forEach var="ASClase" items="${listaASMetodo}">
						<option value='${ASClase.cMetodo}'>
							<c:out value="${ASClase.cMetodo}"></c:out>
						</option>

					</c:forEach>
				</select>
			</div>			

			<div class="form-group">
				<label for="usr">atributo:</label> <input type="text"
					class="form-control text-center" name="atributo">
			</div>			
			<div class="form-group">
				<label for="usr">tipo dato atributo:</label> <input type="text"
					class="form-control text-center" name="tipo_dato_atributo">
			</div>			
			<div class="form-group">
				<label for="usr">usuario:</label> <input type="text"
					class="form-control text-center" name="usuario">
			</div>
			<div class="form-group">
				<label for="usr">Fecha de ingreso:</label> <input type="text"
					class="form-control text-center" name="fecha">
			</div>
			<div class="form-group">
				<label for="usr">tipo atributo:</label> <select name="tipo_atributo"
					class="form-control text-center">

					<c:forEach var="ASClase" items="${listaTBTipoAtributo}">
						<option value='${ASClase.cTipoAtributo}'>
							<c:out value="${ASClase.cTipoAtributo}"></c:out>
						</option>

					</c:forEach>
				</select>
			</div>			
			<input type="submit" value="enviar" class="btn btn-success">
		</form>
	</div>
</body>
</html>