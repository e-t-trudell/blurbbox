<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
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
<title>Show Language</title>
</head>
<body class="container">
	<div class="away">
	<p><a href="/languages">Dashboard</a></p>
	</div>
	
	<div>
		<h3><c:out value="${language.name}"/></h3>
		<h3><c:out value="${language.creator}"/></h3>
		<h3><c:out value="${language.currentVersion}"/></h3>
	</div>
	<h3><a href="/languages/edit/${language.id}">Edit</a></h3>
	<div>
		<form action="/destroy/${language.id}" method="post">
	    <input type="hidden" name="_method" value="delete">
	    <input type="submit" value="Delete" class="btn btn-danger">
	    </form>
	</div>
</body>
</html>