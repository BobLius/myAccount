package com.miteno.common.webui.jqgrid.impl;

import java.security.Timestamp;
import java.text.SimpleDateFormat;

import com.miteno.common.webui.jqgrid.Formatter;

public class TimestampFormater implements Formatter{

	@Override
	public String format(Object o) {
		return new SimpleDateFormat("yyyy/MM/dd").format(o);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Class getSupportClass() {
		return Timestamp.class;
	}

}
