package com.miteno.common.sequence.entity;

import java.io.Serializable;

public class RecycledSequencePk implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -304937157350511083L;
	private String prefix;
	private String recycleVal;
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getRecycleVal() {
		return recycleVal;
	}
	public void setRecycleVal(String recycleVal) {
		this.recycleVal = recycleVal;
	}
	@Override
	public int hashCode() {
		return recycleVal.hashCode() + prefix.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if(!(obj instanceof RecycledSequencePk))
			return false;
		RecycledSequencePk pk = (RecycledSequencePk) obj;
		if(recycleVal.equals(pk.recycleVal))
			return prefix.equals(pk.prefix);
		return false;
	}
	
	
	
	
}
