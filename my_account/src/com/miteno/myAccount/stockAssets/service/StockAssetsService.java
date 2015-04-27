package com.miteno.myAccount.stockAssets.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.common.StockValue;
import com.miteno.myAccount.onhand.entity.Onhand;
import com.miteno.myAccount.stockAssets.entity.StockAssets;

@Service("stockAssetsService")
public class StockAssetsService {
	@Resource
	private HibernateDao<StockAssets,String> stockAssetsDao;
	@Resource
	private HibernateDao<Onhand,String> onhandDao;
	
	/**
	 * 获取证券资产
	 */
	public StockAssets getStockAssets(){
		StockAssets stockAssets = new StockAssets();
		List<StockAssets> stockAssetsList = stockAssetsDao.findAllByCriteria(StockAssets.class);
		if(stockAssetsList!=null&&stockAssetsList.size()>0){
			stockAssets = stockAssetsList.get(0);
		}
		stockAssets.setCurrent_dates(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));
		double calculateAllStockCurrentValue = calculateAllStockCurrentValue();
		stockAssets.setStock_assets(calculateAllStockCurrentValue);
		stockAssets.setTotal_assets(calculateAllStockCurrentValue+stockAssets.getUse_assets());
		stockAssets.setProfit_loss(stockAssets.getTotal_assets()-stockAssets.getPrincipal());
		return stockAssets;
	}
	
	/**
	 * 存储本金
	 */
	public void savePrincipal(StockAssets stockAssets){
		double oldPrincipal = 0;
		double principal = stockAssets.getPrincipal();
		double total = stockAssets.getTotal_assets() + principal;
		double use = stockAssets.getUse_assets() + principal;
		if(stockAssets.getId()!=null&&!"".equals(stockAssets.getId())){
			StockAssets oldStockAssets = stockAssetsDao.get(StockAssets.class, stockAssets.getId());
			oldPrincipal = oldStockAssets.getPrincipal();
			
			total = total-oldPrincipal;
			use = use-oldPrincipal;
			
			if(total<0||use<0){
				System.out.println("套现金额不足");
			}else{
				stockAssetsDao.delete(StockAssets.class,stockAssets.getId());
			}
		}else{
			total = total-oldPrincipal;
			use = use-oldPrincipal;
		}
		stockAssets.setPrincipal(principal);
		stockAssets.setTotal_assets(total);
		stockAssets.setUse_assets(use);
		stockAssets.setProfit_loss(0);
		String currentDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		stockAssets.setCurrent_dates(currentDate);
		if(total<0||use<0){
			System.out.println("套现金额不足");
		}else{
			stockAssetsDao.save(stockAssets);
		}
	}
	
	/**
	 * 计算可用资产
	 */
	public void calculateUseAssets(String type,double theEnd){
		StockAssets stockAssets= getStockAssets();
		if("buy".equals(type)){
			double useAssets = stockAssets.getUse_assets()-theEnd;
			stockAssets.setUse_assets(useAssets);
			stockAssetsDao.merge(stockAssets);
		}else{
			double useAssets = stockAssets.getUse_assets()+theEnd;
			stockAssets.setUse_assets(useAssets);
			stockAssetsDao.merge(stockAssets);
		}
	}
	
	/**
	 * 计算所有股票当前市值
	 */
	public double calculateAllStockCurrentValue(){
		StockValue stockValue = new StockValue();
		List<Onhand> onhandList = onhandDao.findAllByCriteria(Onhand.class);
		double result = 0;
		for(int i=0;i<onhandList.size();i++){
			String current = stockValue.getStockValue(onhandList.get(i).getStock_id());
			result = result + Double.valueOf(current)*onhandList.get(i).getBuy_mount();
		}
		return result;
	}
}
