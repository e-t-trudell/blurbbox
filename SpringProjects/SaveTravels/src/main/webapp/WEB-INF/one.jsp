<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
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
<title>Show Expense</title>
</head>
<body>
	<div class="away">
	<h2>Expense Details</h2>
	<p><a href="/expenses">Go Back</a></p>
	</div>
	
	<div>
		<p>Expense Name: <c:out value="${expense.name}"/></p>
		<p>Expense Description: <c:out value="${expense.description}"/></p>
		<p>Vendor: <c:out value="${expense.vendor}"/></p>
		<p>Amount Spent: $<c:out value="${expense.amount}"/></p>
	</div>
</body>
</html>