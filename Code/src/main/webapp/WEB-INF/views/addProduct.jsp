<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product</title>
<script>
	function validation()
			{
			
			 var price = document.getElementById("price").value;
             var availability=document.getElementById("availability").value;
		
				var numberExp = /^[0-9]+$/;
                var priceExp = /^[0-9.]+$/;
                  
                if(!(availability.match(numberExp)))
                {
                    alert('Availability can only be digits.');
                    return false;
                }    
                
                 if(!(price.match(priceExp)))
                 {
                     alert('Enter valid price');
                     return false;
                 }
                 
                 
                 return true;
			}
</script>
</head>
<body>
        
 <h4 style="margin-left: 100px;">Add Product</h4>
 <form:form action="addProduct.htm" commandName="product" method="post" enctype="multipart/form-data" onSubmit="return validation()">
	
  Product Name : 
  <form:input id="productName" path="productName" size="40" style="margin-left: 10px;" /> <font color="red"><form:errors path="productName"/></font>
  <br/><br/>
  
  Availability : 
  <form:input id="availability" path="availability" size="40" style="margin-left: 25px;" /> <font color="red"><form:errors path="availability"/></font>
  <br/><br/>
  
  Price : 
  <form:input id="price" path="price" size="40" style="margin-left: 67px;" /> <font color="red"><form:errors path="price"/></font>
  <br/><br/>
  
  Description : 
  <form:textarea id="description" path="description" size="40" style="margin-left: 25px;" /> <font color="red"><form:errors path="description"/></font>
  <br/><br/>
  
  Photo:
  <form:input id="photo" path="photo" name="photo" type="file" style="margin-left: 70px;" /><font color="red"><form:errors path="photo"/></font>
  <br/><br/>

  <input type="submit" value="Add Product" style="margin-left: 100px;" target="contents"/>

 </form:form>
 
</body>
</html>