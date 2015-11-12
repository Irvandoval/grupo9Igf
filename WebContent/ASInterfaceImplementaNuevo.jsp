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
	CtrlASInterface ctrlTba = (CtrlASInterface) ac.getBean("ctrlASInterface");
	CtrlASInterface ctrlTbtc = (CtrlASInterface) ac.getBean("ctrlASInterface");
	List<ASInterface> listTba = ctrlTba.daASInterface();
	request.setAttribute("listahijo", listTba);
	List<ASInterface> listTtc = ctrlTbtc.daASInterface();
	request.setAttribute("listapadre", listTtc);
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
			action="ASInterfaceImplementaInsertar.jsp">
			<div class="form-group">
				<label for="usr">id c_interface_implementa:</label> <input type="text"
					class="form-control text-center" name="id_i_i">
			</div>
			<div class="form-group">
				<label for="usr">c_interface_hijo:</label> <select name="id_hijo"
					class="form-control text-center">

					<c:forEach var="lhijo" items="${listahijo}">
						<option value='${lhijo.cInterface}'>
							<c:out value="${lhijo.dInterface}"></c:out>
						</option>

					</c:forEach>
				</select>

			</div>
			<div class="form-group">
				<label for="usr">c_interface_padre:</label> <select name="id_padre"
					class="form-control text-center">
					<c:forEach var="tbAplicativo" items="${listapadre}">


						<option value='${tbAplicativo.cInterface}'>

							<c:out value="${tbAplicativo.dInterface}"></c:out>
						</option>

					</c:forEach>
				</select>
			</div>
			<input type="submit" value="enviar" class="btn btn-success">
		</form>
	</div>
</body>
</html>