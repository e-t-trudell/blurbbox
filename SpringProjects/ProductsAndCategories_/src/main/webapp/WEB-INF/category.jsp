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
	<h1>${category.name}</h1>
	<div>
		<p><a href="/home">Home</a></p>
	</div>
	<h3>Products:</h3>
	
	<ul>
		<c:forEach var="product" items="${assignedProducts}">
			<li><c:out value="${product.name}"/></li>
		</c:forEach>
	</ul>
	<hr>
	
	<form action="/categories/${id}" method="post">
		<h3>Add Product</h3>
		<select name="productId" id="productId">
			<c:forEach var="product" items="${unassignedProducts}">
				<option value="${product.id}">${product.name}</option>
			</c:forEach>
		</select>
		<input class="input" class="button" type="submit" value="Add"/> 
	</form>
</body>
</html>