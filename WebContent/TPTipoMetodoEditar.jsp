<%@page import="org.apache.catalina.connector.Request"%>
<%@ page import="grupo09.negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="org.springframework.context.*"%>
<%@ page import="org.springframework.context.support.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<%@ page import="grupo09.dominio.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
         String mensaje = "Hubo un error al editar el registro.";
         String id =  request.getParameter("id");
    	 String nombre = request.getParameter("nombre");
    	 String fecha = request.getParameter("fecha");
    	 TBTipoMetodo tbtc = new TBTipoMetodo(id,nombre,fecha);
    	 ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
    	 CtrlTBTipoMetodo ctrlTbtc = (CtrlTBTipoMetodo) ac.getBean("ctrlTBTipoMetodo");
    	 Boolean estado = ctrlTbtc.editar(tbtc);
    	 if (estado) mensaje = "La edición del dato ha sido exitosa.";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jq/jquery.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.min.js"></script>
<title>Editar</title>
</head>
<body>
<%@ include file="navbar.html" %>
<%= mensaje%>
<a href="/TareaIGFGrupo09/TPTipoMetodoPpal.jsp" class="btn btn-success">Aceptar</a>
</body>
</html>