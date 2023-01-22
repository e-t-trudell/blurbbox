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
<title>Product Manager</title>
</head>
<body class="container">
	<div class="next">
		<h1>Welcome, <c:out value="${user.name}"/></h1>
		<a href="/logout">Logout</a>
	</div>
	<h4>TV Shows</h4>
	<table class="table">
		<thead>
			<tr>
				<th>Show</th>
				<th>Network</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="show" items="${shows}">
				<tr>
					<td><a href="/shows/${show.id}"><c:out value="${show.title}"/></a></td>
					<td><c:out value="${show.network}"/></td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
	<a href="/shows/new"><button class="btn-primary">Add a Show</button></a>
</body>
</html>