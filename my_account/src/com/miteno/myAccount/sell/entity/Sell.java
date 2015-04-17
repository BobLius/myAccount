package com.miteno.myAccount.sell.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

import com.miteno.myAccount.stock.entity.Stock;

@Entity(name = "sell")
public class Sell implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8661253298109003766L;
	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	private String id;
	private String stock_id;//股票代码
	private String sell_date;//卖出时间
	private double sell_mount;//卖出股数
	private double sell_every_money;//每股价格
	private double sell_tolle_money;//总卖出价格
	private double brokerage;//佣金
	private double brokerage_rate;
	private double transfer_fee;//过户费
	private double stamp;//印花税
	private double the_end;//成交额
	private String record_flag;//记录标识 0：为记录到我的股票  1：已记录
	
	@OneToOne
	@JoinColumn(name = "stock_id", referencedColumnName = "stock_id", insertable = false, updatable = false)
	private Stock stock;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStock_id() {
		return stock_id;
	}
	public void setStock_id(String stock_id) {
		this.stock_id = stock_id;
	}
	public String getSell_date() {
		return sell_date;
	}
	public void setSell_date(String sell_date) {
		this.sell_date = sell_date;
	}
	public double getSell_mount() {
		return sell_mount;
	}
	public void setSell_mount(double sell_mount) {
		this.sell_mount = sell_mount;
	}
	public double getSell_every_money() {
		return sell_every_money;
	}
	public void setSell_every_money(double sell_every_money) {
		this.sell_every_money = sell_every_money;
	}
	public double getSell_tolle_money() {
		return sell_tolle_money;
	}
	public void setSell_tolle_money(double sell_tolle_money) {
		this.sell_tolle_money = sell_tolle_money;
	}
	public double getBrokerage() {
		return brokerage;
	}
	public void setBrokerage(double brokerage) {
		this.brokerage = brokerage;
	}
	public double getBrokerage_rate() {
		return brokerage_rate;
	}
	public void setBrokerage_rate(double brokerage_rate) {
		this.brokerage_rate = brokerage_rate;
	}
	public double getTransfer_fee() {
		return transfer_fee;
	}
	public void setTransfer_fee(double transfer_fee) {
		this.transfer_fee = transfer_fee;
	}
	public double getStamp() {
		return stamp;
	}
	public void setStamp(double stamp) {
		this.stamp = stamp;
	}
	public double getThe_end() {
		return the_end;
	}
	public void setThe_end(double the_end) {
		this.the_end = the_end;
	}
	public Stock getStock() {
		return stock;
	}
	public void setStock(Stock stock) {
		this.stock = stock;
	}
	public String getRecord_flag() {
		return record_flag;
	}
	public void setRecord_flag(String record_flag) {
		this.record_flag = record_flag;
	}
}
