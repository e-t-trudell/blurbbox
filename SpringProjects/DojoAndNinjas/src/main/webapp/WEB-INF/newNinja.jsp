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
<title>New Ninja</title>
</head>
<body class="container">
	<form:form action="/ninja/create" method="post" modelAttribute="ninja" class="form">
		<div class="form-group">
			<form:label path="dojo">Dojo:</form:label>
			<form:errors path="dojo"/>
			<form:select path="dojo">
				<c:forEach var="dojo" items="${allDojos}"> <!-- Im wondering if i have an error from my controller --> 
					<form:option value="${dojo.id}">
						<c:out value="${dojo.name}"/>
					</form:option>
				</c:forEach> 
			</form:select>
		</div>
		<div class="form-group">
			<form:label path="firstName">First Name:</form:label>
			<form:errors path="firstName"/>
			<form:input path="firstName" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="lastName">Last Name:</form:label>
			<form:errors path="lastName"/>
			<form:input path="lastName" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="age">Age:</form:label>
			<form:errors path="age"/>
			<form:input path="age" class="form-control"/>
		</div>
		<button class="btn btn-primary">Create Ninja</button>
	</form:form>
</body>
</html>