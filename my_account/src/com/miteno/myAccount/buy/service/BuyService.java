package com.miteno.myAccount.buy.service;

import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.miteno.myAccount.buy.form.BuyForm;
import com.miteno.myAccount.onhand.service.OnhandService;

@Service("buyService")
public class BuyService {
	@Resource
	private HibernateDao<Buy,String> buyDao;
	@Resource
	private BrokerageService brokerageService;
	@Resource
	private OnhandService onhandService;

	public BuyForm search(BuyForm buyForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Buy.class);
		String stockId = buyForm.getStock_id();
		String stockName = buyForm.getStock_name();
		detachedCriteria.addOrder(Order.desc("buy_date"));
		
		if(!StringUtils.isEmpty(stockId)){
			detachedCriteria.add(Restrictions.eq("stock_id",stockId));
		}
		if (StringUtils.isNotEmpty(stockName)) {
			detachedCriteria.createAlias("stock", "stock");
			detachedCriteria.add(Restrictions.like("stock.stock_name", stockName,MatchMode.ANYWHERE));
		}
		try {
			buyDao.findPageByDetachedCriteria(detachedCriteria,buyForm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return buyForm;
	}
	public void save(Buy buy){
		//设置总买入价格
		getBuyTolleMoney(buy);
		//设置佣金率和佣金
		brokerageService.getCurrentBrokerage(buy);
		//设置过户费
		getTransferFee(buy);
		//计算成本、成交额
		getcosts(buy);
		//设置买入时间
		buy.setBuy_date(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		//存储买入
		buyDao.save(buy);
		//存储到我的股票
		onhandService.save(buy);
	}
	public void update(Buy buy){
		buy.setBuy_date(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		buyDao.merge(buy);
	}
	public void delete(String buyId){
		buyDao.delete(Buy.class, buyId);
	}
	
	/**
	 * @return计算总买入价格
	 */
	public void getBuyTolleMoney(Buy buy){
		double mount = buy.getBuy_mount();
		double everymoney = buy.getBuy_every_money();
		double tolleMoney = mount*everymoney;
		buy.setBuy_tolle_money(tolleMoney);
	}
	
	/**
	 * @param 计算过户费
	 */
	public void getTransferFee(Buy buy){
		String stockId = buy.getStock_id();
		if(Integer.valueOf(stockId)>=600000){
			double buyMountD = buy.getBuy_mount();
			double transfer_fee = buyMountD/1000*0.6;
			buy.setTransfer_fee(transfer_fee);
		}else{
			buy.setTransfer_fee(0);
		}
	}
	
	/**
	 * @param 计算成本、成交额
	 */
	public void getcosts(Buy buy){
		double buy_tolle_money = buy.getBuy_tolle_money();// 总买入价格
		double transfer_fee = buy.getTransfer_fee();// 过户费
		double brokerage = buy.getBrokerage();// 佣金
		double buy_mount = buy.getBuy_mount();// 买入股数
		double the_end = 0;
		double costs = 0;
		the_end = (buy_tolle_money+transfer_fee+brokerage);
		costs = the_end/buy_mount;
		
		buy.setThe_end(the_end);
		buy.setCosts(costs);
	}

}
