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
	CtrlTBTipoAtributo ctrlTbtc = (CtrlTBTipoAtributo) ac.getBean("ctrlTBTipoAtributo");
	List<TBTipoAtributo> list = ctrlTbtc.daTBTipoAtributos();
	request.setAttribute("eList", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="jq/jquery.js"></script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/bootstrap.min.js"></script>

<title>Lista TB Tipo Atributo</title>
</head>
<body>
<%@ include file="navbar.html" %>
	<div class="content text-center" id="tabla">
	     <div class="panel panel-success">
  <!-- Default panel contents -->
  <div class="panel-heading success"><h4>Tabla TBTipoAtributo</h4> 
    <a href="/TareaIGFGrupo09/TPTipoAtributoNuevo.jsp" class="btn btn-success">+ Nuevo</a>
  </div>
		
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">id</th>
					<th class="text-center">nombre</th>
					<th class="text-center">fecha creación</th>
					<th class="text-center">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tbTipoAtributo" items="${eList}">
					<tr>
						<td><c:out value="${tbTipoAtributo.cTipoAtributo}" /></td>
						<td><c:out value="${tbTipoAtributo.dTipoAtributo}" /></td>
						<td><c:out value="${tbTipoAtributo.fIngreso}" /></td>
						<td> <a href="/TareaIGFGrupo09/TPTipoAtributoEliminar.jsp?id=<c:out value='${tbTipoAtributo.cTipoAtributo}'/>" class="btn btn-danger"> Borrar</a>
							<a href="/TareaIGFGrupo09/TPTipoAtributoEditando.jsp?id=<c:out value='${tbTipoAtributo.cTipoAtributo}'/>" class="btn btn-warning"> Editar</a>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		</div>
	</div>

</body>
</html>