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
		<h1>Project Details</h1>
		<a href="/home">Back to Dashboard</a>
	</div>
	<div>
		<h3>Project:</h3>
		<h3><c:out value="${project.title}"/></h3>
	</div>
	<div>
		<h3>Description:</h3>
		<h3><c:out value="${project.description}"/></h3>
	</div>
	<div>
		<h3>Due Date:</h3>
		<h3><c:out value="${project.dueDate}"/></h3>
	</div>
	<div>
		<c:if test= "${project.lead.id==userId}">
			<form action="/projects/delete/${project.id}" method="post">
			    <input type="hidden" name="_method" value="delete">
			    <input type="submit" value="Delete" class="btn btn-danger">
		    </form>
	    </c:if>
	</div>
	
</body>
</html>