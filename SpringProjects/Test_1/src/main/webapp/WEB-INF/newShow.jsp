<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Create a Task</title>
</head>
<body class="container">
	<h1>Create a New TV Show</h1>
	<form:form action="/shows/create" method="post" modelAttribute="show" class="form">
		<div class="form-group">
			<form:label path="title">Title</form:label>
			<form:errors path="title" class="text-danger"/>
			<form:input path="title" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="network">Network</form:label>
			<form:errors path="network" class="text-danger"/>
			<form:input path="network" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="description">Description</form:label>
			<form:errors path="description" class="text-danger"/>
			<form:input path="description" class="form-control"/>
		</div>
		<div class="form-group">
			<form:errors path="user" class="error"/>
			<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
		</div>
		
		<input type="submit" value="Submit"/>
	</form:form>
	<a href="/shows"><button class="btn-danger">Cancel</button></a>
</body>
</html>