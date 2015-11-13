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
		 Integer idParametro = null;
		 Integer idClase = null;
		 Integer idMetodo = null;
          
          String stridParametro =  request.getParameter("id_parametro");
         if (!stridParametro.isEmpty()){
           idParametro = Integer.parseInt(stridParametro);
         }
         String strIdClase = request.getParameter("id_clase");
         if (!stridParametro.isEmpty()){
         idClase = Integer.parseInt(strIdClase);
         }
         String stridMetodo =  request.getParameter("id_metodo");
         if (!stridParametro.isEmpty()){
         idMetodo= Integer.parseInt(stridMetodo);
         }
         String parametro =  request.getParameter("parametro");
         String TipoParametro =  request.getParameter("tipo_parametro");    	 
    	 String usuario = request.getParameter("usuario");
    	 String fecha = request.getParameter("fecha");
    	 
    	 if(!parametro.isEmpty() && !TipoParametro.isEmpty() && !usuario.isEmpty() && !fecha.isEmpty() ){
    	 ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
    	 
    	 CtrlASMetodo ctrlAsm = (CtrlASMetodo) ac .getBean("ctrlASMetodo");
    	 CtrlASClase ctrlAsc = (CtrlASClase) ac .getBean("ctrlASClase");
    	 
    	// ASClase asc = ctrlAsc.obtenerByID(IdClase);
    ASMetodo asm = ctrlAsm.obtenerById(idMetodo);
    		
    	// ASMetodo asm = new ASMetodo(idClase,nombre,usuario,fecha,tbtc,tba);
        // Boolean estado = ctrlAsm.agregar(asm);
    	 //if (estado) mensaje = "La inserción del dato ha sido exitosa.";
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
<a href="/TareaIGFGrupo09/ASParametroPpal.jsp" class="btn btn-success">Aceptar</a>
</body>
</html>