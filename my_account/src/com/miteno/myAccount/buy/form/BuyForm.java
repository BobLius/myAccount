package com.miteno.myAccount.buy.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.buy.entity.Buy;

public class BuyForm extends Page<Buy> {

	private String stock_id;// 股票代码
	private String stock_name;// 股票名称
	private String buy_date;// 买入时间
	private String buy_mount;// 买入股数
	private String buy_every_money;// 每股价格
	private String buy_tolle_money;// 总买入价格
	private String brokerage;// 佣金
	private String brokerage_rate;//佣金率
	private String transfer_fee;// 过户费
	private String costs;// 每股成本
	private String the_end;// 成交额
	private String sell_lowest;// 最低卖出价格
	
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
	public String getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(String buy_date) {
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
	public String getBrokerage_rate() {
		return brokerage_rate;
	}
	public void setBrokerage_rate(String brokerage_rate) {
		this.brokerage_rate = brokerage_rate;
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
