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
CtrlASInterface ctrlAsi = (CtrlASInterface) ac.getBean("ctrlASInterface");
List<ASInterface> list = ctrlAsi.daASInterface();
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
  <div class="panel-heading success"><h4>Tabla ASInterfcae</h4> 
    <a href="/TareaIGFGrupo09/ASInterfaceNuevo.jsp" class="btn btn-success">+ Nuevo</a>
  </div>
		
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">id Interface</th>
					<th class="text-center">descripcion Interface</th>
					<th class="text-center">usuario</th>
					<th class="text-center">fecha creación</th>
					<th class="text-center">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="asInterface" items="${eList}">
					<tr>
						<td class="text-center"><c:out value="${asInterface.cInterface}" /></td>
						<td class="text-center"><c:out value="${asInterface.dInterface}" /></td>
						<td class="text-center"><c:out value="${asInterface.cUsuario}" /></td>
						<td class="text-center"><c:out value="${asInterface.fIngreso}" /></td>
						<td class="text-center"><a href="/TareaIGFGrupo09/ASInterfaceEliminar.jsp?id=<c:out value='${asInterface.cInterface}'/>" class="btn btn-danger"> Borrar</a>
							<a href="/TareaIGFGrupo09/ASInterfaceEditando.jsp?id=<c:out value='${asInterface.cInterface}'/>" class="btn btn-warning"> Editar</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>