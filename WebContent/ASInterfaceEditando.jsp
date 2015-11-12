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

	CtrlASInterface ctrlInterface = (CtrlASInterface) ac.getBean("ctrlASInterface");


	String id = request.getParameter("id");

	ASInterface asi = ctrlInterface.obtenerByID(Integer.parseInt(id));

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
		<h2>Editar ASInterface</h2>
		<form
			action="ASInterfaceEditar.jsp" method="post">
			<div class="form-group">
				<label for="usr">id as_interface:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_as_interface"
					value="<%=asi.getcInterface()%>">
			</div>
			
			
			<div class="form-group">
				<label for="usr">nombre:</label> <input type="text"
					class="form-control text-center" name="descripcion"
					value="<%=asi.getdInterface()%>">
			</div>
			<div class="form-group">
				<label for="usr">usuario:</label> <input type="text"
					class="form-control text-center" name="usuario"
					value='<%=asi.getcUsuario()%>'>
			</div>
			<div class="form-group">
				<label for="usr">Fecha de ingreso:</label> <input type="text"
					class="form-control text-center" name="fecha"
					value="<%=asi.getfIngreso()%>">
			</div>
			<input type="submit" value="enviar" class="btn btn-success">
		</form>
	</div>
</body>
</html>