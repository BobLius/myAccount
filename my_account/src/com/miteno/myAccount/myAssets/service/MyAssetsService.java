package com.miteno.myAccount.myAssets.service;

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
import com.miteno.myAccount.bankSave.service.BankSaveService;
import com.miteno.myAccount.manageFinances.service.ManageFinancesService;
import com.miteno.myAccount.myAssets.entity.MyAssets;
import com.miteno.myAccount.myAssets.form.MyAssetsForm;
import com.miteno.myAccount.stockAssets.entity.StockAssets;

@Service("myAssetsService")
public class MyAssetsService {

	@Resource
	private HibernateDao<MyAssets,String> myAssetsDao;
	@Resource
	private HibernateDao<StockAssets,String> stockAssetsDao;
	@Resource
	private BankSaveService bankSaveService;
	@Resource
	private ManageFinancesService manageFinancesService;
	
	public MyAssetsForm search(MyAssetsForm myAssetsForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(MyAssets.class);
		String startDate = myAssetsForm.getStart_date();
		String endDate = myAssetsForm.getEnd_date();
		
		detachedCriteria.addOrder(Order.desc("date"));
		
		if (StringUtils.isNotEmpty(startDate)) {
			detachedCriteria.add(Restrictions.ge("date", startDate));
		}
		if (StringUtils.isNotEmpty(endDate)) {
			detachedCriteria.add(Restrictions.le("date", endDate));
		}
		myAssetsDao.findPageByDetachedCriteria(detachedCriteria,myAssetsForm);
		return myAssetsForm;
	}
	/**
	 * 计算当前总资产（总银行储蓄+总理财+总股市）
	 */
	public void save(){
		double bankSave = bankSaveService.record();
		double manageFinances = manageFinancesService.record();
		double stockAssets = 0;
		List<StockAssets> stockAssetsList = stockAssetsDao.findAllByCriteria(StockAssets.class);
		if(stockAssetsList!=null&&stockAssetsList.size()>0){
			stockAssets = stockAssetsList.get(0).getTotal_assets();
		}
		MyAssets myAssets = new MyAssets();
		myAssets.setMoney(bankSave+manageFinances+stockAssets);
		myAssets.setDate(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		myAssetsDao.save(myAssets);
	}
	public void delete(String id){
		myAssetsDao.delete(MyAssets.class, id);
	}
}
