<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div style="float:right">
<c:choose>
    <c:when test="${!empty sessionScope.userAccount}">
         <jsp:include page="menu2.jsp"/>
     </c:when>
     <c:otherwise>
         <jsp:include page="menu1.jsp"/>
     </c:otherwise>
  </c:choose>
</div>
<form action="search.htm" action="get" >
<div style="margin-left: 20%;">
	 <input type="text" style="margin-left: 0px;" id="key" name="key"  size="50" required>
	 <input type="submit" value="Search"/>
  </form>
  </div>
</body>
</html>