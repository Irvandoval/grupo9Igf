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
	CtrlASObservacion ctrlAsc = (CtrlASObservacion) ac.getBean("ctrlASObservacion");
	List<ASObservacion> list = ctrlAsc.daASObservaciones();
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
  <div class="panel-heading success"><h4>Tabla ASObservacion</h4> 
    <a href="/TareaIGFGrupo09/ASObservacionNuevo.jsp" class="btn btn-success">+ Nuevo</a>
  </div>
		
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">id observacion</th>
					<th class="text-center">as clase</th>
					<th class="text-center">b activo</th>
					<th class="text-center">nombre</th>
					<th class="text-center">usuario</th>
					<th class="text-center">fecha creación</th>
					<th class="text-center">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="asClase" items="${eList}">
					<tr>
						<td class="text-center"><c:out value="${asClase.cObservacion}" /></td>
						<td class="text-center"><c:out value="${asClase.asClase.dClase}" /></td>
						<td class="text-center"><c:out value="${asClase.bActivo}" /></td>
						<td class="text-center"><c:out value="${asClase.dObservacion}" /></td>
						<td class="text-center"><c:out value="${asClase.cUsuario}" /></td>
						<td class="text-center"><c:out value="${asClase.fIngreso}" /></td>
						<td class="text-center"><a href="/TareaIGFGrupo09/ASObservacionEliminar.jsp?id=<c:out value='${asClase.cObservacion}'/>" class="btn btn-danger"> Borrar</a>
							<a href="/TareaIGFGrupo09/ASObservacionEditando.jsp?id=<c:out value='${asClase.cObservacion}'/>" class="btn btn-warning"> Editar</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>