<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<jsp:include page="menuBar_Customer.jsp"/>
</head>
<body>
<c:choose>
    <c:when test="${requestScope.task.equals('registered')}">
    	Registered successfully.
    </c:when>
    <c:when test="${requestScope.task.equals('checkedOut')}">
    	Order placed successfully.
    </c:when>
  </c:choose>

</body>
</html>