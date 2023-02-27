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
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>One Blurb</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<div>
				<h2>Blurbbox</h2>
			</div>
			<div class="collapse navbar-collapse" id="navbarButtonsExample">
      <!-- Left links -->
      			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        			<li class="nav-item">
          				<a class="nav-link" href="/home">Dashboard</a>
        			</li>
     			</ul>
      		</div>
      		<div style="text-align:center;">
    			<sec:authorize access="hasRole('ROLE_USER')">
    				Secure welcome <sec:authentication property="name"/><sec:authentication property="principal.authorities"/>
				</sec:authorize>
    		</div>
      <!-- Left links -->
      		<div class="d-flex align-items-center">
      			<form action="/logout" method="post">
      				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        			<button type="submit" class="btn btn-link px-3 me-2">Logout</button>
      			</form>
      			<form action="/addBlurb">
        			<button type="submit" class="btn btn-primary me-3">Add Blurb</button>
        		</form>
      		</div>
    	</div>
    </nav>
    <div class="container border border-3 border-rounded border-success col-sm-6 offset-sm-3 d-flex flex-column justify-content-center align-items-center p-4">
    	<h3>Name: <c:out value="${blurb.name}"/></h3>
    	<p>Created by: <c:out value="${blurb.user.username}"/></p>
    	<!-- add link to category here -->
    	<p>Category: <c:out value="${blurb.category}"/></p>
    	<p>Content: <c:out value="${blurb.content}"/></p>
    	<div class="container d-flex flex-row justify-content-between">
    		<a href="/blurb/${blurb.id}/edit"><button class="btn btn-info border border-3 border-success col-sm">Edit</button></a> | <a href="/blurb/${blurb.id}/delete"><button class="btn btn-danger border border-3 border-warning col-sm">Delete</button></a>
    	</div>
    </div>
   
</body>
</html>
