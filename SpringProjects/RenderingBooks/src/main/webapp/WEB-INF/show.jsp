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
<title>Books</title>
</head>
<body>
	<h1><c:out value="${Book.title}"/></h1>
	<h4>Description: <c:out value="${Book.description}"/></h4>
	<h4>Language: <c:out value="${Book.language}"/></h4>
	<h4>Number of Pages: <c:out value="${Book.numberOfPages}"/></h4>
</body>
</html>