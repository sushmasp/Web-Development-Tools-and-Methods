<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>Login</title>
    </head>
    <body>
    
    <div style="margin-left: 30%;">
    	<form action="home.htm" method="post">
    	<c:choose>
    	<c:when test="${requestScope.isCheckingOut.equals('true')}">
    	 	<input type="hidden" name="isCheckingOut" value="true" />
    	</c:when>
    	<c:otherwise>
    		<input type="hidden" name="isCheckingOut" value="false" />
    	</c:otherwise>
    	</c:choose>
    	
    	
    	<c:if test="${requestScope.error.equals('true')}">
    	<div>
    		<font color="red">
    			There was a problem.
    			<br/>
    	 		Your username or password is incorrect.Please try again.
    	 	</font>
    	</div> 	
    	</c:if>
    	<font face="Comic sans MS" color="blue"> e-Shopping Sign in</font>
    	<br/><br/>
        Username: <input type="text" id="userName" name="userName" style="margin-left: 9px;" required>
        <br/><br/>
        Password: <input type="password" id="password" name="password" style="margin-left: 14px;" required>
		<br/><br/>
        <input type="submit" value="Login" style="margin-left: 30px;" size="30px" >
        
        <br/> <br/>
        <label style="margin-left: 30px;">New to e-Shopping? </label><br/>
        <a href="signUp.htm?isCheckingOut=${requestScope.isCheckingOut}" style="margin-left: 30px;" > Create your account </a>
        
        </form>
   </div>
</html>