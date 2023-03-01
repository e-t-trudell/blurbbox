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
    <title>Edit Category</title>
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
	<div class="container d-flex flex-column justify-content-center">
   		<div class="row">
   			
	<div class="col-sm-6 offset-sm-3 d-flex flex-column align-items-center justify-content-around border border-2 border-dark p-2 bg-info bg-gradient">
   	<form:form action="/category/${category.id}/update" method="post" modelAttribute="category" class="container d-flex flex-column align-items-center">
		<div>
		   	<input type="hidden" name="_method" value="PUT">
		   	<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
		</div>
		<div class="d-flex flex-row justify-content-between flex-fill p-2 mb-2 bg-light border border-3 border-succcess border-rounded">
			<form:label path="title" class="form-label">Title</form:label>
			<form:input path="title" class="form-control" value="${category.title}"></form:input>
			<form:errors path="title" class="text-danger"></form:errors>
			<div class="container d-flex justify-content-center">
	   			<button class="btn btn-success border border-3 border-warning border-rounded col-sm-10">Edit Category!</button>
		   	</div>
		</div>
	</form:form>
	</div>
	</div>
	</div>
</body>
</html>
