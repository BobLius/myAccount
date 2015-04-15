package com.miteno.common.sequence.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="seq")
public class SimpleSequence {
	@Id
	@Column(name="prefix")
	private String id;
	private String currval;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCurrval() {
		return currval;
	}
	public void setCurrval(String currval) {
		this.currval = currval;
	}
}
