<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>hey</title>
</head>
<body>
	<h1>Fruit Store</h1>
	<div class="container">
		<table class="table table-hover">
			<tbody>
				<tr>
					<th>Name</th>
					<th>Price</th>
				</tr>
				<c:forEach var="oneFruit" items="${fruits}">
					<tr>
						<td><c:out value="${oneFruit.name}"/></td>
						<td><c:out value="${oneFruit.price}"/></td>
					</tr>
				</c:forEach> <!--  -->
				
			<tbody>
		</table>
	</div>
</body>
</html>