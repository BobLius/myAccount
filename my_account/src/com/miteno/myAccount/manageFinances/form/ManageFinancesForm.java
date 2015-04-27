package com.miteno.myAccount.manageFinances.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.manageFinances.entity.ManageFinances;

public class ManageFinancesForm extends Page<ManageFinances> {

	private String name;
	private double money;
	private String start_date;
	private String end_date;
	
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
