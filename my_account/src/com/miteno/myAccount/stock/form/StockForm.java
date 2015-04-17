package com.miteno.myAccount.stock.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.stock.entity.Stock;

public class StockForm extends Page<Stock> {

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
