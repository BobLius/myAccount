package com.miteno.myAccount.sell.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.sell.entity.Sell;

public class SellForm extends Page<Sell>{

	private String stock_id;//股票代码
	private String stock_name;//股票名称
	private String sell_date;//卖出时间
	private String sell_mount;//卖出股数
	private String sell_every_money;//每股价格
	private String sell_tolle_money;//总卖出价格
	private String brokerage;//佣金
	private String transfer_fee;//过户费
	private String stamp;//印花税
	private String the_end;//成交额
	private String create_start_date;
	private String create_end_date;
	private String record_flag;//记录标识 0：为记录到我的股票  1：已记录
	
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
	public String getSell_date() {
		return sell_date;
	}
	public void setSell_date(String sell_date) {
		this.sell_date = sell_date;
	}
	public String getSell_mount() {
		return sell_mount;
	}
	public void setSell_mount(String sell_mount) {
		this.sell_mount = sell_mount;
	}
	public String getSell_every_money() {
		return sell_every_money;
	}
	public void setSell_every_money(String sell_every_money) {
		this.sell_every_money = sell_every_money;
	}
	public String getSell_tolle_money() {
		return sell_tolle_money;
	}
	public void setSell_tolle_money(String sell_tolle_money) {
		this.sell_tolle_money = sell_tolle_money;
	}
	public String getBrokerage() {
		return brokerage;
	}
	public void setBrokerage(String brokerage) {
		this.brokerage = brokerage;
	}
	public String getTransfer_fee() {
		return transfer_fee;
	}
	public void setTransfer_fee(String transfer_fee) {
		this.transfer_fee = transfer_fee;
	}
	public String getStamp() {
		return stamp;
	}
	public void setStamp(String stamp) {
		this.stamp = stamp;
	}
	public String getThe_end() {
		return the_end;
	}
	public void setThe_end(String the_end) {
		this.the_end = the_end;
	}
	public String getCreate_start_date() {
		return create_start_date;
	}
	public void setCreate_start_date(String create_start_date) {
		this.create_start_date = create_start_date;
	}
	public String getCreate_end_date() {
		return create_end_date;
	}
	public void setCreate_end_date(String create_end_date) {
		this.create_end_date = create_end_date;
	}
	public String getRecord_flag() {
		return record_flag;
	}
	public void setRecord_flag(String record_flag) {
		this.record_flag = record_flag;
	}
}
