package com.miteno.myAccount.myAssets.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.myAssets.entity.MyAssets;

public class MyAssetsForm extends Page<MyAssets> {

	private double money;//发生金额
	private String date;//发生时间
	private String start_date;
	private String end_date;
	
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
}
