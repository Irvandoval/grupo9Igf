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

CtrlASClase ctrlAsc = (CtrlASClase) ac
.getBean("ctrlASClase");

CtrlASMetodo ctrlAsm = (CtrlASMetodo) ac .getBean("ctrlASMetodo");


CtrlASParametro ctrlAsp = (CtrlASParametro) ac .getBean("ctrlASParametro");

List<ASParametro> listAsp = ctrlAsp.daASParametros();
request.setAttribute("listaASParametro", listAsp);

List<ASClase> listAsc = ctrlAsc.daASClases();
request.setAttribute("listaASClase", listAsc);

List<ASMetodo> listAsm = ctrlAsm.daASMetodos();
request.setAttribute("listaASMetodo", listAsm);

String id = request.getParameter("id");
ASParametro asp = ctrlAsp.obtenerByID(Integer.parseInt(id));



Integer idMet = asp.getAsMetodo().getcMetodo();
Integer idCla = asp.getAsClase().getcClase();

request.setAttribute("idClase", idCla);
request.setAttribute("idMetodo", idMet);
	
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
		<h2>Nuevo ASParametro</h2>
		<form
			action="http://localhost:8080/TareaIGFGrupo09/ASParametroEditar.jsp">
			<div class="form-group">
				<label for="usr">id clase:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_clase"
					value="<%=asp.getcClase()%>">
			</div>
			<div class="form-group">
				<label for="usr">id metodo:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_metodo"
					value="<%=asp.getcMetodo()%>">
			</div>
			
			
			<div class="form-group">
				<label for="usr">id parametro:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_parametro"
					value="<%=asp.getcPArametro()%>">
			</div>
			
			
			
			<div class="form-group">
				<label for="usr">parametro:</label> <input type="text"
					class="form-control text-center" name="parametro"
					value="<%=asp.getcPArametro()%>">
			</div>
			
			
			
			<div class="form-group">
				<label for="usr">tipo parametro:</label> <input type="text"
					class="form-control text-center" name="tipo_parametro"
				value="<%=asp.getcTipoParametro()%>">
			</div>
			
			
			<div class="form-group">
				<label for="usr">usuario:</label> <input type="text"
					class="form-control text-center" name="usuario"
				value="<%=asp.getcUsuario()%>">
			</div>
			
			
			<div class="form-group">
				<label for="usr">Fecha de ingreso:</label> <input type="text"
					class="form-control text-center" name="fecha"
					value="<%=asp.getfIngreso()%>">
			</div>
			<input type="submit" value="enviar" class="btn btn-success">
		</form>
	</div>
</body>
</html>