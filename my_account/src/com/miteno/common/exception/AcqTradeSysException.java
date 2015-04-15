package com.miteno.common.exception;

import java.net.ConnectException;


/**
 * 同收单交易系统通讯时产生的异常
 * @author lzh
 *
 */
public class AcqTradeSysException extends ConnectException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7741420564983227401L;
	public AcqTradeSysException(){
		
	}
	public AcqTradeSysException(String msg){
		super(msg);
	}
}
