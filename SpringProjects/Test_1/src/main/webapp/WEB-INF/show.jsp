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
<title>Edit My Task</title>
</head>
<body class="container">
	<div class="away">
		<h1><c:out value="${show.title}"/></h1>
		<a href="/shows">Back to Dashboard</a>
	</div>
	
	<div class="big">
		<h3>Posted by: <c:out value="${show.user.name}"/></h3>
	</div>
	<div class="big">
		<h4>Network: <c:out value="${show.network}"/></h4>
	</div>
	<div class="big">
		<h4>Description: <c:out value="${show.description}"/></h4>
	</div>
	<a href="/edit/<c:out value="${show.id}"/>">Edit</a>
</body>
</html>