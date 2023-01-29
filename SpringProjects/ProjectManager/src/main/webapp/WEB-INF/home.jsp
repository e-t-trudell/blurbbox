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
<title>Insert title here</title>
</head>
<body class="container">
	<h1>Welcome, <c:out value="${user.firstName}"/></h1>
	<p><a href="/logout">Log Out</a></p>
	<p><a href="/projects/new">Add Project</a></p>

	<p>All Projects</p>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Project</th>
				<th>Team Lead</th>
				<th>Due Date</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="project" items="${unassignedProjects}">
				<tr>
					<c:if test = "${project.lead.id!=user.id}">
					<td><a href="/projects/${project.id}"><c:out value="${project.title}"/></a></td>
					<td><c:out value="${project.lead.firstName}"/></td>
					<td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
					<td><a href="/home/join/${project.id}">Join Team</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
	
	<hr>
	<h4>Your Projects</h4>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Project</th>
				<th>Team Lead</th>
				<th>Due Date</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="project" items="${assignedProjects}">
				<tr>
					
					<td><a href="/projects/${project.id}"><c:out value="${project.title}"/></a></td>
					<td><c:out value="${project.lead.firstName}"/></td>
					<td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
					<c:if test = "${project.lead.id==user.id}">
						<td><a href="/projects/edit/${project.id}">Edit Project</a></td>
					</c:if>
					<c:if test = "${project.lead.id!=user.id}">
						<td><a href="/home/leave/${project.id}">Leave Team</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>