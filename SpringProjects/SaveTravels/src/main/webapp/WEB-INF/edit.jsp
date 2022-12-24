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
<title>Edit Page</title>
</head>
<body>
	<h2>Edit an Expense:</h2>
	<form:form action ="/expenses" method="post" modelAttribute="expense" class="form">
		<div class="form-group">>
			<form:label path="name">Expense</form:label>
			<form:errors path="name" class="text-danger"/>
			<form:input path="name"/>
		</div>
		<div class="form-group">>
			<form:label path="vendor">Vendor</form:label>
			<form:errors path="vendor" class="text-danger"/>
			<form:input path="vendor"/>
		</div>
		<div class="form-group">>
			<form:label path="amount">Amount</form:label>
			<form:errors path="amount" class="text-danger"/>
			<form:input path="amount"/>
		</div>
		<div class="form-group">>
			<form:label path="description">Description</form:label>
			<form:errors path="description" class="text-danger"/>
			<form:textarea path="description"/>
		</div>
		<input type="submit" value="Submit"/>
	</form:form>
</body>
</html>