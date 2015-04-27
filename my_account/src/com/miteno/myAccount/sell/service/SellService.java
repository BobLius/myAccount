package com.miteno.myAccount.sell.service;

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
import com.miteno.myAccount.onhand.entity.Onhand;
import com.miteno.myAccount.onhand.service.OnhandService;
import com.miteno.myAccount.sell.entity.Sell;
import com.miteno.myAccount.sell.form.SellForm;

@Service("sellService")
public class SellService {

	@Resource
	private HibernateDao<Sell,String> sellDao;
	@Resource
	private HibernateDao<Onhand,String> onhandDao;
	@Resource
	private BrokerageService brokerageService;
	@Resource
	private OnhandService onhandService;
	
	public SellForm search(SellForm sellForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Sell.class);
		String stockId = sellForm.getStock_id();
		String stockName = sellForm.getStock_name();
		String createStartDate = sellForm.getCreate_start_date();
		String creatEndDate = sellForm.getCreate_end_date();
		String recordFlag = sellForm.getRecord_flag();
		
		detachedCriteria.addOrder(Order.desc("sell_date"));
		
		if (StringUtils.isNotEmpty(createStartDate)) {
			detachedCriteria.add(Restrictions.ge("sell_date", createStartDate));
		}
		if (StringUtils.isNotEmpty(creatEndDate)) {
			detachedCriteria.add(Restrictions.le("sell_date", creatEndDate));
		}
		if(!StringUtils.isEmpty(stockId)){
			detachedCriteria.add(Restrictions.eq("stock_id",stockId));
		}
		if(!StringUtils.isEmpty(recordFlag)){
			detachedCriteria.add(Restrictions.eq("record_flag",recordFlag));
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
	
	public void save(Sell sell){
		//设置总买入价格
		getSellTolleMoney(sell);
		//设置佣金率和佣金
		brokerageService.getCurrentBrokerage(sell);
		//设置过户费
		getTransferFee(sell);
		//计算成本、成交额
		getcosts(sell);
		//计算印花税
		getstamp(sell);
		//设置卖出时间
		sell.setSell_date(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		//存储卖出
		sellDao.save(sell);
	}
	public void update(Sell sell){
		// 设置总买入价格
		getSellTolleMoney(sell);
		// 设置佣金率和佣金
		brokerageService.getCurrentBrokerage(sell);
		// 设置过户费
		getTransferFee(sell);
		// 计算印花税
		getstamp(sell);
		// 计算成本、成交额
		getcosts(sell);
		// 设置卖出时间
		sell.setSell_date(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		sellDao.merge(sell);
	}
	public void delete(String sellId){
		sellDao.delete(Sell.class, sellId);
	}
	public Sell queryById(String id){
		Sell sell = sellDao.get(Sell.class, id);
		return sell;
	}
	public String record(String id){
		Sell sell = sellDao.get(Sell.class, id);
		String stockId = sell.getStock_id();
		Onhand onhand = onhandDao.get(Onhand.class, stockId);
		if(onhand!=null&&onhand.getBuy_mount()<sell.getSell_mount()){
			return "0";
		}else{
			sell.setRecord_flag("1");
			sellDao.merge(sell);
			//存储到我的股票
			onhandService.save(sell);
			return "1";
		}
	}
	
	/**
	 * @return计算总买入价格
	 */
	public void getSellTolleMoney(Sell sell){
		double mount = sell.getSell_mount();
		double everymoney = sell.getSell_every_money();
		double tolleMoney = mount*everymoney;
		sell.setSell_tolle_money(tolleMoney);
	}
	
	/**
	 * @param 计算过户费
	 */
	public void getTransferFee(Sell sell){
		String stockId = sell.getStock_id();
		if(Integer.valueOf(stockId)>=600000){
			double sellMountD = sell.getSell_mount();
			double transfer_fee = sellMountD/1000*0.6;
			sell.setTransfer_fee(transfer_fee);
		}else{
			sell.setTransfer_fee(0);
		}
	}
	
	/**
	 * @param 计算成本、成交额
	 */
	public void getcosts(Sell sell){
		double buy_tolle_money = sell.getSell_tolle_money();// 总买入价格
		double transfer_fee = sell.getTransfer_fee();// 过户费
		double brokerage = sell.getBrokerage();// 佣金
		double stamp = sell.getStamp();//印花税
		double the_end = 0;
		the_end = (buy_tolle_money-transfer_fee-brokerage-stamp);
		
		sell.setThe_end(the_end);
	}
	
	/**
	 * @param 计算印花税
	 */
	public void getstamp(Sell sell){
		double sellTolleMoney = sell.getSell_tolle_money();
		sell.setStamp(sellTolleMoney/1000.0);
	}
}
