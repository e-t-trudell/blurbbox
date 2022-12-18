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
<title>Omikuji</title>
</head>
<body>
	<div>
		<h1>Send an  Omikuji!</h1>
	</div>
	
	<div>
		<form action="/login" method="post">
			<div>
				<label>Pick any number from 5 to 25</label><br/>
				<input type="text" name="number">
			</div>
			<div>
				<label>Enter the name of any City</label><br/>
				<input type="text" name="city">
			</div>
			<div>
				<label>Enter the name of any real person</label><br/>
				<input type="text" name="person">
			</div>
			<div>
				<label>Enter professional endeavor or hobby</label><br/>
				<input type="text" name="hobby">
			</div>
			<div>
				<label>Enter any type of living thing</label><br/>
				<input type="text" name="livingThing">
			</div>
			<div>
				<label>Say something nice to someone</label><br/>
				<textarea name="message" id="" cols="30" rows="10"></textarea>
			</div>
			
			<p>Send to show a friend!</p>
			
			<input type="submit" value="Send">
		</form>
	</div>
</body>
</html>