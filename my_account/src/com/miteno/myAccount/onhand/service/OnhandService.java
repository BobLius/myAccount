package com.miteno.myAccount.onhand.service;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.brokerage.service.BrokerageService;
import com.miteno.myAccount.buy.entity.Buy;
import com.miteno.myAccount.onhand.entity.Onhand;
import com.miteno.myAccount.onhand.form.OnhandForm;

@Service("onhandService")
public class OnhandService {
	@Resource
	private HibernateDao<Onhand,String> onhandDao;
	@Resource
	private BrokerageService brokerageService;
	private Onhand onhand = new Onhand();
	
	public OnhandForm search(OnhandForm onhandForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Onhand.class);
		String stockId = onhandForm.getStock_id();
		String stockName = onhandForm.getStock_name();
		detachedCriteria.addOrder(Order.asc("stock_id"));
		
		if(!StringUtils.isEmpty(stockId)){
			detachedCriteria.add(Restrictions.eq("stock_id",stockId));
		}
		if (StringUtils.isNotEmpty(stockName)) {
			detachedCriteria.createAlias("stock", "stock");
			detachedCriteria.add(Restrictions.like("stock.stock_name", stockName,MatchMode.ANYWHERE));
		}
		try {
			onhandDao.findPageByDetachedCriteria(detachedCriteria,onhandForm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return onhandForm;
	}
	
	
	/**
	 * @param买入时存储我的股票
	 */
	public void save(Buy buy){
		String stockId = buy.getStock_id();
		double buyMount = buy.getBuy_mount();
		double costs = buy.getCosts();
		double theEnd = buy.getThe_end();
		
		onhand = onhandDao.get(Onhand.class, stockId);
		if(onhand==null){
			//新建存储
			onhand = new Onhand();
			onhand.setStock_id(stockId);
			onhand.setBuy_mount(buyMount);
			onhand.setCosts(costs);
			onhand.setThe_end(theEnd);
			onhand.setSell_lowest(0);
			
			getSellLowest(onhand);
			
			onhandDao.save(onhand);
		}else{
			//更新合并
			buyMount = buyMount+onhand.getBuy_mount();
			onhand.setBuy_mount(buyMount);
			theEnd = theEnd+onhand.getThe_end();
			onhand.setThe_end(theEnd);
			costs = theEnd/buyMount;
			onhand.setCosts(costs);
			onhand.setSell_lowest(0);
			
			getSellLowest(onhand);
			
			onhandDao.merge(onhand);
		}
	}
	
	public void getSellLowest(Onhand onhand){
		String stockId = onhand.getStock_id();
		double buyMount = onhand.getBuy_mount();
		double costs = onhand.getCosts();
		double sell_lowest = 0;
		//过户费
		double transfer_fee = getTransferFee(stockId,buyMount);
		//最新佣金率
		double brokerageRate = brokerageService.getBrokerageRate();
		
		sell_lowest = (costs*buyMount+transfer_fee)/(buyMount-buyMount*brokerageRate/1000-buyMount/1000);
		onhand.setSell_lowest(sell_lowest);
		
		if(sell_lowest*buyMount*brokerageRate/1000<5.0){
			sell_lowest = (costs*buyMount+transfer_fee+5)/(buyMount-buyMount/1000);
			onhand.setSell_lowest(sell_lowest);
		}
	}
	
	/**
	 * @param 计算过户费
	 */
	public double getTransferFee(String stockId,double buyMount){
		if(Integer.valueOf(stockId)>=600000){
			double transfer_fee = buyMount/1000*0.6;
			return transfer_fee;
		}else{
			return 0;
		}
	}
}
