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
    <title>Edit</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <!-- Container wrapper -->
	  	<div class="container">
	  
		  <div>
		  		Blurbbox |
		  </div>
	
		    <!-- Collapsible wrapper -->
	      <div class="collapse navbar-collapse" id="navbarButtonsExample">
		      <!-- Left links -->
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link" href="/home">Dashboard</a>
		        </li>
		      </ul>
	      <!-- Left links -->
	      <div class="d-flex align-items-center">
		      <form action="/logout">
		        <button type="submit" class="btn btn-link px-3 me-2">
		          Logout
		        </button>
		      </form>
	      </div>
	    </div>
	  </div>
	</nav>
   <div class="container d-flex flex-column justify-content-center">
   		<div class="row">
   			<div class="row text-center">
   				<h3><c:out value="${blurb.name}"/></h3>
   			</div>
   			<div class="col-sm-6 offset-sm-3 d-flex flex-column align-items-center justify-content-around border border-2 border-dark p-2 bg-info bg-gradient">
		   		<form:form action="/blurb/${blurb.id}/update" method="post" modelAttribute="blurb">
		   			<div>
		   				<input type="hidden" name="_method" value="PUT">
		   				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
		   			</div>
		   			
		   			<div class="d-flex flex-row justify-content-between flex-fill p-2 mb-2 bg-light border border-3 border-succcess border-rounded">
		   				<form:label path="name" class="col-sm-2">Name</form:label>
		   				<form:input path="name" class="col-sm-8 border border-2 border-info text-end" value="${blurb.name}"/>
		   				<form:errors path="name" class="text-danger"></form:errors>
		   			</div>
		   			<div class="d-flex flex-row align-items-center mb-4">
   					<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
   						<form:select path="categoryType" class="form-select form-outline flex-fill mb-0" >
   							<c:forEach var="category" items="${category}">
   								<div>
   									<%-- <c:if test="${userId.id == shop.user.id}"> --%>
   										<form:option value="${category.id}" path="categoryType">
   											<c:out value="${category.title}"/>
   											<!-- value="${blurb.categoryType.title}" -->
   										</form:option>
   									<%-- </c:if> --%>
   								</div>
   							</c:forEach>
   						</form:select>
   						<form:label path="categoryType" class="form-label">Category</form:label>
   						<form:errors path="categoryType"></form:errors>
   				  </div> 
		   			<div class="d-flex flex-row justify-content-between flex-fill p-2 mb-2 bg-light border border-3 border-info border-rounded">
		   				<form:label path="content" class="col-sm-2">Content</form:label>
		   				<form:textarea path="content" class="col-sm-8 border border-2 border-info text-end" value="${blurb.content}"></form:textarea>
		   				<form:errors path="content" class="text-danger"></form:errors>
		   			</div>
		   			<div class="container d-flex justify-content-center">
	   					<button class="btn btn-success border border-3 border-warning border-rounded col-sm-10">Edit Blurb!</button>
		   			</div>
		   		</form:form>
   			</div>
   		</div>
   </div>
</body>
</html>
