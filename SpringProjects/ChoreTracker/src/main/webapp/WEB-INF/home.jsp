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
	<div class="away">
		<div class="awayer">
			<h3>Welcome <c:out value="${user.firstName}"/>!</h3>
			<a href="/logout">Logout</a>
		</div>
		<div>
			<a href="/addJob">Add A Job</a>
		</div>
	</div>
	
	
	<div class="away">
	<table class="table table-hover border-5 border-dark border">
		<thead>
			<tr>
				<th>Job</th>
				<th>Location</th>
				<th>Action</th>
			</tr>
		</thead>
		<!-- So I wanna be able to put all created Chores in this table but it auto assigns the chore to the
		Creator, how can I make the auto assign turn off???  -->
		<tbody>
			<c:forEach var="chore" items="${chores}">
				<tr>
					<c:if test="${user.id!= chore.worker.id}">
						<td ><c:out value="${chore.title}"/></td>
						<td ><c:out value="${chore.location}"/></td>
						<td >
							
							<a href="/view/${chore.id}">View</a>
							<a href="/get/${chore.id}">add</a>
							<c:if test="${user==chore.user}">
								<a href="/edit/${chore.id}">edit</a>
								<a href="/destroy/${chore.id}">cancel</a>
							</c:if>
						
							
						</td>
					</c:if>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="helper">
	
	</div>
	<table class="table table-hover border-5 border-dark border">
		<thead>
			<tr>
				<th>My Jobs</th>
				<th>...</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="chore" items="${chores}">
			<c:if test="${user.id==chore.worker.id}">
				<tr>
					<td><c:out value="${chore.title}"/></td>
					<td>
						<a href="/view/${chore.id}">View</a>
						<a href="/destroy/${chore.id}">Done</a>
					</td>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	
</body>
</html>