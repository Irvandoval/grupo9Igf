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
	CtrlASClaseInterface ctrlAsii = (CtrlASClaseInterface) ac.getBean("CtrlASClaseInterface");
	List<ASClaseInterface> list = ctrlAsii.daASInterface();
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
  <div class="panel-heading success"><h4>Tabla ASClaseInterface</h4> 
    <a href="/TareaIGFGrupo09/ASClaseInterfaceNuevo.jsp" class="btn btn-success">+ Nuevo</a>
  </div>
		
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">id cClaseInterface</th>
					<th class="text-center">cClase</th>
					<th class="text-center">cInterface</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ASClaseInterface" items="${eList}">
					<tr>
						<td class="text-center"><c:out value="${ASClaseInterface.cClaseInterface}" /></td>
						<td class="text-center"><c:out value="${ASClaseInterface.cClase.dClase}" /></td>
						<td class="text-center"><c:out value="${ASClaseInterface.cInterface.dInterface}" /></td>
						<td class="text-center"><a href="/TareaIGFGrupo09/ASClaseInterfaceEliminar.jsp?id=<c:out value='${ASClaseInterface.cClaseInterface}'/>" class="btn btn-danger"> Borrar</a>
							<a href="/TareaIGFGrupo09/ASClaseInterfaceEditando.jsp?id=<c:out value='${ASClaseInterface.cClaseInterface}'/>" class="btn btn-warning"> Editar</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>