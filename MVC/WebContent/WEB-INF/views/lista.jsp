<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top">
	  <div class="container">
	    <div class="navbar-header">
      	<a class="navbar-brand" href="#">FORM - TECHWEB</a>
      	<ul class="nav navbar-nav">
	    <li class="nav-item">
	      <a class="nav-link" href="/MVC/index.html">Home <span class="sr-only">(current)</span></a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/MVC/criaTarefa">Cria</a>
	    </li>
	    <li class="nav-item active">
	      <a class="nav-link" href="#">Lista</a>
	  </ul>
    </div>
	  </div>
	</nav>
	<div class="container">
		<h2>Lista</h2>
	   <table>
	      <tr>
	         <th>
	         	<a href="sort?by='id'" type="button" class="btn btn-default btn-lg">
  					<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span> ID
				</a>
			</th>
	         <th>
	         	<a href="sort?by='descricao'" type="button" class="btn btn-default btn-lg">
  					<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span> Descrição
				</a>
			</th>
	         <th>
	         	<a href="sort?by='finalizado'" type="button" class="btn btn-default btn-lg">
  					<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span> Finalizado
				</a>
			</th>
	         <th>
	         	<a href="sort?by='dataFinalizacao'" type="button" class="btn btn-default btn-lg">
  					<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span> Data de Finalização
				</a>
			</th>
	         <th>Alterar estado</th>
	         <th>Deletar item</th>
	      </tr>
	      <c:forEach items="${tarefas}" var="tarefa">
	         <tr>
	  
	            <td>${tarefa.id}</td>
			
	            <td>${tarefa.descricao}</td>
					
	            <c:if test="${tarefa.finalizado eq false}">
	               <td>Não finalizada</td>
	            </c:if>
	            <c:if test="${tarefa.finalizado eq true}">
	               <td>Finalizado</td>
	            </c:if>
				 
	            <c:if test="${tarefa.finalizado eq false}">
	               <td><a class="btn btn-success" href="alteraEstado?id=${tarefa.id}" role="button">Finalizar</a></td>
	            </c:if>
	            <c:if test="${tarefa.finalizado eq true}">
	               <td> <span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span> </td>
	            </c:if>
	            
	            <c:if test="${tarefa.finalizado eq false}">
	               <td><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span></td>
	            </c:if>
	            <c:if test="${tarefa.finalizado eq true}">
	               <td><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> <fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/> <span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span></td>
	            </c:if>
	          	
	          	<td><a class="btn btn-danger" href="removeTarefa?id=${tarefa.id}" role="button"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>
	          	
	         </tr>
	      </c:forEach>
	   </table>
   </div>
</body>
</html>