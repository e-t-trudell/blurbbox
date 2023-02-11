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
<title>Chore Tracker Dashboard</title>
</head>
<body class="container">
	<div>
		<h3>Welcome <c:out value="${user.firstName}"/></h3>
		<a href="/logout">Logout</a>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Job</th>
				<th>Location</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="chore" items="${unassignedChores}">
				<tr>
					<c:if test = "${chore.creator.id!= user.id}">
						<td><c:out value="${chore.title}"/></td>
						<td><c:out value="${chore.location}"/></td>
						<td>
							<a href="/">View</a>
							<a href="/">add</a>
							<a href="/">edit</a>
							<a href="/">cancel</a>
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>My Jobs</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><c:out value="${chore.title}"/></td>
			</tr>
		</tbody>
	</table>
	
</body>
</html>