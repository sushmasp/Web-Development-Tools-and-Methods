<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Open Orders</title>
</head>
<body>
<form action="updateOrder.htm" method="post">
	<c:choose>
    	<c:when test="${requestScope.openOrderList.size()>0}">
    	 	<table border="1">
    	 	<tr>
    	 	<th></th>
    	 	<th>Order Number</th>
    	 	<th>Customer</th>
    	 	<th>Status</th>
    	 	</tr>
    	 	<c:forEach var="order" items="${requestScope.openOrderList}"> 
    	 		<tr>
    	 		<td><input type="radio" name="orderId" value="${order.orderId}" required></td>
    	 		<td> ${order.orderId}</td>
    	 		<td> ${order.customer.firstName}</td>
    	 		<td> ${order.status} </td>
    	 		</tr>
    	 	</c:forEach>	
    	 	</table>
		<input type="submit" value="Update Order" />
    	</c:when>
    	<c:otherwise>
    		No open orders currently.
    	</c:otherwise>
    </c:choose>
   </form>
</body>
</html>