package com.neu.me.dao;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.neu.me.pojo.Address;
import com.neu.me.pojo.Admin;
import com.neu.me.pojo.Customer;
import com.neu.me.pojo.Order;
import com.neu.me.pojo.OrderItem;
import com.neu.me.pojo.Product;
import com.neu.me.pojo.UserAccount;

public class CustomerDao extends DAO{
		
		public void addCustomer(Customer customer) throws Exception
		{
			try
			{
				txnBegin();
				
				Customer c = new Customer();
				Address a = new Address();
				UserAccount ua = new UserAccount();
				
				c.setFirstName(customer.getFirstName());
				c.setMiddleName(customer.getMiddleName());
				c.setLastName(customer.getLastName());
				c.setGender(customer.getGender());
				c.setAge(customer.getAge());
				c.setPhoneNumber(customer.getPhoneNumber());
				
				a.setAddressLine1(customer.getAddress().getAddressLine1());
				a.setAddressLine2(customer.getAddress().getAddressLine2());
				a.setCity(customer.getAddress().getCity());
				a.setState(customer.getAddress().getState());
				a.setCountry(customer.getAddress().getCountry());
				a.setZipCode(customer.getAddress().getZipCode());	
				
				c.setAddress(a);
				
				ua.setPassword(customer.getPassword());
				ua.setUserName(customer.getUserName());
				ua.setRole("customer");
				ua.setPerson(customer);
				
		        getSession().save(customer);
		        getSession().save(ua);
		        
		        txnCommit();
	        }
		
			catch (HibernateException e) 
			{
				throw new Exception("Could not save Customer " + e.getMessage());
			}
		
			finally
			{
				sessionClose();
			}
		}
		
		public void addOrder(Customer customer,ArrayList<Product> myCart) throws Exception{
		try
		{
			txnBegin();
			
			Order o = new Order();
			
			for(Product p:myCart)
			{
				OrderItem oi =new OrderItem();
				oi.setProduct(p);
				oi.setQuantity(p.getAvailability());
				//Bidirectional
				oi.setOrder(o);
				o.getOrderItemList().add(oi);
			}
			
			o.setStatus("Open");
			
			Query q = getSession().createQuery("from Admin");
			Admin admin = (Admin)q.uniqueResult();
			
			//Setting admin in Order
			o.setAdmin(admin);
			
			//Setting customer in Order
			o.setCustomer(customer);
			
			//Adding order in customer's orderList
			customer.getOrderList().add(o);
			
			//Adding order in admin's orderList
			admin.getOrderList().add(o);
			
			getSession().saveOrUpdate(admin);
			getSession().saveOrUpdate(customer);
			
			txnCommit();
				
		}
		
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not save Customer " + e.getMessage());
		}
		
		finally
		{
			sessionClose();
		}
	}
		
		
		

}
