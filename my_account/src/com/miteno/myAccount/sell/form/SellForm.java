package com.miteno.myAccount.sell.form;

import java.util.Date;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.sell.entity.Sell;

public class SellForm extends Page<Sell>{

	private String socket_id;//股票代码
	private String socket_name;//股票名称
	private Date selldate;//卖出时间
	private String sell_mount;//卖出股数
	private String sell_every_money;//每股价格
	private String sell_tolle_money;//总卖出价格
	private String brokerage;//佣金
	private String transfer_fee;//过户费
	private String stamp;//印花税
	private String the_end;//成交额
	
	public String getSocket_id() {
		return socket_id;
	}
	public void setSocket_id(String socket_id) {
		this.socket_id = socket_id;
	}
	public String getSocket_name() {
		return socket_name;
	}
	public void setSocket_name(String socket_name) {
		this.socket_name = socket_name;
	}
	public Date getSelldate() {
		return selldate;
	}
	public void setSelldate(Date selldate) {
		this.selldate = selldate;
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
}
