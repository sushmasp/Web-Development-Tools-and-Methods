<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Cart</title>
<jsp:include page="menuBar_Customer.jsp"/>
</head>
<body>
<c:choose>
  <c:when test="${sessionScope.myCart.size()>0}">
  	<form action="checkOut.htm" method="POST">
		 Items Currently in Your Cart:
		 <hr/>
		 <c:forEach var="product" items="${sessionScope.myCart}">
		 Product Name:<c:out value="${product.productName}"></c:out><br/>
		 Product Price:<c:out value="${product.price}"></c:out><br/>
		 Quantity: <c:out value="${product.availability}"></c:out><br/>
		 <br/>
		 <a href="remove.htm?productId=${product.productId}&price=${product.price}&quantity=${product.availability}">[Remove from Cart]</a>
		 <br/><br/>
		 </c:forEach>
		 <hr/>
		  TOTAL: $${sessionScope.totalAmount}
		<br/>
		<input type="submit" value="Check Out">
		</form>
  </c:when>
  <c:otherwise>
  <h4>Your shopping cart is empty.</h4>	
  </c:otherwise>
</c:choose>


</body>
</html>