<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order History</title>
<jsp:include page="menuBar_Customer.jsp"/>
</head>
<body>
<div style="margin-left: 10%;margin-top: :30%">
	<c:choose>
    	<c:when test="${requestScope.orderList.size()>0}">
    	 	<table border="1">
    	 	<tr>
    	 	<th>Order Number</th>
    	 	<th>Status</th>
    	 	<th></th>
    	 	</tr>
    	 	<c:forEach var="order" items="${requestScope.orderList}"> 
    	 		<tr>
    	 		<td> ${order.orderId}</td>
    	 		<td> ${order.status} </td>
    	 		<td>
    	 		<c:if test="${order.status.equals('Open')}">
    	 		<a href="cancelOrder.htm?orderId=${order.orderId}">Cancel</a>
    	 		</c:if>
    	 		</td>
    	 		</tr>
    	 	</c:forEach>	
    	 	</table>
    	</c:when>
    	<c:otherwise>
    		No previous orders.
    	</c:otherwise>
    </c:choose>
    </div>
</body>
</html>