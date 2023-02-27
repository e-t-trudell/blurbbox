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
    <title>New Blurb</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="container h-100" style="margin-top:5%;">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Add A Blurb!</p>

                <form:form class="mx-1 mx-md-4" method="post" action="/blurb/create" modelAttribute="blurb">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <form:input path="name" type="name" class="form-control" />
                      <form:errors path="name" class="text-danger"/> 
                      <form:label path="name" class="form-label">Name</form:label>
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <form:input path="category" class="form-control" />
                      <form:errors path="category" class="text-danger"/>
                      <form:label path="category" class="form-label">Category</form:label>
                    </div>
                  </div>
                  
                  <!-- Gotta figure out dropdown here -->
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <form:input path="content" type="description" class="form-control" />
                      <form:errors path="content" class="text-danger"/>
                      <form:label path="content" class="form-label">Content</form:label>
                    </div>
                  </div>
                  
                  <div class="form-row">
					<form:errors path="user" class="error"/>
					
				  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button class="btn btn-success border border-3 border-info">Submit!</button>
                  </div>

                </form:form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <a href="/home" class="btn btn-primary" style="margin-left:14%;margin-top:5px;">Back to dashboard</a>

</html>
