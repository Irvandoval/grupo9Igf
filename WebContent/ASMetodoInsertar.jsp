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
		 Integer idMetodo = null;
		 Integer idClase = null;
		 Integer idTPTipoMetodo = null;
          
          String strIdMetodo =  request.getParameter("id_metodo");
         if (!strIdMetodo.isEmpty()){
           idMetodo= Integer.parseInt(strIdMetodo);
         }
         String strIdClase = request.getParameter("id_clase");
         if (!strIdClase.isEmpty()){
         idClase = Integer.parseInt(strIdClase);
         }
                 
         String metodo =  request.getParameter("metodo");
         String TipoRetorno =  request.getParameter("tipo_retorno");    	 
    	 String usuario = request.getParameter("usuario");
    	 String fecha = request.getParameter("fecha");
    	 String activo = request.getParameter("activo");
    	 String nparametros = request.getParameter("n_parametros");
    	 
    	 String TpTipoMetodo =  request.getParameter("tbtipometodo");
    	 
    	 if(!strIdMetodo.isEmpty() && !strIdClase.isEmpty() && !TpTipoMetodo.isEmpty() && !metodo.isEmpty() && !TipoRetorno.isEmpty() && !usuario.isEmpty() && !fecha.isEmpty() && !activo.isEmpty() && !nparametros.isEmpty()){
    	 ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
    	 
    	 

    	 CtrlTBTipoMetodo ctrlTBTipoMetodo = (CtrlTBTipoMetodo) ac .getBean("ctrlTBTipoMetodo");
    	 CtrlASMetodo ctrlAsm = (CtrlASMetodo) ac .getBean("ctrlASMetodo");
    	 CtrlASClase ctrlAsc = (CtrlASClase) ac .getBean("ctrlASClase");
    	 
    	ASClase asc = ctrlAsc.obtenerByID(idClase);
         ASMetodo asm = ctrlAsm.obtenerByID(idMetodo);
         TBTipoMetodo tbm = ctrlTBTipoMetodo.obtenerByID(TpTipoMetodo);
    		
    	// ASMetodo Asm //= new ASMetodo(idClase,idMetodo,metodo,TipoRetorno,usuario,fecha,activo,nparametros,TpTipoMetodo,asc);
         //Boolean estado = ctrlAsm.agregar(Asm);
    	// if (estado) mensaje = "La inserción del dato ha sido exitosa.";
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