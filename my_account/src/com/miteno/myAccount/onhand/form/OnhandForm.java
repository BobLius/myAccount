package com.miteno.myAccount.onhand.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.onhand.entity.Onhand;

public class OnhandForm extends Page<Onhand> {

	private String stock_id;//股票代码
	private String stock_name;//股票代码
	private double buy_mount;//股数
	private double costs;//平均成本
	private double the_end;//成交额
	private double sell_lowest;//最低卖出价	
	
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
	public double getBuy_mount() {
		return buy_mount;
	}
	public void setBuy_mount(double buy_mount) {
		this.buy_mount = buy_mount;
	}
	public double getCosts() {
		return costs;
	}
	public void setCosts(double costs) {
		this.costs = costs;
	}
	public double getThe_end() {
		return the_end;
	}
	public void setThe_end(double the_end) {
		this.the_end = the_end;
	}
	public double getSell_lowest() {
		return sell_lowest;
	}
	public void setSell_lowest(double sell_lowest) {
		this.sell_lowest = sell_lowest;
	}
	
}
