package com.neu.me.controller;

import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.neu.me.dao.CustomerDao;
import com.neu.me.dao.UserAccountDao;
import com.neu.me.pojo.Admin;
import com.neu.me.pojo.Customer;
import com.neu.me.pojo.Order;
import com.neu.me.pojo.UserAccount;
import com.neu.me.validator.CustomerValidator;
import com.neu.me.validator.ProductValidator;


@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("userAccountDao")
	UserAccountDao userAccountDao;
	
	@Autowired
	@Qualifier("customerDao")
	CustomerDao customerDao;
	
	@Autowired
	@Qualifier("customerValidator")
	CustomerValidator customerValidator;
	
	@InitBinder
	private void initBinder(WebDataBinder binder)
	{
		binder.setValidator(customerValidator);
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/index.htm")
	public String getHomePage(){
		return "home";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/logIn.htm")
	public String getLogInPage(){
		return "login";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/logOut.htm")
	public String logOut(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		return "home";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/home.htm")
	public String onAddToCartError(HttpServletRequest request){
		 try 
		 {
			 HttpSession session = request.getSession();
			 UserAccount ua = (UserAccount)session.getAttribute("userAccount");
			 if(ua==null)
			 {
				 return "login";
			 }
			 else
			 {
				 return("home");
			 }
		 
		 }
		 
		     catch (Exception e) 
				 {
		  	   System.out.println(e.getMessage());
				 }
				 
			return null;	
	 }
	
	@RequestMapping(method=RequestMethod.POST,value="/home.htm")
    protected String doSubmitAction(HttpServletRequest request) throws Exception
    {
        try
        {
        	
        	String userName = request.getParameter("userName");
        	String password = request.getParameter("password");

        	UserAccount userAccount = userAccountDao.getUserAccount(userName, password);
        	
        	if(userAccount!=null)
        	{
        		HttpSession session = request.getSession();
        		session.setAttribute("userAccount", userAccount);
        		String isCheckingOut = request.getParameter("isCheckingOut");
        		
	        	if(userAccount.getRole().equalsIgnoreCase("admin"))
	        	{
	        		if(isCheckingOut.equalsIgnoreCase("true"))
        			{
	        			request.setAttribute("error", "true");
        			}
		        	else
		        	{
		        		return "adminHome";
		        	}
	        	}
	        	else if (userAccount.getRole().equalsIgnoreCase("supplier"))
	        	{
	        		if(isCheckingOut.equalsIgnoreCase("true"))
        			{
	        			request.setAttribute("error", "true");
        			}
		        	else
		        	{
		        		return "supplierHome";
		        	}
	        	}
	        	else if (userAccount.getRole().equalsIgnoreCase("customer"))
	        	{
	        		if(isCheckingOut.equalsIgnoreCase("true"))
	        		{
	        			return "viewCart";
	        		}
	        		else
	        		{
	        			return "home";
	        		}		
	        	}
        	}
        	else
        	{
        		request.setAttribute("error", "true");
        	}
        	
        	
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
       return("login");
    }
    
	@RequestMapping(method = RequestMethod.GET,value="/signUp.htm")
	public String getAddSupplierPage(@ModelAttribute("customer")Customer customer, BindingResult result,HttpServletRequest request){
		return "signUp";
	}

	@RequestMapping(method = RequestMethod.POST,value="/signUp.htm")
	public String getCustomerAddedPage(@ModelAttribute("customer")Customer customer, BindingResult result,HttpServletRequest request,HttpServletResponse response){
			try 
			{
				customerValidator.validate(customer, result);
				
				if(result.hasErrors())
				{
					return "signUp";
				}
				customerDao.addCustomer(customer);
				String isCheckingOut = request.getParameter("isCheckingOut");
        		if(isCheckingOut.equalsIgnoreCase("true"))
        		{
        			return "viewCart";
        		}
        		else
        		{
        			request.setAttribute("task", "registered");
        			return "customerSuccess";
        		}		
			} 
			catch (Exception e)
			{
				System.out.println(e.getMessage());
			}
			request.setAttribute("task", "registered");
			return "customerSuccess";
		}
		
	@RequestMapping(method = RequestMethod.POST,value="/ajax.htm")
	public String getAjaxChecked(HttpServletRequest request,HttpServletResponse response){
			try 
			{
			  PrintWriter out = response.getWriter();
			  String userName = request.getParameter("userName");
	          if(userAccountDao.userNameExists(userName))
	          {
	              
	               JSONObject obj = new JSONObject();
	               obj.put("message","Username already exists");
	               out.println(obj.get("message"));      
	           }
			}
	        catch (Exception e)
			  {
					System.out.println(e.getMessage());
			  }
	        return null;
		}

}
