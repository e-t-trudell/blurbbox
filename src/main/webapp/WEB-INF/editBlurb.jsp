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
   <div class="container">
		<nav class="navbar navbar-expand-xl navbar-light bg-light">
			<h3>Edit blogTitle</h3>
			<h1>BLURB BOX</h1>
			<p><a href="/">Home</a></p>
		</nav>
   		<div class="row">
   			<div class="row">
   				<h3>blogTitle</h3>
   			</div>
   			<div class="col">
		   		<form:form>
		   			<div>
		   				<%-- <form:label></form:label>
		   				<form:textarea></form:textarea>
		   				<form:error></form:error> --%>
		   				<button class="btn btn-success">Edit Blurb!</button>
		   			</div>
		   		</form:form>
   			</div>
   		</div>
   </div>
</body>
</html>
