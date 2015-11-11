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
		 Integer idAtributo = null;
          String strIdAtributo = request.getParameter("id_atributo");
         if (!strIdAtributo.isEmpty()){
           idAtributo = Integer.parseInt(strIdAtributo);
         }
         
		 Integer idClase = null;
         String strIdClase = request.getParameter("id_clase");
        if (!strIdClase.isEmpty()){
          idClase = Integer.parseInt(strIdClase);
        } 

		 Integer idMetodo = null;
         String strIdMetodo = request.getParameter("id_metodo");
        if (!strIdMetodo.isEmpty()){
          idMetodo = Integer.parseInt(strIdMetodo);
        }        
        
         String Atributo =  request.getParameter("atributo");
    	 String T_d_atributo = request.getParameter("tipo_dato_atributo");
    	 String Usuario = request.getParameter("usuario");
    	 String Fecha = request.getParameter("fecha");
    	 String T_atributo = request.getParameter("tipo_atributo");
    	 
    	 if(!Atributo.isEmpty() && !T_d_atributo.isEmpty() && !Usuario.isEmpty() && !Fecha.isEmpty() ){
    	 ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
    	 CtrlTBTipoAtributo ctrlTba = (CtrlTBTipoAtributo) ac .getBean("ctrlTBTipoAtributo");
    	 CtrlASClase ctrlTbtc = (CtrlASClase) ac .getBean("ctrlASClase");    	 
    	 CtrlASAtributo ctrlAsc = (CtrlASAtributo) ac .getBean("ctrlASAtributo");
    	 CtrlASMetodo ctrlAsm = (CtrlASMetodo) ac .getBean("ctrlASMetodo");

    	 TBTipoAtributo tbta = ctrlTba.obtenerByID(T_atributo);
    	 ASClase tbtc = ctrlTbtc.obtenerByID(idClase);
    	 ASMetodo tbtm = ctrlAsm.obtenerByID(idMetodo);

     	
 		
    	 ASAtributo asc = new ASAtributo(idAtributo,Atributo,T_d_atributo,Usuario,Fecha,tbta,tbtc,tbtm);
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
<a href="/TareaIGFGrupo09/ASAtributoPpal.jsp" class="btn btn-success">Aceptar</a>
</body>
</html>