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
	     String mensaje = "Hubo un error al insertar el registro.";
		 Integer idInterface = null;
          String strIdClase = request.getParameter("id_as_interface");
         if (!strIdClase.isEmpty()){
           idInterface = Integer.parseInt(strIdClase);
         }
    	 String des = request.getParameter("descripcion");
    	 String usuario = request.getParameter("usuario");
    	 String fecha = request.getParameter("fecha");
    	 
    	 if(!des.isEmpty() && !usuario.isEmpty() && !fecha.isEmpty() ){
    	 ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
    	
    	 CtrlASInterface ctrlAsi = (CtrlASInterface) ac.getBean("ctrlASInterface");
    	 
    	   		
    	 ASInterface asi = new ASInterface(idInterface,des,usuario,fecha);
         Boolean estado = ctrlAsi.agregar(asi);
    	 if (estado) mensaje = "La inserción del dato ha sido exitosa.";
    	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="jq/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mensaje del sistema</title>
</head>
<body>
<%@ include file="navbar.html"%>
<%= mensaje %>
<a href="/TareaIGFGrupo09/ASInterfacePpal.jsp" class="btn btn-success">Aceptar</a>
</body>
</html>