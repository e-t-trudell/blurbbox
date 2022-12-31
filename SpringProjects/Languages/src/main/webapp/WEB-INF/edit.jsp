<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>edit <c:out value="${language.name}"/></title>
</head>
<body class="container">
	<div class="away">
		<form action="/destroy/${language.id}" method="post">
		    <input type="hidden" name="_method" value="delete">
		    <input type="submit" value="Delete" class="btn btn-danger">
	    </form>
		<p><a href="/languages">Dashboard</a></p>
	</div>
	
	<form:form action ="/update/${language.id}" method="post" modelAttribute="language" class="form">
		<input type="hidden" name="_method" value="put">
		<div class="form-group">
			<form:label path="name">Name</form:label>
			<form:errors path="name" class="text-danger"/>
			<form:input path="name" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="creator">Creator</form:label>
			<form:errors path="creator" class="text-danger"/>
			<form:input path="creator" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="currentVersion">Version</form:label>
			<form:errors path="currentVersion" class="text-danger"/>
			<form:input path="currentVersion" class="form-control"/>
		</div>
		<div class="away">
		<input type="submit" value="Submit"/>
		</div>
		
	</form:form>
</body>
</html>