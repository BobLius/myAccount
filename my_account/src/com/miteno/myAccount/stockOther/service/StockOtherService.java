package com.miteno.myAccount.stockOther.service;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.stockAssets.service.StockAssetsService;
import com.miteno.myAccount.stockOther.entity.StockOther;
import com.miteno.myAccount.stockOther.form.StockOtherForm;

@Service("stockOtherService")
public class StockOtherService {

	@Resource
	private HibernateDao<StockOther,String> stockOtherDao;
	@Resource
	private StockAssetsService stockAssetsService;
	
	public StockOtherForm search(StockOtherForm stockOtherForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(StockOther.class);
		String startDate = stockOtherForm.getStart_date();
		String endDate = stockOtherForm.getEnd_date();
		String stockOtherName = stockOtherForm.getName();
		String recordFlag = stockOtherForm.getRecord_flag();
		
		detachedCriteria.addOrder(Order.desc("date"));
		
		if (StringUtils.isNotEmpty(startDate)) {
			detachedCriteria.add(Restrictions.ge("date", startDate));
		}
		if (StringUtils.isNotEmpty(endDate)) {
			detachedCriteria.add(Restrictions.le("date", endDate));
		}
		if(!StringUtils.isEmpty(stockOtherName)){
			detachedCriteria.add(Restrictions.like("name",stockOtherName,MatchMode.ANYWHERE));
		}
		if(!StringUtils.isEmpty(recordFlag)){
			detachedCriteria.add(Restrictions.eq("record_flag",recordFlag));
		}
		stockOtherDao.findPageByDetachedCriteria(detachedCriteria,stockOtherForm);
		return stockOtherForm;
	}
	public void save(StockOther stockOther){
		stockOtherDao.save(stockOther);
	}
	public void update(StockOther stockOther){
		stockOtherDao.merge(stockOther);
	}
	public StockOther queryById(String id){
		return stockOtherDao.get(StockOther.class, id);
	}
	public void delete(String id){
		stockOtherDao.delete(StockOther.class, id);
	}
	public void record(String id){
		StockOther stockOther = stockOtherDao.get(StockOther.class, id);
		stockOther.setRecord_flag("1");
		stockOtherDao.merge(stockOther);
		//记录到资产
		stockAssetsService.otherToAsset(stockOther.getMoney());
	}
}
