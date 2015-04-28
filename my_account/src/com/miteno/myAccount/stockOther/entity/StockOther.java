package com.miteno.myAccount.stockOther.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity(name = "stock_other")
public class StockOther implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5362246485673994788L;

	@Id
	@GeneratedValue(generator = "hibernate-uuid")
	@GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	private String id;
	private String name;//名称
	private double money;//发生金额
	private String date;//发生时间
	private String record_flag;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getRecord_flag() {
		return record_flag;
	}
	public void setRecord_flag(String record_flag) {
		this.record_flag = record_flag;
	}

}
