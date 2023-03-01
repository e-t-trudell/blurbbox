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
    <title>New Category</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm navbar-light bg-light">
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
      				<div>
						<a href="/registration" class="btn btn-success m-2" >Register!</a>
					</div>
      				<form action="/logout" method="post">
      					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
       	 					<button type="submit" class="btn btn-danger m-2">
          					Logout
        					</button>
      				</form>
      				<form action="/blurb/addBlurb">
        				<button type="submit" class="btn btn-primary m-2">
         	 				Add Blurb
        				</button>
        			</form>
        			<div>
        				<a href="/category/addCategory"><button class="btn btn-primary m-2">New Category</button></a>
        			</div>
      			</div>
    		</div>
  		</div>
	</nav>
		<form:form action="/category/create" modelAttribute="category" class="container d-flex flex-column align-items-center">
			<div>
				<form:label path="title" class="form-label">Title</form:label>
				<form:input path="title" class="form-control"></form:input>
				<form:errors path="title" class="text-danger"></form:errors>
				<button class="btn btn-success border border-3 border-info">Add</button>
			</div>
		</form:form>
</body>
</html>
