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
	CtrlASAtributo ctrlAsc = (CtrlASAtributo) ac.getBean("ctrlASAtributo");
	List<ASAtributo> list = ctrlAsc.daASAtributos();
	request.setAttribute("eList", list);
%>
<title>Lista AS Atributo</title>
<script src="jq/jquery.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.html" %>
	<div class="content text-center" id="tabla">
	     <div class="panel panel-success">
  <!-- Default panel contents -->
  <div class="panel-heading success"><h4>Tabla ASAtributo</h4> 
    <a href="/TareaIGFGrupo09/ASAtributoNuevo.jsp" class="btn btn-success">+ Nuevo</a>
  </div>
		
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">id clase</th>
					<th class="text-center">id atributo</th>
					<th class="text-center">id metodo</th>
					<th class="text-center">atributo</th>
					<th class="text-center">tipo dato atributo</th>
					<th class="text-center">usuario</th>
					<th class="text-center">fecha creación</th>
					<th class="text-center">tipo atributo</th>
					<th class="text-center">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="asAtributo" items="${eList}">
					<tr>
						<td class="text-center"><c:out value="${asAtributo.asClase.cClase}" /></td>
						<td class="text-center"><c:out value="${asAtributo.cAtributo}" /></td>
						<td class="text-center"><c:out value="${asAtributo.asMetodo.cMetodo}" /></td>							
						<td class="text-center"><c:out value="${asAtributo.dAtributo}" /></td>
						<td class="text-center"><c:out value="${asAtributo.dTipoDatoAtributo}" /></td>						
						<td class="text-center"><c:out value="${asAtributo.cUsuario}" /></td>
						<td class="text-center"><c:out value="${asAtributo.fingreso}" /></td>
						<td class="text-center"><c:out value="${asAtributo.tbTipoAtributo.cTipoAtributo}" /></td>						
						<td class="text-center"><a href="/TareaIGFGrupo09/ASAtributoEliminar.jsp?id=<c:out value='${asAtributo.cAtributo}'/>" class="btn btn-danger"> Borrar</a>
							<a href="/TareaIGFGrupo09/ASAtributoEditando.jsp?id=<c:out value='${asAtributo.cAtributo}'/>" class="btn btn-warning"> Editar</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>