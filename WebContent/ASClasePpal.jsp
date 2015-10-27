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
	CtrlASClase ctrlAsc = (CtrlASClase) ac.getBean("ctrlASClase");
	List<ASClase> list = ctrlAsc.daASClases();
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
  <div class="panel-heading success"><h4>Tabla ASClase</h4> 
    <a href="/TareaIGFGrupo09/ASClaseNuevo.jsp" class="btn btn-success">+ Nuevo</a>
  </div>
		
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">id clase</th>
					<th class="text-center">tipo clase</th>
					<th class="text-center">aplicativo</th>
					<th class="text-center">nombre</th>
					<th class="text-center">usuario</th>
					<th class="text-center">fecha creación</th>
					<th class="text-center">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="asClase" items="${eList}">
					<tr>
						<td class="text-center"><c:out value="${asClase.cClase}" /></td>
						<td class="text-center"><c:out value="${asClase.tbTipoClase.dTipoClase}" /></td>
						<td class="text-center"><c:out value="${asClase.tbAplicativo.dAplicativo}" /></td>
						<td class="text-center"><c:out value="${asClase.dClase}" /></td>
						<td class="text-center"><c:out value="${asClase.cUsuario}" /></td>
						<td class="text-center"><c:out value="${asClase.fIngreso}" /></td>
						<td class="text-center"><a href="/TareaIGFGrupo09/ASClaseEliminar.jsp?id=<c:out value='${asClase.cClase}'/>" class="btn btn-danger"> Borrar</a>
							<a href="/TareaIGFGrupo09/ASClaseEditando.jsp?id=<c:out value='${asClase.cClase}'/>" class="btn btn-warning"> Editar</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>