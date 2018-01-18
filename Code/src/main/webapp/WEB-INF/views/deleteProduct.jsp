<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Product</title>
</head>
<body>
<form method="post" action="deleteProduct.htm">
	Select Product to be deleted:
	<br/>
     <c:forEach var="product" items="${requestScope.productList }">
     	 <input type="radio" style="margin-left: 20px;" id="product" name="product" value="${product.productId}" required> ${product.productName}
         <br/>
      </c:forEach>
     <input type="submit" value="Delete">
     </form>
</body>
</html>