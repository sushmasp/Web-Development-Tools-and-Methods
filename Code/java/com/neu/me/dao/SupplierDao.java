package com.neu.me.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.tool.schema.internal.HibernateSchemaManagementTool;

import com.neu.me.pojo.Address;
import com.neu.me.pojo.Admin;
import com.neu.me.pojo.Supplier;
import com.neu.me.pojo.UserAccount;

public class SupplierDao extends DAO{
	
	public void addSupplier(String supplierName,String addressLine1,String addressLine2,String city,String state,String country,String zipCode,String phoneNumber,String emailAddress,String userName,String password,Admin admin) throws Exception
	{
		try
		{
			txnBegin();
			
			Supplier s = new Supplier();
			Address a = new Address();
			UserAccount ua = new UserAccount();
			
			s.setSupplierName(supplierName);
			s.setPhoneNumber(phoneNumber);
			
			a.setAddressLine1(addressLine1);
			a.setAddressLine2(addressLine2);
			a.setCity(city);
			a.setState(state);
			a.setCountry(country);
			a.setZipCode(zipCode);
			
			s.setAddress(a);
			
			//Setting Admin in Supplier
			s.setAdmin(admin);
			
			//Adding supplier to Admin's SupplierList
			admin.getSupplierList().add(s);
			
			//Creating entry for Supplier in UserAccount table
			ua.setPassword(password);
			ua.setUserName(userName);
			ua.setRole("supplier");
			ua.setPerson(s);
			
	        getSession().saveOrUpdate(admin);
	        getSession().save(ua);
	        
	        txnCommit();
        }
	
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not save Supplier " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}

	}
	
	public List<Supplier> getSupplierList(Admin admin) throws Exception
	{
		try
		{
			Query q = getSession().createQuery("select supplierList from Admin" );
			List<Supplier> list = q.list();
			
			return list;
		}
		catch (HibernateException e) 
		{
			throw new Exception("Could not fetch Suppliers List. " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}

		
	}
	
	public Supplier getSupplierByName(String name) throws Exception
	{
		try
		{
			Query q = getSession().createQuery("from Supplier where supplierName = :name");
			q.setString("name",name);
			Supplier s = (Supplier)q.uniqueResult();
			return s;
		}
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not fetch Supplier " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}

	}
	
	public void deleteSupplier(Admin a,Supplier s) throws Exception
	{
		try
		{
			int rowsAffected=0;
			txnBegin();
			
			Query q1 = getSession().createQuery("delete from UserAccount where person = :person");
			q1.setParameter("person", s);
		    rowsAffected = q1.executeUpdate();
		    
			Query q = getSession().createQuery("delete from Supplier where personId = :supplierId");
			q.setInteger("supplierId", s.getPersonId());
		    rowsAffected = q.executeUpdate();
		    
		    //Removing from Admin's Supplier List
			a.getSupplierList().remove(s);
			
			getSession().saveOrUpdate(a);
			txnCommit();
		}
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not delete Supplier " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}

	}
	

}
