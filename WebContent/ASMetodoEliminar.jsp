<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="grupo09.negocio.*"%>
<%@ page import="org.springframework.context.*"%>
<%@ page import="org.springframework.context.support.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<%@ page import="grupo09.dominio.*"%>
<%
String mensaje = "Hubo un error al eliminar el registro.";
Integer id = Integer.parseInt(request.getParameter("id"));

ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
CtrlASMetodo ctrlMetodo = (CtrlASMetodo) ac.getBean("ctrlASMetodo");
Boolean estado = ctrlMetodo.eliminar(id);
if (estado) mensaje = "Se elimino el registro con exito.";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jq/jquery.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="navbar.html" %>
<%= mensaje %>
<a href="/TareaIGFGrupo09/ASMetodoPpal.jsp" class="btn btn-success">Aceptar</a>
</body>
</html>