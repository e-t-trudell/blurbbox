<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>Add A Job</title>
</head>
<body class="container">
	<div class="away">
		<div>
			<h3>Add a Job</h3>
		</div>
		<div class="helper2">
			<h3><a href="/dashboard">Back</a></h3>
			
			<h3><a href="/logout">Logout</a></h3>
		</div>
	</div>
	
	
	<form:form action="/chores/add" method="post" modelAttribute="chore">
		<table>
			<thead>
				<tr>
					<td class="float-left">Title</td>
					<td class="float-left">
						<form:errors path="title" class="text-danger"/>
						<form:input class="input" path="title"/>
					</td>
				</tr>
				<tr>
					<td class="float-left">Description</td>
					<td class="float-left">
						<form:errors path="description" class="text-danger"/>
						<form:textarea rows="4" class="input" path="description"/>
					</td>
				</tr>
				<tr>
					<td class="float-left">Location</td>
					<td class="float-left">
						<form:errors path="location" class="text-danger"/>
						<form:input class="input" path="location"/>
					</td>
				</tr>
				
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
				
				<tr>
		        	<td><input class="input" type="submit" value="Submit"/></td>
		        </tr>
			</thead>
		</table>
	</form:form>
</body>
</html>