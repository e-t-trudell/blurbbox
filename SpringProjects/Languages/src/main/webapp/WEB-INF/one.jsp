<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
	<div>
	<h2>Language Details</h2>
	<p><a href="/languages">Go Back</a></p>
	</div>
	
	<div>
		<p><c:out value="${language.name}"/></p>
		<p><c:out value="${language.creator}"/></p>
		<p><c:out value="${language.currentVersion}"/></p>
	</div>
</body>
</html>