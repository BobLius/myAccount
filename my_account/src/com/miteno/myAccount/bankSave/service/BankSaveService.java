package com.miteno.myAccount.bankSave.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.bankSave.entity.BankSave;
import com.miteno.myAccount.bankSave.form.BankSaveForm;

@Service("bankSaveService")
public class BankSaveService {

	@Resource
	private HibernateDao<BankSave,String> bankSaveDao;
	
	public BankSaveForm search(BankSaveForm bankSaveForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(BankSave.class);
		String bankName= bankSaveForm.getBank_name();
		String cardNo = bankSaveForm.getCard_no();
		String startDate = bankSaveForm.getStart_date();
		String endDate = bankSaveForm.getEnd_date();
		
		detachedCriteria.addOrder(Order.asc("bank_id"));
		
		if(!StringUtils.isEmpty(cardNo)){
			detachedCriteria.add(Restrictions.eq("card_no",cardNo));
		}
		if (StringUtils.isNotEmpty(bankName)) {
			detachedCriteria.createAlias("bank", "bank");
			detachedCriteria.add(Restrictions.like("bank.bank_name", bankName,MatchMode.ANYWHERE));
		}
		if (StringUtils.isNotEmpty(startDate)) {
			detachedCriteria.add(Restrictions.ge("record_date", startDate));
		}
		if (StringUtils.isNotEmpty(endDate)) {
			detachedCriteria.add(Restrictions.le("record_date", endDate));
		}
		bankSaveDao.findPageByDetachedCriteria(detachedCriteria,bankSaveForm);
		return bankSaveForm;
	}
	
	public void save(BankSave bankSave){
		bankSave.setRecord_date(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		List<BankSave> bankSaveList = bankSaveDao.findAllByCriteria(BankSave.class, 
				Restrictions.eq("bank_id", bankSave.getBank_id()),
				Restrictions.eq("card_no", bankSave.getCard_no()));
		
		//如果新增的银行号和卡号相同，则合并；
		//否则新增
		if(bankSaveList!=null&&bankSaveList.size()>0){
			BankSave oldBankSave = bankSaveList.get(0);
			oldBankSave.setRecord_date(new SimpleDateFormat("yyyyMMdd").format(new Date()));
			oldBankSave.setMoney(bankSaveList.get(0).getMoney()+bankSave.getMoney());
			bankSaveDao.merge(oldBankSave);
		}else{
			bankSaveDao.save(bankSave);
		}
	}
	public void update(BankSave bankSave){
		bankSave.setRecord_date(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		bankSaveDao.merge(bankSave);
		checkUpdate(bankSave.getBank_id(),bankSave.getCard_no());
	}
	public void delete(String id){
		bankSaveDao.delete(BankSave.class, id);
	}
	public BankSave queryById(String id){
		return bankSaveDao.get(BankSave.class, id);
	}
	/**
	 * 计算所有银行账户的总额
	 */
	public double record(){
		List <BankSave> bankSaveList = bankSaveDao.findAllByCriteria(BankSave.class);
		double total = 0;
		//所有银行账户的总额
		for(int i=0;i<bankSaveList.size();i++){
			total = total + bankSaveList.get(i).getMoney();
		}
		return total;
	}
	
	
	/**
	 * @param 更新时，检查是否有重复记录存在
	 * @param card_no
	 */
	public void checkUpdate(String bank_id,String card_no){
		List<BankSave> bankSaveList = bankSaveDao.findAllByCriteria(BankSave.class, 
				Restrictions.eq("bank_id", bank_id),
				Restrictions.eq("card_no", card_no));
		if(bankSaveList!=null&&bankSaveList.size()>1){
			BankSave zero = bankSaveList.get(0);
			BankSave one = bankSaveList.get(1);
			zero.setMoney(zero.getMoney()+one.getMoney());
			zero.setRecord_date(new SimpleDateFormat("yyyyMMdd").format(new Date()));
			bankSaveDao.merge(zero);
			bankSaveDao.delete(one);
		}
	}
}
