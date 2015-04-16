package com.miteno.myAccount.brokerage.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;

@Entity(name="brokerage")
public class Brokerage implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7438206710750163042L;
	
	@Id
	@GeneratedValue(generator="hibernate-uuid")
    @GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	private String id;//
	private String create_date;//创建时间
	private String flag;//有效标识
	private double brokerage;//佣金率
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public double getBrokerage() {
		return brokerage;
	}
	public void setBrokerage(double brokerage) {
		this.brokerage = brokerage;
	}

}
