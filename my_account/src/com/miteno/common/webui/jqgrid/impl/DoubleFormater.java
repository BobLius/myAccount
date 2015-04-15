package com.miteno.common.webui.jqgrid.impl;

import java.text.DecimalFormat;

import com.miteno.common.webui.jqgrid.Formatter;

public class DoubleFormater implements Formatter{

	@Override
	public String format(Object o) {
		DecimalFormat df = new DecimalFormat("0.00");
		return df.format(o);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Class getSupportClass() {
		return Double.class;
	}

}
