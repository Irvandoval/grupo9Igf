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
	CtrlASParametro ctrlAsp = (CtrlASParametro) ac.getBean("ctrlASParametro");
	List<ASParametro> list = ctrlAsp.daASParametros();
	request.setAttribute("eList", list);
%>
<title>Lista AS Parametro</title>
<script src="jq/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.html" %>
	<div class="content text-center" id="tabla">
	     <div class="panel panel-success">
  <!-- Default panel contents -->
  <div class="panel-heading success"><h4>Tabla ASParametro</h4> 
    <a href="/TareaIGFGrupo09/ASParametroNuevo.jsp" class="btn btn-success">+ Nuevo</a>
  </div>
		
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">id clase</th>
					<th class="text-center">id metodo</th>
					<th class="text-center">id parametro</th>
					<th class="text-center">parametro</th>
					<th class="text-center">tipo parametro</th>
					<th class="text-center">usuario</th>
					<th class="text-center">ingreso</th>
				</tr>
			</thead>
			<tbody>
			 	<c:forEach var="asParametro" items="${eList}">
					<tr>
						<td class="text-center"><c:out value="${asParametro.asClase.cClase}" /></td>
						<td class="text-center"><c:out value="${asParametro.asMetodo.cMetodo}" /></td>
						<td class="text-center"><c:out value="${asParametro.cPArametro}" /></td>							
						<td class="text-center"><c:out value="${asParametro.dParametro}" /></td>
						<td class="text-center"><c:out value="${asParametro.cTipoParametro}" /></td>						
						<td class="text-center"><c:out value="${asParametro.cUsuario}" /></td>
						<td class="text-center"><c:out value="${asParametro.fIngreso}" /></td>
							
						<td class="text-center"><a href="/TareaIGFGrupo09/ASParametroEliminar.jsp?id=<c:out value='${asParametro.cPArametro}'/>" class="btn btn-danger"> Borrar</a>
							<a href="/TareaIGFGrupo09/ASParametroEditando.jsp?id=<c:out value='${asParametro.cPArametro}'/>" class="btn btn-warning"> Editar</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>