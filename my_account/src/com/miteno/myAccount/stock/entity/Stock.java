package com.miteno.myAccount.stock.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "stock")
public class Stock implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3350227814182404839L;
	@Id
	private String stock_id;
	private String stock_name;
	
	public String getStock_id() {
		return stock_id;
	}
	public void setStock_id(String stock_id) {
		this.stock_id = stock_id;
	}
	public String getStock_name() {
		return stock_name;
	}
	public void setStock_name(String stock_name) {
		this.stock_name = stock_name;
	}
	
}
