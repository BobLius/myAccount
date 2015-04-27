package com.miteno.myAccount.bankSave.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.bankSave.entity.BankSave;

public class BankSaveForm extends Page<BankSave> {

	private String bank_name;//银行名称
	private String card_no;//卡号
	private double money;//余额
	private String record_date;//记录时间
	private String start_date;
	private String end_date;
	
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getRecord_date() {
		return record_date;
	}
	public void setRecord_date(String record_date) {
		this.record_date = record_date;
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
