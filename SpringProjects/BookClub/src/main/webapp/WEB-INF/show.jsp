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
	<div>
		<h1><c:out value="${book.title}"/></h1>
		<a href="/home">back to the shelves</a>
	</div>
	<div>
		<h3><c:out  value="${book.user.name}" /> read <c:out  value="${book.title}" /> by <c:out value="${book.author}" />.</h3>
		<h4>Here are <c:out value="${book.user.name}"/>'s thoughts:</h4>
	</div>
	<div>
		<p><c:out value="${book.description}"/></p>
	</div>
	<div>
		<a href="/edit"><button class="btn-primary">edit</button></a>
		
		<form action="/destroy/${book.id}" method="post">
		    <input type="hidden" name="_method" value="delete">
		    <input type="submit" value="Delete" class="btn btn-danger">
	    </form>
	</div>
</body>
</html>