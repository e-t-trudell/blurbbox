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
	<h1>New Category</h1>
	<div>
		<a href="/home">Home</a>
	</div>
	
	<form:form action="/categories/create" method="post" modelAttribute="category">
		<table class="table">
			<thead>
				<tr>
					<td>Name:</td>
					<td>
						<form:errors path="name" class="text-danger"/>
							<form:input class="input" path="name"/>
					</td>
				</tr>
				<tr>
					<td><input class="button" type="submit" value="Submit"/></td>
				</tr>
			</thead>
		</table>
	</form:form>
</body>
</html>