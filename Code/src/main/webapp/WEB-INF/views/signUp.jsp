<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Sign Up</title>
</head>
<body>
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
                    //alert(xmlHttp.responseText);
                    //var json = JSON.parse(xmlHttp.responseText);
                    document.getElementById("ajax").innerHTML = xmlHttp.responseText;
                }
            };
            xmlHttp.open("POST", "ajax.htm", true);
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
		
		 var firstName = document.getElementById("firstName").value;
		 var middleName = document.getElementById("middleName").value;
		 var lastName = document.getElementById("lastName").value;
		 var age = document.getElementById("age").value;
		 var addressLine1 = document.getElementById("addressLine1").value;
		 var addressLine2 = document.getElementById("addressLine2").value;
		 var city = document.getElementById("city").value;
		 var state = document.getElementById("state").value;
         var zipCode=document.getElementById("zipCode").value;
         var phoneNumber=document.getElementById("phoneNumber").value;
         var userName=document.getElementById("userName").value;
         var country=document.getElementById("country").value;
         var password=document.getElementById("password").value;
         
	
			var numberExp = /^[0-9]+$/;
            var nameExp = /^[a-zA-Z ]+$/;
              
            if(!(firstName.match(nameExp)))
            {
                alert('Enter valid name.');
                return false;
            } 
            
            if(!(middleName.match(nameExp)))
            {
                alert('Enter valid name.');
                return false;
            } 
            
            if(!(lastName.match(nameExp)))
            {
                alert('Enter valid name.');
                return false;
            } 
            
             if(!(age.match(numberExp)))
             {
                 alert('Age can only be digits.');
                 return false;
             }
             
             if(!(city.match(nameExp)))
             {
                 alert('Ciyt can only be digits.');
                 return false;
             }
             if(!(state.match(nameExp)))
             {
                 alert('State can only be digits.');
                 return false;
             }
             
             if(!(zipCode.match(numberExp)))
             {
                 alert('ZipCode can only be digits.');
                 return false;
             }
             
             if(!(age.match(numberExp)))
             {
                 alert('Age can only be digits.');
                 return false;
             }
             
             var ageLength = age.value.length;
             if(ageLength > 5)
             {
                 alert('Age can be less than 100.');
                 return false;
             }
             
             
             if(!(phoneNumber.match(phoneNumber)))
             {
                 alert('Phone Number can only be digits.');
                 return false;
             }
             
             var phoneLength = phoneNumber.value.length;
             if(phoneLength > 10)
			 {
                 alert('Phone Number should be 10 digits.');
                 return false;
             }
             
             if(phoneLength<10)
			 {
                 alert('Phone Number should be 10 digits.');
                 return false;
             }
             
             var usernameLength = userName.value.length;
             if(usernameLength<4)
			 {
                 alert('Username should atleast be 4 characters.');
                 return false;
             }
             
             var passwordLength = password.value.length;
             if(passwordLength < 4)
			 {
                 alert('Password should atleast be 4 characters.');
                 return false;
             }
             
             
             return true;
		}
         
        </script>
        
 <h4 style="margin-left: 100px;">Customer Sign Up</h4>
 <form:form action="signUp.htm" commandName="customer" method="post" onSubmit="return validation()">
	
  First Name : 
  <form:input id="firstName" path="firstName" size="40" style="margin-left: 21px;"/> <font color="red"><form:errors path="firstName"/></font>
  <br/><br/>
  
  Middle Name : 
  <form:input id="middleName" path="middleName" size="40" style="margin-left: 5px;"/> <font color="red"><form:errors path="middleName"/></font>
  <br/><br/>
  
  Last Name : 
  <form:input id="lastName" path="lastName" size="40" style="margin-left: 21px;"/> <font color="red"><form:errors path="lastName"/></font>
  <br/><br/>
  
  Gender : 
 <form:radiobutton path="gender" value="Male" style="margin-left: 40px;" checked="true" />Male 
  <br/><form:radiobutton path="gender"  style="margin-left: 100px;" value="Female" />Female
 <form:errors path="gender" cssClass="error" />
   <br/><br/>
   Age: 
  <form:input id="age" path="age" size="40" style="margin-left: 70px;"/> <font color="red"><form:errors path="age"/></font>
  <br/><br/>
  
  Address Line1 :
  <form:input id="addressLine1"  path="address.addressLine1" size="40" style="margin-left: 2px;"/> <font color="red"><form:errors path="address.addressLine1"/></font>
   <br/><br/>
  Address Line2:
  <form:input id="addressLine2" path="address.addressLine2" size="40" style="margin-left: 4px;"/> <font color="red"><form:errors path="address.addressLine2"/></font>
   <br/><br/>
  City:
  <form:input id="city" path="address.city" size="40" style="margin-left: 68px;" /> <font color="red"><form:errors path="address.city"/></font>
   <br/><br/>
  State:
  <form:input id="state" path="address.state" size="40" style="margin-left: 65px;" /> <font color="red"><form:errors path="address.state"/></font>
   <br/><br/>
  Country:
  <form:input id="country" path="address.country" size="40" style="margin-left: 46px;" /> <font color="red"><form:errors path="address.country"/></font>
   <br/><br/>
  Zip Code:
  <form:input id="zipCode" path="address.zipCode" size="40" style="margin-left: 41px;" /> <font color="red"><form:errors path="address.zipCode"/></font>
   <br/><br/>
  Phone Number:
  <form:input id="phoneNumber" path="phoneNumber" size="40" style="margin-left: 7px;" /> <font color="red"><form:errors path="phoneNumber"/></font>
   <br/><br/>
   
   Username:
  <form:input path="userName" id ="userName" size="40" style="margin-left: 42px;" onblur="return checkUser()" /> <font color="red"><form:errors path="userName"/></font>
   <div id="ajax" style="color:red"></div>
   <br/>
   Password:
  <form:input id="password" path="password" size="40" style="margin-left: 43px;" /> <font color="red"><form:errors path="password"/></font>
   <br/><br/>  
   
   <c:if test="${requestScope.isCheckingOut.equals('true')}">
    	 	<input type="hidden" name="isCheckingOut" value="true" />
   </c:if>
 
  <input type="submit" value="Register" style="margin-left: 100px;" />

 </form:form>
 
</body>
</html>