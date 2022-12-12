<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>test</h1>
	
	<% for (int i = 0; i < 5; i++) {%>
		<h1><%= i %></h1>
	<% } %>
	
	<h3>The time is: <%= new Date() %></h3>
	
	<h1>Two plus two is: <h1>
	<h2><c:out value="${2+2}"/></h2>
	
</body>
</html>