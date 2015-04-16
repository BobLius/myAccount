package com.miteno.myAccount.onhand.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.miteno.myAccount.stock.entity.Stock;

@Entity(name = "onhand")
public class Onhand implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6785408678951621096L;
	@Id
	private String stock_id;//股票代码
	private double buy_mount;//股数
	private double costs;//平均成本
	private double the_end;//成交额
	private double sell_lowest;//最低卖出价	
	@OneToOne
	@JoinColumn(name = "stock_id", referencedColumnName = "stock_id", insertable = false, updatable = false)
	private Stock stock;
	
	public String getStock_id() {
		return stock_id;
	}
	public void setStock_id(String stock_id) {
		this.stock_id = stock_id;
	}
	public Stock getStock() {
		return stock;
	}
	public void setStock(Stock stock) {
		this.stock = stock;
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
