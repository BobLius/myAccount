package com.miteno.myAccount.buy.form;

import java.util.Date;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.buy.entity.Buy;

public class BuyForm extends Page<Buy> {

	private String socket_id;// 股票代码
	private String socket_name;// 股票名称
	private Date buy_date;// 买入时间
	private String buy_mount;// 买入股数
	private String buy_every_money;// 每股价格
	private String buy_tolle_money;// 总买入价格
	private String brokerage;// 佣金
	private String transfer_fee;// 过户费
	private String costs;// 每股成本
	private String the_end;// 成交额
	private String sell_lowest;// 最低卖出价格
	
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
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public String getBuy_mount() {
		return buy_mount;
	}
	public void setBuy_mount(String buy_mount) {
		this.buy_mount = buy_mount;
	}
	public String getBuy_every_money() {
		return buy_every_money;
	}
	public void setBuy_every_money(String buy_every_money) {
		this.buy_every_money = buy_every_money;
	}
	public String getBuy_tolle_money() {
		return buy_tolle_money;
	}
	public void setBuy_tolle_money(String buy_tolle_money) {
		this.buy_tolle_money = buy_tolle_money;
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
	public String getCosts() {
		return costs;
	}
	public void setCosts(String costs) {
		this.costs = costs;
	}
	public String getThe_end() {
		return the_end;
	}
	public void setThe_end(String the_end) {
		this.the_end = the_end;
	}
	public String getSell_lowest() {
		return sell_lowest;
	}
	public void setSell_lowest(String sell_lowest) {
		this.sell_lowest = sell_lowest;
	}
}
