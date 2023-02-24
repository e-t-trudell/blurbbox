<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/login.css">
<body>
    
    <p><form:errors path="user.*"/></p>
    
  <div class="container h-100" style="margin-top:5%;">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Register</p>

                <form:form class="mx-1 mx-md-4" method="post" modelAttribute="user" action="/registration">
                  
                 <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <form:input path="username" type="text" id="username" class="form-control" />
                      <form:label path="username" class="form-label" for="username">User Name</form:label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <form:input path="password" type="password" class="form-control" />
                      <form:label path="password" class="form-label">Password</form:label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <form:input path="passwordConfirmation" type="password" id="form3Example4cd" class="form-control" />
                      <form:label path="passwordConfirmation" class="form-label" for="form3Example4cd">Confirm your password</form:label>
                    </div>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <input class="input" type="submit" value="Submit"/>
                  </div>

                </form:form>
                
                 <a href="/login" class="btn btn-primary" style="margin-left:41%;margin-top:5px;">Log In</a>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
