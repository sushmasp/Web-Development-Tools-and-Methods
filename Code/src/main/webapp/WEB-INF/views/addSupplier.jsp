
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Supplier</title>
<script>
 
 //AJAX
        var xmlHttp;
        xmlHttp = GetXmlHttpObject();
        function checkUser() 
        {
           if (xmlHttp == null)
            {
                alert("Your browser does not support AJAX!");
                return;
            }
            var userName = document.getElementById("userName").value;
            var query = "action=ajaxCheck&userName="+userName;

            xmlHttp.onreadystatechange = function stateChanged()
            {
                if (xmlHttp.readyState == 4)
                {
                    document.getElementById("ajax").innerHTML = xmlHttp.responseText;
                }
            };
            xmlHttp.open("POST", "ajaxSupplier.htm", true);
            xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlHttp.send(query);
           return false;
        }
        
         function GetXmlHttpObject()
        {
            var xmlHttp = null;
            try
            {
                // Firefox, Opera 8.0+, Safari
                xmlHttp = new XMLHttpRequest();
            } catch (e)
            {
                // Internet Explorer
                try
                {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e)
                {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
            }
            return xmlHttp;
        }
         

			function validation()
			{
			
			 var supplierName = document.getElementById("supplierName").value;
             var addressLine1=document.getElementById("addressLine1").value;
			 var addressLine2=document.getElementById("addressLine2").value;
             var city =document.getElementById("city").value;
             var state=document.getElementById("state").value;
             var country=document.getElementById("country").value;
			 var zipCode=document.getElementById("zipCode").value;
             var phoneNumber =document.getElementById("phoneNumber").value;
             var userName=document.getElementById("userName").value;
             var emailAddress=document.getElementById("emailAddress").value;
             var password=document.getElementById("password").value;
             
             
                var nameNumberExp= /^[0-9#a-zA-Z ]+$/;
				var numberExp = /^[0-9]+$/;
                var nameExp = /^[a-zA-Z ]+$/;
				var phoneExp = /^[0-9 ]+$/;
                  
                 if(!(supplierName.match(nameExp)))
                 {
                     alert('Name can only be characters.');
                     return false;
                 }
					if(!(addressLine1.match(nameNumberExp)))
                 {
                     alert('AddressLine 1 can contain characters or digits or # only.');
                     return false;
                 }
					if(!(addressLine2.match(nameNumberExp)))
                 {
                     alert('AddressLine 2 can contain characters or digits or # only.');
                     return false;
                 }
					if(!(city.match(nameExp)))
                 {
                     alert('City can only be characters.');
                     return false;
                 }
					if(!(state.match(nameExp)))
                 {
                     alert('State can only be characters.');
                     return false;
                 }
					if(!(country.match(nameExp)))
                 {
                     alert('Country can only be characters.');
                     return false;
                 }
					if(!(zipCode.match(numberExp)))
                 {
                     alert('ZipCode can only be digits.');
                     return false;
                 }
			
					if(!(phoneNumber.match(phoneExp)))
                 {
                     alert('Phone Number can contain numerals or () or - or + only.');
                     return false;
                 }
						
					return true;
		     
		}
         
        
        </script>

</head>
<body>


 <h4 style="margin-left: 100px;">Add Supplier</h4>
 <form action="addSupplier.htm" method="post" onSubmit="return validation()">
	
  Supplier Name : 
  <input id="supplierName" name="supplierName" size="40" style="margin-left: 0px;" required/> 
  <br/><br/>
  Address Line1 :
  <input id="addressLine1" name="addressLine1" size="40" style="margin-left: 2px;" required/> 
   <br/><br/>
  Address Line2:
  <input id="addressLine2" name="addressLine2" size="40" style="margin-left: 4px;"/> 
   <br/><br/>
  City:
  <input id="city" name="city" size="40" style="margin-left: 68px;" required /> 
   <br/><br/>
  State:
  <input id="state" name="state" size="40" style="margin-left: 65px;" required /> 
   <br/><br/>
  Country:
  <input id="country" name="country" size="40" style="margin-left: 46px;" required /> 
   <br/><br/>
  Zip Code:
  <input id="zipCode" name="zipCode" size="40" style="margin-left: 41px;" required/> 
   <br/><br/>
  Phone Number:
  <input id="phoneNumber" name="phoneNumber" size="40" style="margin-left: 7px;" required/> 
   <br/><br/>
   
   Username:
  <input id="userName" name="userName" size="40" style="margin-left: 42px;" onblur="return checkUser()" required/> 
   <div id="ajax" style="color:red"></div>
   <br/>
   
   Password:
  <input id="password" name="password" size="40" style="margin-left: 43px;" required/> 
   <br/><br/>
   
 
  <input type="submit" value="Save Supplier" style="margin-left: 100px;" target="contents"/>

 </form>
 
</body>
</html>