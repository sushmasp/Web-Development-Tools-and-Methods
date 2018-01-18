package com.neu.me.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.neu.me.pojo.Address;
import com.neu.me.pojo.Customer;
import com.neu.me.pojo.Product;
import com.neu.me.pojo.Supplier;
import com.neu.me.pojo.UserAccount;

public class ProductDao extends DAO {
	public void addProduct(Product product,Supplier supplier) throws Exception
	{
		try
		{
			txnBegin();
			
			Product p = new Product();
			
			p.setProductName(product.getProductName());
			p.setAvailability(product.getAvailability());
			p.setPrice(product.getPrice());
			p.setDescription(product.getDescription());
			p.setPhotoName(product.getPhotoName());
			
			//Setting supplier in product
			p.setSupplier(supplier);
			
		    //Adding product in Supplier's ProductList
			supplier.getProductList().add(p);
			
	        getSession().saveOrUpdate(supplier);
	        
	        txnCommit();
        }
	
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not save Product " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}
	}
	
	public List getProductList(Supplier s) throws Exception {
		try 
		{
			Criteria c = getSession().createCriteria(Product.class);
			c.add(Restrictions.eq("supplier",s));
			List results = c.list();
			return results;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not list the products " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	
	public List getProductList() throws Exception {
		try 
		{
			Criteria c = getSession().createCriteria(Product.class);
			List results = c.list();
			return results;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not list the products " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	
	
	public List getProducts(String key) throws Exception {
		try 
		{
			Criteria c = getSession().createCriteria(Product.class);
			c.add(Restrictions.like("productName", key ,MatchMode.START));
			List allResults = c.list();
			return allResults;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not list the products " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	
	public List getProducts(String key,int pageNumber) throws Exception {
		try 
		{
			Criteria c = getSession().createCriteria(Product.class);
			c.add(Restrictions.like("productName", key ,MatchMode.START));
			c.setFirstResult((pageNumber*2)+1);
			c.setMaxResults(2);
			List allResults = c.list();
			return allResults;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not list the products " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	
	public Product getProductById(int productId)throws Exception {
		try 
		{
			//Criteria c = getSession().createCriteria(Product.class);
			//c.add(Restrictions.eq("productId",productId));
			Query q = getSession().createQuery("from Product where productId = :productId");
			q.setInteger("productId",productId);
			Product result = (Product)q.uniqueResult();
			return result;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not fetch product " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	
	
	public void deleteProduct(int productId)throws Exception {
		try 
		{
			
			txnBegin();
			Criteria c = getSession().createCriteria(Product.class);
			c.add(Restrictions.eq("productId",productId));
			Product p = (Product)c.uniqueResult();
			Supplier s = p.getSupplier();
		    
			Query q = getSession().createQuery("delete from Product where productId = :productId");
			q.setInteger("productId",productId);
		    int  rowsAffected = q.executeUpdate();
		  
			
			//Removing product in Supplier's ProductList
			s.getProductList().remove(p);
			
			
	        getSession().saveOrUpdate(s);
	       
	        txnCommit();
			
		} 
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not edit " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
		
	}
	
	public String editProduct(int productId,int avaialability,float price,String description)throws Exception {
		try 
		{
			
			Product p = getProductById(productId);
			Supplier s = p.getSupplier();
			Product newProduct = p;
			txnBegin();
			
			//Removing product in Supplier's ProductList
			s.getProductList().remove(p);
			
			newProduct.setAvailability(avaialability);
			newProduct.setDescription(description);
			newProduct.setPrice(price);
			
		    //Adding product in Supplier's ProductList
			s.getProductList().add(newProduct);		
	        getSession().saveOrUpdate(s);
			
	        return newProduct.getProductName();
			
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not edit " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
}
