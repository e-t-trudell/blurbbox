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
	<div class="away">
		<div>
			<h1>Welcome, <c:out value="${user.name}"/></h1>
			<p>Books from everyone's shelves:</p>
		</div>
		<div>
		<a href="/logout">logout</a><br>
		<a href="/books/new">+ Add a book to my shelf!</a>
		</div>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Owner</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${books}">
				<c:if test="${user.id!= book.borrower.id}">
				<tr>
					<td><c:out value="${book.id}"/></td>
					<td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
					<td><c:out value="${book.author}"/></td>
					<td><c:out value="${book.user.name}"/></td>
					<c:if test="${user==book.user}">
						<td><a href="edit/${book.id}">edit</a>  <a href="books/${book.id}/delete">delete</a></td>
					</c:if>
					<c:if test="${user!=book.user}">
						<td><a href="books/${book.id}/borrow">borrow</a></td>
					</c:if>
				</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<h3>Books I'm borrowing</h3>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Owner</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${books}">
			<c:if test="${user.id==book.borrower.id}">
				<tr>
					<td><c:out value="${book.id}"/></td>
					<td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
					<td><c:out value="${book.author}"/></td>
					<td><c:out value="${book.user.name}"/></td>
					
					<c:if test="${user!=book.user}">
						<td><a href="books/${book.id}/return">return</a></td>
					</c:if>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>