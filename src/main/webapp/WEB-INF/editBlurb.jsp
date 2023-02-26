<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
 
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <!-- Container wrapper -->
	  	<div class="container">
	  
		  <div>
		  		Blurbbox |
		  </div>
	
		    <!-- Collapsible wrapper -->
	      <div class="collapse navbar-collapse" id="navbarButtonsExample">
		      <!-- Left links -->
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link" href="/home">Dashboard</a>
		        </li>
		      </ul>
	      <!-- Left links -->
	      <div class="d-flex align-items-center">
		      <form action="/logout">
		        <button type="submit" class="btn btn-link px-3 me-2">
		          Logout
		        </button>
		      </form>
	      </div>
	    </div>
	  </div>
	</nav>
   <div class="container">
   		<div class="row">
   			<div class="row text-center">
   				<h3><c:out value="${blurb.name}"/></h3>
   			</div>
   			<div class="col d-flex justify-content-center">
		   		<form:form action="/blurb/${blurb.id}/update" method="post" modelAttribute="blurb">
		   			<div>
		   				<input type="hidden" name="_method" value="PUT">
		   				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
		   			</div>
		   			
		   			<div>
		   				<form:label path="name">Name</form:label>
		   				<form:input path="name"/>
		   				<form:errors path="name"></form:errors>
		   			</div>
		   			<div>
		   				<form:label path="category">Category</form:label>
		   				<form:input path="category"/>
		   				<form:errors path="category"></form:errors>
		   			</div>
		   			<div>
		   				<form:label path="content">Content</form:label>
		   				<form:textarea path="content"></form:textarea>
		   				<form:errors path="content"></form:errors>
		   			</div>
	   				<button class="btn btn-success">Edit Blurb!</button>
		   		</form:form>
   			</div>
   		</div>
   </div>
</body>
</html>
