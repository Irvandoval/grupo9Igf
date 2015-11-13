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
CtrlTBTipoMetodo ctrlTBtm = (CtrlTBTipoMetodo) ac .getBean("ctrlTBTipoMetodo");



List<ASParametro> listAsp = ctrlAsp.daASParametros();
request.setAttribute("listaASParametro", listAsp);

List<ASClase> listAsc = ctrlAsc.daASClases();
request.setAttribute("listaASClase", listAsc);

List<TBTipoMetodo> listAsm = ctrlTBtm.daTBTipoMetodos();
request.setAttribute("listaTBTipoMetodo", listAsm);


String id = request.getParameter("id");
ASMetodo asm = ctrlAsm.obtenerByID(Integer.parseInt(id));

String idC = asm.getTbTipoMetodo().getcTipoMetodo();

request.setAttribute("idtipoMetodo", idC);


//Integer idMet = asm.getAsMetodo().getcMetodo();
Integer idCla = asm.getAsClase().getcClase();

request.setAttribute("idClase", idCla);
	
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
		<h2>Nuevo ASMetodo</h2>
		<form
			action="http://localhost:8080/TareaIGFGrupo09/ASMetodoEditar.jsp">
			<div class="form-group">
				<label for="usr">id clase:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_clase"
					value="<%=asm.getcClase()%>">
			</div>
			
			
			
			<div class="form-group">
				<label for="usr">id metodo:</label> <input readonly="readonly"
					type="text" class="form-control text-center" name="id_metodo"
					value="<%=asm.getcMetodo()%>">
			</div>
			
					
			
			<div class="form-group">
				<label for="usr">metodo:</label> <input type="text"
					class="form-control text-center" name="metodo"
					value="<%=asm.getdMetodo()%>">
			</div>
			
			
			
			<div class="form-group">
				<label for="usr">tipo retorno:</label> <input type="text"
					class="form-control text-center" name="tipo_retorno"
					value="<%=asm.getdTipoRetorno()%>">
			</div>
			
			<div class="form-group">
				<label for="usr">usuario:</label> <input type="text"
					class="form-control text-center" name="usuario"
					value="<%=asm.getcUsuario()%>">
			</div>
			
			
			<div class="form-group">
				<label for="usr">Fecha de ingreso:</label> <input type="text"
					class="form-control text-center" name="fecha"
					value="<%=asm.getfIngreso()%>">
			</div>
			
			<div class="form-group">
				<label for="usr">activo:</label> <input type="text"
					class="form-control text-center" name="activo"
					value="<%=asm.getbActivo()%>">
			</div>
			
			<div class="form-group">
				<label for="usr">numero parametros:</label> <input type="text"
					class="form-control text-center" name="n_parametros"
					value="<%=asm.getnParametros()%>">
			</div>
			
			<div class="form-group">
				<label for="usr">id tipo metodo:</label> <select name="tbtipometodo"
					class="form-control text-center">

					<c:forEach var="tbASAtributo" items="${listaTBTipoMetodo}">

						<c:if test="${ tbASAtributo.cTipoMetodo ==  idtipoMetodo}">
							<option value='${tbASAtributo.cTipoMetodo}' selected>
								<c:out value="${tbASAtributo.cTipoMetodo}"></c:out>
							</option>

						</c:if>
						<c:if test="${ tbASAtributo.cTipoMetodo !=  idtipoMetodo}">
							<option value='${tbASAtributo.cTipoMetodo}'>
								<c:out value="${tbASAtributo.cTipoMetodo}"></c:out>
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