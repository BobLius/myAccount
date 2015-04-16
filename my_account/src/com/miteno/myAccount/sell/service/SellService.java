package com.miteno.myAccount.sell.service;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.sell.entity.Sell;
import com.miteno.myAccount.sell.form.SellForm;

@Service("sellService")
public class SellService {

	@Resource
	private HibernateDao<Sell,String> sellDao;
	
	public SellForm search(SellForm sellForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Sell.class);
		String stockId = sellForm.getStock_id();
		String stockName = sellForm.getStock_name();
		detachedCriteria.addOrder(Order.desc("sell_date"));
		
		if(!StringUtils.isEmpty(stockId)){
			detachedCriteria.add(Restrictions.eq("stock_id",stockId));
		}
		if (StringUtils.isNotEmpty(stockName)) {
			detachedCriteria.createAlias("stock", "stock");
			detachedCriteria.add(Restrictions.like("stock.stock_name", stockName,MatchMode.ANYWHERE));
		}
		try {
			sellDao.findPageByDetachedCriteria(detachedCriteria,sellForm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sellForm;
	}
}
