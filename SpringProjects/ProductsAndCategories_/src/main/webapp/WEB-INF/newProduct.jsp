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
	<h1>New Product</h1>
	<div>
		<a href="/home">Home</a>
	</div>
	<form:form action="/product/create" method="post" modelAttribute="product">

	<table>
	    <thead>
	    	<tr>
	            <td class="float-left">Name:</td>
	            <td class="float-left">
	            	<form:errors path="name" class="text-danger"/>
					<form:input class="input" path="name"/>
	            </td>
	        </tr>
	        <tr>
	            <td class="float-left">Description:</td>
	            <td class="float-left">
	            	<form:errors path="description" class="text-danger"/>
					<form:input class="input" path="description"/>
	            </td>
	        </tr>        
	        <tr>
	            <td class="float-left">Price:</td>
	            <td class="float-left">
	            	<form:errors path="price" class="text-danger"/>
					<form:input type="number" class="input" path="price"/>
	            </td>
	        </tr>
	        <tr>
	        	<td colspan=2><input class="input" class="button" type="submit" value="Submit"/></td>
	        </tr>
	    </thead>
	</table>
</form:form>
	<%-- <form:form action="/product/create" method="post" modelAttribute="product" class="form">
		<div class="form-group">
			<form:label path="name">Name</form:label>
			<form:errors path="name" class="text-danger"/>
			<form:input path="name" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="description">Description</form:label>
			<form:errors path="description" class="text-danger"/>
			<form:input path="description" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="price">Price</form:label>
			<form:errors path="price" class="text-danger"/>
			<form:input type="number" path="price" class="form-control"/>
		</div>
		<input type="submit" value="Submit"/>
	</form:form> --%>

</body>
</html>