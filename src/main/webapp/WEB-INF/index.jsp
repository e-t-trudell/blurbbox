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
    <title>Land</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   	<div>
   		<p>Reg form / Login form</p>
   	</div>
   	<div>
   		<div>
   			<h1>Register!</h1>
    		<p><form:errors path="user.*"/></p>
    		<form:form method="POST" action="/registration" modelAttribute="user">
        		<div>
            		<form:label path="username">Username:</form:label>
            		<form:input path="username"/>
            		<form:errors path="username"></form:errors>
        		</div>
        		<div>
            		<form:label path="email">Email:</form:label>
            		<form:input path="email"/>
            		<form:errors path="email"></form:errors>
        		</div>
        		<div>
            		<form:label path="password">Password:</form:label>
            		<form:password path="password"/>
            		<form:errors path="password"></form:errors>
        		</div>
        		<div>
            		<form:label path="passwordConfirmation">Password Confirmation:</form:label>
            		<form:password path="passwordConfirmation"/>
            		<form:errors path="passwordConfirmation"></form:errors>
        		</div>
        		<input type="submit" value="Register!"/>
    		</form:form>
   		</div>
   		<div>
   			<c:if test="${logoutMessage != null}">
        		<c:out value="${logoutMessage}"></c:out>
    		</c:if>
    		<h1>Login</h1>
    		<c:if test="${errorMessage != null}">
        		<c:out value="${errorMessage}"></c:out>
    		</c:if>
    		<form method="POST" action="/login">
        		<p>
            		<label for="username">Username</label>
            		<input type="text" id="username" name="username"/>
        		</p>
        		<p>
            		<label for="password">Password</label>
            		<input type="password" id="password" name="password"/>
        		</p>
        		<div>
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        		<!-- change me to a button -->
        			<input type="submit" value="Login!"/>
        		</div>
    		</form>
   		</div>
   	</div>
</body>
</html>
