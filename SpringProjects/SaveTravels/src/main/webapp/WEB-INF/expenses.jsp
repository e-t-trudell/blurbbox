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
<title>Read Share</title>
</head>
<body class="container">
	<h1>Save Travels</h1>
	<table class="table">
		<thead>
			<tr>
				<th>Expense</th>
				<th>Vendor</th>
				<th>Amount</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="eachExpense" items="${expenses}">
			<tr>
				<td><a href="/expenses/<c:out value="${eachExpense.id}"/>"><c:out value="${eachExpense.name}"/></a></td>
				<td><c:out value="${eachExpense.vendor}"/></td>
				<td><c:out value="${eachExpense.amount}"/></td>
				<td>
					<div class="side">
						<a href="/expenses/edit/<c:out value="${eachExpense.id}"/>">edit</a> 
						
						<form action="/destroy/${eachExpense.id}" method="post">
					    <input type="hidden" name="_method" value="delete">
					    <input type="submit" value="Delete" class="btn btn-danger">
					    </form>
					</div>
						
				</td>
			</c:forEach>
		</tbody>
	</table>
	
	<h2>Add an expense:</h2>
	<form:form action ="/expenses" method="post" modelAttribute="expense" class="form">
	<form:errors path="name" class="text-danger"/>
	<form:errors path="vendor" class="text-danger"/>
	<form:errors path="amount" class="text-danger"/>
	<form:errors path="description" class="text-danger"/>
	
		<div class="form-group">
			<form:label path="name">Expense</form:label>
			<form:input path="name" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="vendor">Vendor</form:label>
			<form:input path="vendor" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="amount">Amount</form:label>
			<form:input type="number" path="amount" class="form-control"/>
		</div>
		<div class="form-group">
			<form:label path="description">Description</form:label>
			<form:textarea path="description" class="form-control"/>
		</div>
		<input type="submit" value="Submit"/>
	</form:form>
	
</body>
</html>