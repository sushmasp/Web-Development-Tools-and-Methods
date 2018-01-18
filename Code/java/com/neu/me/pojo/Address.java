package com.neu.me.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tbl_address")
public class Address
{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="addressId")
	private int addressId;
	
	@Column(name="addressLine1")
	private String addressLine1;
	
	@Column(name="addressLine2")
	private String addressLine2;
	
	@Column(name="city")
	private String city;
	
	@Column(name="state")
    private String state;
	
	@Column(name="country")
	private String country;
	
	@Column(name="zipCode")
	private String zipCode;
	  
	public Address()
	{
		
	}
	
	
	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getAddressLine1() {
		return addressLine1;
	}
	
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	
	public String getAddressLine2() {
		return addressLine2;
	}
	
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getCountry() {
		return country;
	}
	
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getZipCode() {
		return zipCode;
	}
	
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	  
	  

}
