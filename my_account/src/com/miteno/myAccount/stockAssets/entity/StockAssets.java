package com.miteno.myAccount.stockAssets.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity(name = "stock_assets")
public class StockAssets implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2798278885733479863L;
	
	@Id
	@GeneratedValue(generator="hibernate-uuid")
    @GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	private String id;
	private double total_assets;//总资产	
	private double use_assets;//可用资产	
	private double stock_assets;//证券资产
	private double principal;//本金
	private double profit_loss;//总盈亏
	private String current_dates;//截止到当前时间
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public double getTotal_assets() {
		return total_assets;
	}
	public void setTotal_assets(double total_assets) {
		this.total_assets = total_assets;
	}
	public double getUse_assets() {
		return use_assets;
	}
	public void setUse_assets(double use_assets) {
		this.use_assets = use_assets;
	}
	public double getStock_assets() {
		return stock_assets;
	}
	public void setStock_assets(double stock_assets) {
		this.stock_assets = stock_assets;
	}
	public double getPrincipal() {
		return principal;
	}
	public void setPrincipal(double principal) {
		this.principal = principal;
	}
	public double getProfit_loss() {
		return profit_loss;
	}
	public void setProfit_loss(double profit_loss) {
		this.profit_loss = profit_loss;
	}
	public String getCurrent_dates() {
		return current_dates;
	}
	public void setCurrent_dates(String current_dates) {
		this.current_dates = current_dates;
	}

}
