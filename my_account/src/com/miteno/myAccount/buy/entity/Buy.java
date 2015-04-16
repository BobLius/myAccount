package com.miteno.myAccount.buy.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

import com.miteno.myAccount.stock.entity.Stock;

@Entity(name = "buy")
public class Buy implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8846167000880998821L;
	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	private String id;
	private String stock_id;// 股票代码
	private String buy_date;// 买入时间
	private double buy_mount;// 买入股数
	private double buy_every_money;// 每股价格
	private double buy_tolle_money;// 总买入价格
	private double brokerage;// 佣金
	private double brokerage_rate;//佣金率
	private double transfer_fee;// 过户费
	private double costs;// 每股成本
	private double the_end;// 成交额
	
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

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	public double getBuy_mount() {
		return buy_mount;
	}

	public void setBuy_mount(double buy_mount) {
		this.buy_mount = buy_mount;
	}

	public double getBuy_every_money() {
		return buy_every_money;
	}

	public void setBuy_every_money(double buy_every_money) {
		this.buy_every_money = buy_every_money;
	}

	public double getBuy_tolle_money() {
		return buy_tolle_money;
	}

	public void setBuy_tolle_money(double buy_tolle_money) {
		this.buy_tolle_money = buy_tolle_money;
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

	public Stock getStock() {
		return stock;
	}

	public void setStock(Stock stock) {
		this.stock = stock;
	}

}
