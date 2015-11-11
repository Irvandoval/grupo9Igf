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
CtrlASClase ctrlTba = (CtrlASClase) ac.getBean("ctrlASClase");
CtrlASInterface ctrlTbtc = (CtrlASInterface) ac.getBean("ctrlASInterface");
List<ASClase> listTba = ctrlTba.daASClases();
request.setAttribute("listahijo", listTba);
List<ASInterface> listTtc = ctrlTbtc.daASInterface();
request.setAttribute("listapadre", listTtc);
CtrlASClaseInterface ctrlClase = (CtrlASClaseInterface) ac.getBean("CtrlASClaseInterface");


	String id = request.getParameter("id");

	ASClaseInterface asc = ctrlClase.obtenerByID(Integer.parseInt(id));

	String idTC = asc.getcClase().getdClase();
			
	String idA = asc.getcInterface().getdInterface();
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
		<h2>Nuevo ASInterfaceImplementa</h2>
		<form
			action="ASClaseInterfaceEditar.jsp">
			<div class="form-group">
				<label for="usr">id as_clase_interface:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_i_i"
					value="<%=asc.getcClaseInterface()%>">
			</div>
			<div class="form-group">
				<label for="usr">c_clase:</label> <select name="id_hijo"
					class="form-control text-center">
									
					<c:forEach var="lhijo" items="${listahijo}">
					  <c:if test="${ lhijo.dClase ==  idTipoC}">
						<option value='${lhijo.cClase}' selected>
							<c:out value="${lhijo.dClase}"></c:out>
						</option>
					</c:if>
					
					  <c:if test="${ lhijo.dClase !=  idTipoC}">
						<option value='${lhijo.cClase}'>
							<c:out value="${lhijo.dClase}"></c:out>
						</option>
					</c:if>
					</c:forEach>
				</select>

			</div>
			<div class="form-group">
				<label for="usr">c_interface:</label> <select name="id_padre"
					class="form-control text-center">
					<c:forEach var="tbAplicativo" items="${listapadre}">

					<c:if test="${ tbAplicativo.dInterface ==  idAplicativo}"> 
						<option value='${tbAplicativo.cInterface}' selected>
						<c:out value="${tbAplicativo.dInterface}"></c:out>
						</option>
					</c:if>
					<c:if test="${ tbAplicativo.dInterface !=  idAplicativo}"> 
						<option value='${tbAplicativo.cInterface}'>
						<c:out value="${tbAplicativo.dInterface}"></c:out>
						</option>
					</c:if>
					</c:forEach>
				</select>
			</div>
			<input type="submit" value="enviar" class="btn btn-success">
		</form>
	</div>
</body>
</html>