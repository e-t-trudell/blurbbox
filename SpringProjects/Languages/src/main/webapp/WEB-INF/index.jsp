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
<body>
	<table class="table table-striped table bordered">
		<thead>
			<tr>
				<th>Name</th>
				<th>Creator</th>
				<th>Version</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="language" items="${languages}">
				<tr>
					<td><a href="/languages/<c:out value="${language.id}"/>"><c:out value ="${language.name}"></c:out></a></td>
					<td><c:out value="${language.creator}"></c:out></td>
					<td><c:out value="${language.currentVersion}"></c:out></td>
					<td>
						<form action="/destroy/${language.id}" method="post">
					    <input type="hidden" name="_method" value="delete">
					    <input type="submit" value="Delete" class="btn btn-danger">
					    </form>
					    
						<a href="/languages/edit/${language.id}">edit</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<h2>Add a Language:</h2>
	<form:form action="/languages" method="post" modelAttribute="language" class="form">
		<div class="form-group">
			<form:label path="name">Name</form:label>
			<form:input path="name" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="creator">Creator</form:label>
			<form:input path="creator" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="currentVersion">Version</form:label>
			<form:input path="currentVersion" class="form-control"/>
		</div>
		<input type="submit" value="Submit"/>
	</form:form>
	
</body>
</html>