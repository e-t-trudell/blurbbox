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
	<div class="away">
		<h1>Change your Entry</h1>
		<a href="/home">back to the shelves</a>
	</div>
	<form:form action="/update/${book.id}" method="post" modelAttribute="book" class="form">
		<input type="hidden" name="_method" value="put">
		<div class="form-group">
			<form:label path="title">Title</form:label>
			<form:errors path="title" class="text-danger"/>
			<form:input path="title" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="author">Author</form:label>
			<form:errors path="author" class="text-danger"/>
			<form:input path="author" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="description">My Thoughts</form:label>
			<form:errors path="description" class="text-danger"/>
			<form:input path="description" class="form-control"/>
		</div>
		<div class="form-group">
			<form:errors path="user" class="error"/>
			<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
		</div>
		<input type="submit" value="Submit"/>
	</form:form>
	<button><a href="/destroy/${book.id}">delete book</a></button>
</body>
</html>