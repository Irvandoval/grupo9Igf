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
	CtrlTBAplicativo ctrlTba = (CtrlTBAplicativo) ac
			.getBean("ctrlTBAplicativo");
	CtrlTBTipoClase ctrlTbtc = (CtrlTBTipoClase) ac
			.getBean("ctrlTBTipoClase");
	CtrlASClase ctrlClase = (CtrlASClase) ac.getBean("ctrlASClase");

	List<TBAplicativo> listTba = ctrlTba.daTBAplicativos();
	request.setAttribute("listaAplicativo", listTba);
	List<TBTipoClase> listTtc = ctrlTbtc.daTBTipoClases();

	request.setAttribute("listaTipoClase", listTtc);

	String id = request.getParameter("id");
	ASClase asc = ctrlClase.obtenerByID(Integer.parseInt(id));

	
	String idTC = asc.getTbTipoClase()
			.getcTipoClase();
	String idA = asc.getTbAplicativo().getcAplicativo();
	request.setAttribute("idTipoC", idTC);
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
		<h2>Nuevo ASClase</h2>
		<form
			action="http://localhost:8080/TareaIGFGrupo09/ASClaseEditar.jsp">
			<div class="form-group">
				<label for="usr">id as_clase:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_as_clase"
					value="<%=asc.getcClase()%>">
			</div>
			
			
			<div class="form-group">
				<label for="usr">tipo clase:</label> <select name="id_tipo_clase"
					class="form-control text-center">

					<c:forEach var="tbTClase" items="${listaTipoClase}">

						<c:if test="${ tbTClase.cTipoClase ==  idTipoC}">
							<option value='${tbTClase.cTipoClase}' selected>
								<c:out value="${tbTClase.dTipoClase}"></c:out>
							</option>

						</c:if>
						<c:if test="${ tbTClase.cTipoClase !=  idTipoC}">
							<option value='${tbTClase.cTipoClase}'>
								<c:out value="${tbTClase.dTipoClase}"></c:out>
							</option>
						</c:if>

					</c:forEach>
				</select>

			</div>
			<div class="form-group">
				<label for="usr">aplicativo:</label> <select name="id_aplicativo"
					class="form-control text-center">
					<c:forEach var="tbAplicativo" items="${listaAplicativo}">


						<c:if test="${ tbAplicativo.cAplicativo ==  idAplicativo}">
							<option value='${tbAplicativo.cAplicativo}' selected>
								<c:out value="${tbAplicativo.dAplicativo}"></c:out>
							</option>

						</c:if>
						<c:if test="${ tbAplicativo.cAplicativo !=  idAplicativo}">
							<option value='${tbAplicativo.cAplicativo}'>
								<c:out value="${tbAplicativo.dAplicativo}"></c:out>
							</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<label for="usr">nombre:</label> <input type="text"
					class="form-control text-center" name="nombre"
					value="<%=asc.getdClase()%>">
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