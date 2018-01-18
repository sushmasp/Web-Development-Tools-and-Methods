<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Product</title>
<jsp:include page="menuBar_Customer.jsp"/>

 <script language="JavaScript" type="text/javascript">
   function validation()
   {
     var quantity = document.getElementById("quantity").value;
     var quantExp = /^[0-9]+$/;
     if(!(quantity.match(quantExp)))
     {
         alert('Quantity can only be digits.');
         return false;
     }
    return true;  
   }
 </script>

</head>
<body>
<h3>Product details are as below:</h3>
<form action="addToCart.htm?productId=${requestScope.product.productId}&supplierId=${requestScope.supplier.personId}&price=${requestScope.product.price}" method="post" onSubmit="return validation()">

<h4>Product Name: ${requestScope.product.productName}</h4>
<img src="${product.photoName}"  width="100" height="100" /><br/><br/>

Price:  ${requestScope.product.price}
<br/>
Product Description: ${requestScope.product.description}
<br/>
Supplier: ${requestScope.supplier.supplierName}
<br/>

<div>
Quantity Required:
<input type="text" name="quantity" id="quantity" required>
<br/><br/>
<input type="submit" value="Add to Cart" style="margin-left: 60px;">
</div>
</form>
</body>
</html>