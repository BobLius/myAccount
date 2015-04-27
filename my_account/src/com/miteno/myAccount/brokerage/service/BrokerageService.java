package com.miteno.myAccount.brokerage.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.brokerage.entity.Brokerage;
import com.miteno.myAccount.brokerage.form.BrokerageForm;
import com.miteno.myAccount.buy.entity.Buy;
import com.miteno.myAccount.sell.entity.Sell;

@Service("brokerageService")
public class BrokerageService {

	@Resource
	private HibernateDao<Brokerage,String> brokerageDao;
	
	public BrokerageForm search(BrokerageForm brokerageForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Brokerage.class);
		String flag = brokerageForm.getFlag();
		String createStartDate = brokerageForm.getCreate_start_date();
		String creatEndDate = brokerageForm.getCreate_end_date();
		
		detachedCriteria.addOrder(Order.desc("create_date"));
		
		if (StringUtils.isNotEmpty(createStartDate)) {
			detachedCriteria.add(Restrictions.ge("create_date", createStartDate));
		}
		if (StringUtils.isNotEmpty(creatEndDate)) {
			detachedCriteria.add(Restrictions.le("create_date", creatEndDate));
		}
		if(!StringUtils.isEmpty(flag)){
			detachedCriteria.add(Restrictions.eq("flag",flag));
		}
		brokerageDao.findPageByDetachedCriteria(detachedCriteria,brokerageForm);
		return brokerageForm;
	}
	public void save(Brokerage brokerage){
		resetOldBrokerage();
		brokerage.setCreate_date(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		brokerage.setFlag("0");
		brokerageDao.save(brokerage);
	}
	public void update(Brokerage brokerage){
		resetOldBrokerage();
		brokerage.setFlag("0");
		brokerageDao.merge(brokerage);
	}
	public void delete(String brokerageId){
		brokerageDao.delete(Brokerage.class, brokerageId);
	}
	
	/**
	 * 重置旧佣金率
	 */
	public void resetOldBrokerage(){
		List<Brokerage> oldBrokerageList = brokerageDao.findAllByCriteria(Brokerage.class, Restrictions.eq("flag", "0"));
		if(oldBrokerageList!=null&&oldBrokerageList.size()>0){
			Brokerage oldBrokerage = oldBrokerageList.get(0);
			oldBrokerage.setFlag("1");
			brokerageDao.merge(oldBrokerage);
		}
	}
	
	public Brokerage queryById(String id){
		Brokerage brokerage = new Brokerage();
		brokerage = brokerageDao.get(Brokerage.class, id);
		return brokerage;
	}
	
	/**
	 * @param 
	 * 查询最新的佣金率
	 * 计算佣金，并判断是否大于5元（买入）
	 */
	public void getCurrentBrokerage(Buy buy){
		double currentBrokerageRate=getBrokerageRate();
		buy.setBrokerage_rate(currentBrokerageRate);
		double buyTolleMoney = buy.getBuy_tolle_money();
		double rate = currentBrokerageRate;
		double result = buyTolleMoney*rate/1000.0;
		if(result<5.0){
			buy.setBrokerage(5);
		}else{
			buy.setBrokerage(result);
		}
	}
	
	/**
	 * 查询最新的佣金率
	 * 计算佣金，并判断是否大于5元（卖出）
	 */
	public void getCurrentBrokerage(Sell sell){
		double currentBrokerageRate=getBrokerageRate();
		sell.setBrokerage_rate(currentBrokerageRate);
		double buyTolleMoney = sell.getSell_tolle_money();
		double rate = currentBrokerageRate;
		double result = buyTolleMoney*rate/1000.0;
		if(result<5.0){
			sell.setBrokerage(5);
		}else{
			sell.setBrokerage(result);
		}
	}
	
	/**
	 * 获取最新佣金率
	 */
	public double getBrokerageRate(){
		double currentBrokerageRate=0;
		List<Brokerage> oldBrokerageList = brokerageDao.findAllByCriteria(Brokerage.class, Restrictions.eq("flag", "0"));
		if(oldBrokerageList!=null&&oldBrokerageList.size()>0){
			currentBrokerageRate = oldBrokerageList.get(0).getBrokerage();
		}
		return currentBrokerageRate;
	}
}
