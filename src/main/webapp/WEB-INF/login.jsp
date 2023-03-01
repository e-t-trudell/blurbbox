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
    <title>Login</title>
    <link href="/webjars/bootstrap/css/bootstrap.min.css" rel="stylesheet"  media="all">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    
</head>
<body>
   <div>
   			<c:if test="${logoutMessage != null}">
        		<c:out value="${logoutMessage}"></c:out>
    		</c:if>

    		<c:if test="${errorMessage != null}">
        		<c:out value="${errorMessage}"></c:out>
    		</c:if>
    		
   <div class="container h-100" style="margin-top:5%;">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Log In</p>

                <form:form class="mx-1 mx-md-4" method="post" action="/login" modelAttribute="newUser">

                  <div class="d-flex flex-row align-items-center mb-4 ">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <form:input path="username" type="text" class="form-control" />
                      <form:label path="username" class="form-label">Username</form:label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4 ">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <form:input path="password" type="password"  class="form-control" />
                      <form:label path="password" class="form-label" >Password</form:label>
                    </div>
                  </div>

                  <div class="container d-flex flex-column align-items-center justify-content-center mx-4 mb-3 mb-lg-4">
                    <!-- <input class="input" type="submit" value="Submit"/> -->
                    <button class="btn btn-success border border-3 border-warning border-rounded col-sm-8 mb-3"> Submit!</button>
                  	<a href="/registration" class="btn btn-primary col-sm-8 border border-3 border-info border-rounded">Register Instead!</a>
                  </div>

                </form:form>
                
                 

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  
   		</div>
   		
</body>
</html>
