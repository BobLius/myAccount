package com.miteno.myAccount.bank.form;

import com.miteno.common.dao.Page;
import com.miteno.myAccount.bank.entity.Bank;

public class BankForm extends Page<Bank> {

	private String bank_id;//银行编号
	private String bank_name;//银行名称
	
	public String getBank_id() {
		return bank_id;
	}
	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
}
