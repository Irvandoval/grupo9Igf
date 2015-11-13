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
	CtrlTBTipoAtributo ctrlTba = (CtrlTBTipoAtributo) ac.getBean("ctrlTBTipoAtributo");
	
	CtrlASAtributo ctrlAtributo = (CtrlASAtributo) ac.getBean("ctrlASAtributo");

	CtrlASMetodo ctrlTbtm = (CtrlASMetodo) ac.getBean("ctrlASMetodo");
	
	CtrlASClase ctrlClase = (CtrlASClase) ac.getBean("ctrlASClase");

	List<ASMetodo> listTtm = ctrlTbtm.daASMetodos();
    request.setAttribute("listaASMetodo", listTtm);
	
	List<TBTipoAtributo> listTba = ctrlTba.daTBTipoAtributos();
	request.setAttribute("listaTipoAtributo", listTba);
	
	List<ASClase> listTtc = ctrlClase.daASClases();
    request.setAttribute("listaASClase", listTtc);

	String id = request.getParameter("id");

	ASAtributo asc = ctrlAtributo.obtenerByID(Integer.parseInt(id));

	String idTa = asc.getTbTipoAtributo().getcTipoAtributo();
	Integer idC = asc.getAsClase().getcClase();
	Integer idM = asc.getAsMetodo().getcMetodo();
	request.setAttribute("idClase", idC);
	request.setAttribute("idAtributo", idTa);
	request.setAttribute("idMetodo", idM);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jq/jquery.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.min.js"></script>
<title>Editar ASAtributo</title>
</head>
<body>
	<%@ include file="navbar.html"%>
	<div id="nuevo" class="content text-center">
		<h2>Editar ASAtributo</h2>
		<form
			action="http://localhost:8080/TareaIGFGrupo09/ASAtributoEditar.jsp">
			<div class="form-group">
				<label for="usr">id clase:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_clase"
					value="<%=asc.getcClase()%>">
			</div>
			
			<div class="form-group">
				<label for="usr">id atributo:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_atributo"
					value="<%=asc.getcAtributo()%>">
			</div>
			<div class="form-group">
				<label for="usr">id metodo</label> <select name="id_metodo" 
					class="form-control text-center">

					<c:forEach var="tbASAtributo" items="${listaASMetodo}">

						<c:if test="${ tbASAtributo.cMetodo ==  idMetodo}">
							<option value='${tbASAtributo.cMetodo}' selected>
								<c:out value="${tbASAtributo.cMetodo}"></c:out>
							</option>

						</c:if>
						<c:if test="${ tbASAtributo.cMetodo !=  idMetodo}">
							<option value='${tbASAtributo.cMetodo}'>
								<c:out value="${tbASAtributo.cMetodo}"></c:out>
							</option>
						</c:if>

					</c:forEach>
				</select>

			</div>
			<div class="form-group">
				<label for="usr">atributo:</label> <input 
					type="text" class="form-control text-center" name="atributo"
					value="<%=asc.getdAtributo()%>">
			</div>
									<div class="form-group">
				<label for="usr">tipo datoatributo:</label> <input 
					type="text" class="form-control text-center" name="tipo_dato_atributo"
					value="<%=asc.getdTipoDatoAtributo()%>">
			</div>
			<div class="form-group">
				<label for="usr">usuario:</label> <input type="text"
					class="form-control text-center" name="usuario"
					value='<%=asc.getcUsuario()%>'>
			</div>
			<div class="form-group">
				<label for="usr">Fecha de ingreso:</label> <input type="text"
					class="form-control text-center" name="fecha"
					value="<%=asc.getFingreso()%>">
			</div>
			<div class="form-group">
				<label for="usr">id tipo atributo</label> <select name="tipo_atributo"
					class="form-control text-center">

					<c:forEach var="tbASAtributo" items="${listaTipoAtributo}">

						<c:if test="${ tbASAtributo.cTipoAtributo ==  idAtributo}">
							<option value='${tbASAtributo.cTipoAtributo}' selected>
								<c:out value="${tbASAtributo.cTipoAtributo}"></c:out>
							</option>

						</c:if>
						<c:if test="${ tbASAtributo.cTipoAtributo !=  idAtributo}">
							<option value='${tbASAtributo.cTipoAtributo}'>
								<c:out value="${tbASAtributo.cTipoAtributo}"></c:out>
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