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
<title>View Job</title>
</head>
<body class="container">
	<div>
		<a href="/dashboard">Back</a>
		<a href="/logout">Logout</a>
	</div>
	
	<div>
		<h2><c:out value="${chore.title}"/></h2>
		<div>
			<p><c:out value="${chore.description}"/></p>
			<p><c:out value="${chore.description}"/></p>
			<p>Location:<c:out value="${chore.location}"/></p>
			<p>Posted By:<c:out value="${chore.user.firstName}"/></p>
			<p>Posted On:<c:out value="${chore.createdAt}"/></p>
		</div>
		<h3><a href="/get/${chore.id}">Add To My Jobs</a></h3>
	</div>
</body>
</html>