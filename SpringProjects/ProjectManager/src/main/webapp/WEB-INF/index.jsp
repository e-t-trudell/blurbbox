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
<title>Insert title here</title>
</head>
<body class="container">
	<h1 class="title">Project Manager</h1>
	<p class="title">A place for teams to manage projects</p>
	<div class="space">
		<form:form action="/register" method="post" modelAttribute="newUser" class="form">
			<div>
				<h2>Register</h2>
				<div class="form-group">
					<form:label path="lastName">First Name</form:label>
					<form:errors path="firstName" class="text-danger"/>
					<form:input path="firstName" class="form-control"/>
				</div>
				<div class="form-group">
					<form:label path="lastName">Last Name</form:label>
					<form:errors path="lastName" class="text-danger"/>
					<form:input path="lastName" class="form-control"/>
				</div>
				<div class="form-group">
					<form:label path="email">Email:</form:label>
					<form:errors path="email" class="text-danger"/>
					<form:input path="email" class="form-control"/>
				</div>
				<div class="form-group">
					<form:label path="password">Password:</form:label>
					<form:errors path="password" class="text-danger"/>
					<form:input type="password" path="password" class="form-control"/>
				</div>
				<div class="form-group">
					<form:label path="confirm">Confirm PW:</form:label>
					<form:errors path="confirm" class="text-danger"/>
					<form:input type="password" path="confirm" class="form-control"/>
				</div>
				<input type="submit" value="Submit"/>
			</div>
		</form:form>
	
	
	<form:form action="/login" method="post" modelAttribute="newLogin" class="form">
		<div>
			<h2>Log in</h2>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:errors path="email" class="text-danger"/>
				<form:input path="email" class="form-control"/>
			</div>
			<div class="form-group">
				<form:label path="password">Password:</form:label>
				<form:errors path="password" class="text-danger"/>
				<form:input type="password" path="password" class="form-control"/>
			</div>
			<input type="submit" value="Submit"/>
		</div>
	</form:form>
	</div>
</body>
</html>