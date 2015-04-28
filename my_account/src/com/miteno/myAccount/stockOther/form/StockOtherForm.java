package com.miteno.myAccount.stockOther.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.stockOther.entity.StockOther;

public class StockOtherForm extends Page<StockOther> {

	private String name;//名称
	private double money;//发生金额
	private String date;//发生时间
	private String start_date;
	private String end_date;
	private String record_flag;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	public String getRecord_flag() {
		return record_flag;
	}
	public void setRecord_flag(String record_flag) {
		this.record_flag = record_flag;
	}
}
