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
	CtrlASMetodo ctrlAsm = (CtrlASMetodo) ac.getBean("ctrlASMetodo");
	List<ASMetodo> list = ctrlAsm.daASMetodos();
	request.setAttribute("eList", list);
%>
<title>Lista AS Metodo</title>
<script src="jq/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.html" %>
	<div class="content text-center" id="tabla">
	     <div class="panel panel-success">
  <!-- Default panel contents -->
  <div class="panel-heading success"><h4>Tabla ASMetodo</h4> 
    <a href="/TareaIGFGrupo09/ASMetodoNuevo.jsp" class="btn btn-success">+ Nuevo</a>
  </div>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">id clase</th>
					<th class="text-center">id metodo</th>					
					<th class="text-center">metodo</th>
					<th class="text-center">tipo retorno</th>
					<th class="text-center">usuario</th>
					<th class="text-center">ingreso</th>					
					<th class="text-center">activo</th>					
					<th class="text-center">parametros</th>					
					<th class="text-center">tipo metodo</th>
				</tr>
			
			</thead>
			<tbody>
			 	<c:forEach var="asMetodo" items="${eList}">
			 		<tr>
						<td class="text-center"><c:out value="${asMetodo.asClase.cClase}" /></td>
						<td class="text-center"><c:out value="${asMetodo.cMetodo}" /></td>
						<td class="text-center"><c:out value="${asMetodo.dMetodo}" /></td>												
						<td class="text-center"><c:out value="${asMetodo.dTipoRetorno}" /></td>													
						<td class="text-center"><c:out value="${asMetodo.cUsuario}" /></td>
						<td class="text-center"><c:out value="${asMetodo.fIngreso}" /></td>						
						<td class="text-center"><c:out value="${asMetodo.bActivo}" /></td>						
						<td class="text-center"><c:out value="${asMetodo.nParametros}" /></td>
							
																							
							
						<td class="text-center"><a href="/TareaIGFGrupo09/ASMetodoEliminar.jsp?id=<c:out value='${asMetodo.cMetodo}'/>" class="btn btn-danger"> Borrar</a>
							<a href="/TareaIGFGrupo09/ASMetodoEditando.jsp?id=<c:out value='${asMetodo.cMetodo}'/>" class="btn btn-warning"> Editar</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>