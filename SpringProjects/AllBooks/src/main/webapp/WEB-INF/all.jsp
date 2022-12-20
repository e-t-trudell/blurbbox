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
<title>Books</title>
</head>
<h1>All Books</h1>
<body>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Language</th>
				<th>Number of Pages</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="oneBook" items="${books}">
				<tr>
					<td><c:out value="${oneBook.id}"/></td>
					<td><a href="/books/${oneBook.id}"><c:out value="${oneBook.title}"/></a></td>
					<td><c:out value="${oneBook.language}"/></td>
					<td><c:out value="${oneBook.numberOfPages}"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>