<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shop here</title>
<jsp:include page="menuBar_Customer.jsp"/>
</head>
<body>
<c:choose>
<c:when test="${requestScope.productList.size()>0}">
	<h4>You searched for : ${requestScope.searchKey}</h4>
	
	<c:forEach var="product" items="${requestScope.productList}" >
	 	<h4><a href="product.htm?productId=${product.productId}" >${product.productName} </a></h4>
	 	<img src="${product.photoName}"  width="100" height="100" /><br/><br/>
	 	Price: $${product.price}
	<hr>
    </c:forEach>
	<c:if test="${requestScope.productListSize.equals('more')}"> 
		<div style="margin-left: 90%;">
		<a href="nextPage.htm?key=${requestScope.searchKey}&pageNumber=${requestScope.pageNumber+1}" >Next Page</a>
		</div>
	</c:if>	
	<c:if test="${requestScope.pageNumber>1}"> 
		<div style="margin-left: 80%;">
		<a href="previousPage.htm?key=${requestScope.searchKey}&pageNumber=${requestScope.pageNumber-1}" >Previous Page</a>
		</div>
	</c:if>		
</c:when>
<c:otherwise>
	No results found for ${requestScope.searchKey}
</c:otherwise>

</c:choose>

</body>
</html>