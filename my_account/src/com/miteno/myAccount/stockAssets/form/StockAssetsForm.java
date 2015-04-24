package com.miteno.myAccount.stockAssets.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.stockAssets.entity.StockAssets;

public class StockAssetsForm extends Page<StockAssets>  {

	private double total_assets;//总资产	
	private double use_assets;//可用资产	
	private double stock_assets;//证券资产
	private double principal;//本金
	private double profit_loss;//总盈亏
	private String  current_dates;//截止到当前时间
	private String id;
	
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
