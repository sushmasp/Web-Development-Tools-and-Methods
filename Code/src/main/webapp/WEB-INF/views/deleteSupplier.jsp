<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Supplier</title>
</head>
<body>
<h4 style="margin-left: 100px;">Delete Supplier</h4>
 <form action="deleteSupplier.htm" method="post">
	
  Supplier Name:<br/>
     <c:forEach var="supplier" items="${requestScope.supplierList}" >
  		 <input type="radio" style="margin-left: 20px;" id="supplier" name="supplier" value="${supplier.supplierName}" required>${supplier.supplierName} 
  		  <br/>
     </c:forEach>
     <br/>  <br/>   
  <input type="submit" value="Delete Supplier" style="margin-left: 100px;" target="contents"/>
  </form>
</body>
</html>