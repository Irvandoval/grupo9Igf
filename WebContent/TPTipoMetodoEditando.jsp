<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="grupo09.negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="org.springframework.context.*"%>
<%@ page import="org.springframework.context.support.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<%@ page import="grupo09.dominio.*"%>
<%
String id =  request.getParameter("id");
ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
CtrlTBTipoMetodo ctrlTbtc = (CtrlTBTipoMetodo) ac.getBean("ctrlTBTipoMetodo");
TBTipoMetodo tbtc = ctrlTbtc.obtenerByID(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jq/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%@ include file="navbar.html" %>
<div id="nuevo" class="content text-center">
	<h2>Editar TBTipoMetodo</h2>
		<form action="http://localhost:8080/TareaIGFGrupo09/TPTipoMetodoEditar.jsp">
			<div class="form-group">
				<label for="usr">Id Metodo:</label> 
				<input type="text" class="form-control text-center" name="id" value="<%= tbtc.getcTipoMetodo() %>" readonly="readonly" />
			</div>
			<div class="form-group">
				<label for="usr">Nombre Metodo:</label> <input type="text"
					class="form-control text-center" name="nombre" value="<%= tbtc.getdTipoMetodo() %>"/>
			</div>
			<div class="form-group">
				<label for="usr">Fecha de ingreso:</label> <input type="text"
					class="form-control text-center" name="fecha" value="<%= tbtc.getfIngreso() %>" />
			</div>
			<input type="submit" value="Editar" class="btn btn-success"/>
		</form>
	</div>
</body>
</html>