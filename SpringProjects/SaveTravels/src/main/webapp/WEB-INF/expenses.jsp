<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Read Share</title>
</head>
<body>
	<h1>Save Travels</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Expense</th>
				<th>Vendor</th>
				<th>Amount</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	
	<h2>Add an expense:</h2>
	<form:form action ="/expenses" method="post" modelAttribute="expense">
		<div>
			<form:label path="name">Expense</form:label>
			<form:errors path="name" class="text-danger"/>
			<form:input path="name"/>
		</div>
		<div>
			<form:label path="vendor">Vendor</form:label>
			<form:errors path="vendor" class="text-danger"/>
			<form:input path="vendor"/>
		</div>
		<div>
			<form:label path="amount">Amount</form:label>
			<form:errors path="amount" class="text-danger"/>
			<form:input path="amount"/>
		</div>
		<div>
			<form:label path="description">Description</form:label>
			<form:errors path="description" class="text-danger"/>
			<form:input path="description"/>
		</div>
		<input type="submit" value="Submit"/>
	</form:form>
	
</body>
</html>