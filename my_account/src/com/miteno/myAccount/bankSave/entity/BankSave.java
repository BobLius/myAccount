package com.miteno.myAccount.bankSave.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.hibernate.annotations.GenericGenerator;

import com.miteno.myAccount.bank.entity.Bank;

@Entity(name = "bank_save")
public class BankSave implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5544793926212300920L;
	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	private String id;//
	private String bank_id;//银行名称
	private String card_no;//卡号
	private double money;//余额
	private String record_date;//记录时间
	
	@OneToOne
	@JoinColumn(name = "bank_id", referencedColumnName = "bank_id", insertable = false, updatable = false)
	private Bank bank;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBank_id() {
		return bank_id;
	}
	public void setBank_id(String bank_id) {
		this.bank_id = bank_id;
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
	public Bank getBank() {
		return bank;
	}
	public void setBank(Bank bank) {
		this.bank = bank;
	}

}
