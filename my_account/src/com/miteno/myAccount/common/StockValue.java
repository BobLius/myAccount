package com.miteno.myAccount.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

public class StockValue {
	
	URL url = null;

	public String getStockValue(String stock_id){
		String root = "http://hq.sinajs.cn/list=";
		try {
			if (Integer.valueOf(stock_id) >= 600000) {
				root = root + "sh" + stock_id;
			} else {
				root = root + "sz" + stock_id;
			}
			url = new URL(root);
			InputStreamReader isr = new InputStreamReader(url.openStream());
			BufferedReader br = new BufferedReader(isr);
			String str;
			str = br.readLine();
			String dest[] = str.split(",");
			stock_id = dest[3];
			br.close();
			isr.close();
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stock_id;
	}
	
	public static void main(String arg[]) throws IOException{
		StockValue a  = new StockValue();
		a.getStockValue("000829");
	}
}
