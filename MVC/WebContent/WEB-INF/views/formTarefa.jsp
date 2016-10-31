<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<scri.pt src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<html>
<body>
	<nav class="navbar navbar-default navbar-static-top">
	  <div class="container">
	    <div class="navbar-header">
      	<a class="navbar-brand" href="#">FORM - TECHWEB</a>
      	<ul class="nav navbar-nav">
	    <li class="nav-item">
	      <a class="nav-link" href="/MVC/index.html">Home <span class="sr-only">(current)</span></a>
	    </li>
	    <li class="nav-item active">
	      <a class="nav-link" href="#">Cria</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/MVC/listaTarefas">Lista</a>
	  </ul>
    </div>
	  </div>
	</nav>
	<div class="container">
		<div class="row">
	    	<h2>Adicionar tarefas</h2>
		    <form action="adicionaTarefa" method="post">
		    	<h5>Descrição:</h5>
		    	<textarea name="descricao" rows="6" cols="80"></textarea><br />
		    	<input type="date" name="dataFinalizacao" > Data finalização<br />
		    	<input type="checkbox" name="finalizado"> Finalizado<br />
		    	 <form:errors path="tarefa.descricao" cssStyle="color:red"/><br/>
				<input class="btn btn-primary" type="submit" value="Adicionar">
		    </form>
	    </div>
    </div>
</body>
</html>
