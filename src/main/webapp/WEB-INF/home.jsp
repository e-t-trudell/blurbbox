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
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<!-- Navbar -->
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
      <form action="/logout" method="post">
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit" class="btn btn-link px-3 me-2">
          Logout
        </button>
      </form>
      <form action="/addBlurb">
        <button type="submit" class="btn btn-primary me-3">
          Add Blurb
        </button>
        </form>
      </div>
    </div>
  </div>
</nav>
	<div>
   		<h1 style="text-align:center;">Welcome <c:out value="${currentUser.username}"></c:out></h1>
    	
    	<div style="text-align:center;">
    		<sec:authorize access="hasRole('ROLE_USER')">
    			Secure welcome <sec:authentication property="name"/><sec:authentication property="principal.authorities"/>
			</sec:authorize>
    	</div>
    	
    	
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
    <!-- add link to one view here /blurb/{id}/view -->
      <td><c:out value="${blurb.name}"/></td>
      <td><c:out value="${blurb.category}"/></td>
      <td><c:out value="${blurb.content}"/></td>
      <td> <a href="/blurb/${blurb.id}/edit">Edit</a> | <a href="blurbs/delete/${blurb.id}">Delete</a></td>
    </tr>

	</c:forEach>    

  </tbody>
</table>


    </div>
    <div>    	
    </div>
</body>
</html>
