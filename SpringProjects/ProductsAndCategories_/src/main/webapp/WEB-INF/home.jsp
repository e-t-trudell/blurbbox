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
	<h1>Home Page</h1>
	<div>
		<a href="/product/create">New Product</a> <br>
		<a href="/categories/create">New Category</a>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>Products</th>
				<th>Categories</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				
					<td>
						<ul>
							<c:forEach var="product" items="${products}">
								<li><a href="products/<c:out value="${product.id}"/>"><c:out value="${product.name}"/></a></li>
							</c:forEach>
						</ul>
					</td>
				
				
					<td>
						<ul>
							<c:forEach var="category" items="${categories}">
								<li><a href="categories/<c:out value="${category.id}"/>"><c:out value="${category.name}"/></a></li>
							</c:forEach>
						</ul>
					</td>
				
			</tr>
		</tbody>
	</table>
</body>
</html>