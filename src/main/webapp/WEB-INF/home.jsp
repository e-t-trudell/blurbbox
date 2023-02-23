<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
 
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
   		<h1>Welcome Page <c:out value="${currentUser.username}"></c:out></h1>
   		<form id="logoutForm" method="POST" action="/logout">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	<input type="submit" value="Logout!" />
    	</form>
    	
    	
    	<a href="/addBlurb">Add a Blurb!</a>    	
    	
 <table class="table table-striped" style="width:95%;margin-left: auto;
  margin-right: auto;">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Category</th>
      <th scope="col">Content</th>
      <th scope="col">Actions</th>
    </tr>
  </thead>
  <tbody>
  
	<c:forEach var="blurb" items="${blurbs}">
  
    <tr>
      <td><c:out value="${blurb.name}"/></td>
      <td><c:out value="${blurb.category}"/></td>
      <td><c:out value="${blurb.content}"/></td>
      <td> <a href="/#">Edit</a> | <a href="/#">Delete</a></td>
    </tr>

	</c:forEach>    

  </tbody>
</table>


    </div>
    <div>    	
    </div>
</body>
</html>
