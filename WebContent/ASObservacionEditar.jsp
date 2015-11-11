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
	     String mensaje = "Hubo un error al editar el registro.";
		 Integer idClase = null;
		 Integer idasClase = null;
		 Integer bActivo = null;
		 
          String strIdClase = request.getParameter("id_observacion");
         if (!strIdClase.isEmpty()){
           idClase = Integer.parseInt(strIdClase);
         }
        
         String idAplicativo =  request.getParameter("id_as_clase");
         if (!idAplicativo.isEmpty()){
             idasClase = Integer.parseInt(idAplicativo);
           }
         
         String bactivo =  request.getParameter("bactivo");
         if (!bactivo.isEmpty()){
             bActivo = Integer.parseInt(bactivo);
           }
    	 String nombre = request.getParameter("nombre");
    	 String usuario = request.getParameter("usuario");
    	 String fecha = request.getParameter("fecha");
    	 
    	 if(!nombre.isEmpty() && !usuario.isEmpty() && !fecha.isEmpty() ){
    		 ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
        	 CtrlASClase ctrlTba = (CtrlASClase) ac.getBean("ctrlASClase");
        	 CtrlASObservacion ctrlAsc = (CtrlASObservacion) ac.getBean("ctrlASObservacion");
        	 
        	 
        	 ASClase tba = ctrlTba.obtenerByID(idasClase);
    	 
    		
        	 ASObservacion asc = new ASObservacion(idClase,nombre,usuario,fecha,bActivo,tba);
         Boolean estado = ctrlAsc.editar(asc);
    	 if (estado) mensaje = "La edición del dato ha sido exitosa.";
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
<a href="/TareaIGFGrupo09/ASObservacionPpal.jsp" class="btn btn-success">Aceptar</a>
</body>
</html>