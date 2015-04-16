package com.miteno.myAccount.brokerage.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.brokerage.entity.Brokerage;

public class BrokerageForm extends Page<Brokerage> {

	private String create_date;//创建时间
	private String flag;//有效标识
	private String brokerage;//佣金率
	private String create_start_date;
	private String create_end_date;
	
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getBrokerage() {
		return brokerage;
	}
	public void setBrokerage(String brokerage) {
		this.brokerage = brokerage;
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
}
