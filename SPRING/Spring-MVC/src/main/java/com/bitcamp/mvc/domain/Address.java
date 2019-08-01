package com.bitcamp.mvc.domain;

public class Address {
	
	private String zipcode;
	private String Address1;
	private String Address2;
	
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return Address1;
	}
	public void setAddress1(String address1) {
		Address1 = address1;
	}
	public String getAddress2() {
		return Address2;
	}
	public void setAddress2(String address2) {
		Address2 = address2;
	}

	@Override
	public String toString() {
		return "Address [zipcode=" + zipcode + ", Address1=" + Address1 + ", Address2=" + Address2 + "]";
	}
	
	
	

}
