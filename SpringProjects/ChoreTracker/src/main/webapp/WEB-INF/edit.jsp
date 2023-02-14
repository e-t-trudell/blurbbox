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
<title>Edit Job</title>
</head>
<body class="container">
	<div>
		<h3>Edit Your Job Posting</h3>
	</div>
	<div>
		<a href="/dashboard">Back</a>
		<a href="/logout">Logout</a>
	</div>
	
	<form:form action="/update/${chore.id}" method="post" modelAttribute="chore">
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
				
				
				<tr>
		        	<td><input class="input" type="submit" value="Submit"/></td>
		        </tr>
			</thead>
		</table>
	</form:form>
</body>
</html>