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
		 Integer idClase = null;
		 
          String strIdClase = request.getParameter("id_as_clase");
         if (!strIdClase.isEmpty()){
           idClase = Integer.parseInt(strIdClase);
         }
         String idTipoClase =  request.getParameter("id_tipo_clase");
         String idAplicativo =  request.getParameter("id_aplicativo");
    	 String nombre = request.getParameter("nombre");
    	 String usuario = request.getParameter("usuario");
    	 String fecha = request.getParameter("fecha");
    	 
    	 if(!idTipoClase.isEmpty() && !idAplicativo.isEmpty() && !nombre.isEmpty() && !usuario.isEmpty() && !fecha.isEmpty() ){
    	 ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
    	 CtrlTBAplicativo ctrlTba = (CtrlTBAplicativo) ac .getBean("ctrlTBAplicativo");
    	 CtrlTBTipoClase ctrlTbtc = (CtrlTBTipoClase) ac .getBean("ctrlTBTipoClase");
    	 
    	 CtrlASClase ctrlAsc = (CtrlASClase) ac .getBean("ctrlASClase");
    	 
    	 TBTipoClase tbtc = ctrlTbtc.obtenerByID(idTipoClase);
    	 TBAplicativo tba = ctrlTba.obtenerByID(idAplicativo);
    		
    	 ASClase asc = new ASClase(idClase,nombre,usuario,fecha,tbtc,tba);
         Boolean estado = ctrlAsc.agregar(asc);
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
<a href="/TareaIGFGrupo09/ASClasePpal.jsp" class="btn btn-success">Aceptar</a>
</body>
</html>