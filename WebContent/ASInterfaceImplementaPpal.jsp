<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="grupo09.negocio.*"%>
<%@ page import="java.util.List"%>
<%@ page import="org.springframework.context.*"%>
<%@ page import="org.springframework.context.support.*"%>
<%@ page import="org.springframework.web.context.support.*"%>
<%@ page import="grupo09.dominio.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%
	ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(getServletContext());
	CtrlASInterfaceImplementa ctrlAsii = (CtrlASInterfaceImplementa) ac.getBean("ctrlASInterfaceImplementa");
	List<ASInterfaceImplementa> list = ctrlAsii.daASInterfaceImplementas();
	request.setAttribute("eList", list);
%>
<title>Prueba</title>
<script src="jq/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.html" %>
	<div class="content text-center" id="tabla">
	     <div class="panel panel-success">
  <!-- Default panel contents -->
  <div class="panel-heading success"><h4>Tabla ASInterfaceImplementa</h4> 
    <a href="/TareaIGFGrupo09/ASInterfaceImplementaNuevo.jsp" class="btn btn-success">+ Nuevo</a>
  </div>
		
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">id cInterfaceImplementa</th>
					<th class="text-center">cInterfaceHijo</th>
					<th class="text-center">cInterfacePadre</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="asInterfaceImplementa" items="${eList}">
					<tr>
						<td class="text-center"><c:out value="${asInterfaceImplementa.cInterfaceImplementa}" /></td>
						<td class="text-center"><c:out value="${asInterfaceImplementa.hijo.dInterface}" /></td>
						<td class="text-center"><c:out value="${asInterfaceImplementa.padre.dInterface}" /></td>
						<td class="text-center"><a href="/TareaIGFGrupo09/ASInterfaceImplementaEliminar.jsp?id=<c:out value='${asInterfaceImplementa.cInterfaceImplementa}'/>" class="btn btn-danger"> Borrar</a>
							<a href="/TareaIGFGrupo09/ASInterfaceImplementaEditando.jsp?id=<c:out value='${asInterfaceImplementa.cInterfaceImplementa}'/>" class="btn btn-warning"> Editar</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>