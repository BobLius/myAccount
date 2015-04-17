package com.miteno.myAccount.stock.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.stock.entity.Stock;
import com.miteno.myAccount.stock.form.StockForm;

@Controller
@RequestMapping("/stock")
public class StockController {

	@Resource
	private HibernateDao<Stock,String> stockDao;
	
	@RequestMapping(value="autoCompleteStock",method=RequestMethod.GET)
	@ResponseBody
	public StringBuffer actComplete2(String q,String limit,String timestamp) throws UnsupportedEncodingException {
		StockForm stockForm = new StockForm();
		q=new String(q.getBytes("iso8859-1"),"UTF-8");
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Stock.class);
		detachedCriteria.add(Restrictions.like("stock_id",q,MatchMode.START));
		try {
			stockDao.findPageByDetachedCriteria(detachedCriteria,stockForm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Stock> stockList = stockForm.getData();

		StringBuffer str = new StringBuffer();
		str.append("[");
		for(int i=0;i<stockList.size();i++){
			String Cname = new String(stockList.get(i).getStock_name().getBytes("GBK"));
			if(i==0){
				str.append("{ name: \""+ Cname+"\", to:\""+stockList.get(i).getStock_id()+"\"}");
			}else if(i==stockList.size()-1){
				str.append(",{ name: \""+ Cname+"\", to:\""+stockList.get(i).getStock_id()+"\"}");
			}else{
				str.append(",{ name: \""+ Cname+"\", to:\""+stockList.get(i).getStock_id()+"\"}");
			}
		}
		str.append("]");
		return str;
	}
}
