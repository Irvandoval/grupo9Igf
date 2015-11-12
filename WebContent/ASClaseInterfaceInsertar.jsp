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
		 Integer idHijo=null;
		 Integer idPadre=null;
          String strIdClase = request.getParameter("id_i_i");
         if (!strIdClase.isEmpty()){
           idClase = Integer.parseInt(strIdClase);
         }
         String id_hijo =  request.getParameter("id_hijo");
         if (!id_hijo.isEmpty()){
             idHijo = Integer.parseInt(id_hijo);
           }
         String id_padre =  request.getParameter("id_padre");
         if (!id_padre.isEmpty()){
             idPadre = Integer.parseInt(id_padre);
           }
    	 
    	 if(!id_hijo.isEmpty() && !id_padre.isEmpty() && !strIdClase.isEmpty() ){
    	 ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
    	 CtrlASClase crtlinterf1 = (CtrlASClase) ac .getBean("ctrlASClase");
    	 CtrlASInterface crtlinterf2 = (CtrlASInterface) ac .getBean("ctrlASInterface");
    	 CtrlASClaseInterface ctrlasii = (CtrlASClaseInterface) ac .getBean("CtrlASClaseInterface");
    	 
    	 ASClase interf1 = crtlinterf1.obtenerByID(idHijo); 
    	 ASInterface interf2 = crtlinterf2.obtenerByID(idPadre);
    		
    	 ASClaseInterface asii = new ASClaseInterface(idClase,interf1,interf2);
         Boolean estado = ctrlasii.agregar(asii);
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
<a href="/TareaIGFGrupo09/ASClaseInterfacePpal.jsp" class="btn btn-success">Aceptar</a>
</body>
</html>