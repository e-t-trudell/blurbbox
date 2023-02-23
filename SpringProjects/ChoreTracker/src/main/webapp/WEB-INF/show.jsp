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
	
	<div class="away">
	<div >
	</div>
	<div class="helper2">
		<h3><a href="/dashboard">Back</a></h3>
		

		<h3><a href="/logout">Logout</a></h3>
	</div>
		
	</div>
		
	
	
	<div>
		<h2><c:out value="${chore.title}"/></h2>
		<div class="box">
			
			<p><c:out value="${chore.description}"/></p>
			<p>Location:   <c:out value="${chore.location}"/></p>
			<p>Posted By:  <c:out value="${chore.user.firstName}"/>  <c:out value="${chore.user.lastName}"/></p>
			<p>Posted On: <fmt:formatDate value="${chore.createdAt}" pattern="MMMM dd, YYYY"/> </p>
		</div>
		<h3><a href="/get/${chore.id}">Add To My Jobs</a></h3>
	</div>
</body>
</html>