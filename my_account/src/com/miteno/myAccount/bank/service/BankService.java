package com.miteno.myAccount.bank.service;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.bank.entity.Bank;
import com.miteno.myAccount.bank.form.BankForm;

@Service("bankService")
public class BankService {

	@Resource
	private HibernateDao<Bank,String> bankDao;
	
	public BankForm search(BankForm bankForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Bank.class);
		String bankId = bankForm.getBank_id();
		String bankName = bankForm.getBank_name();
		
		detachedCriteria.addOrder(Order.asc("bank_id"));
		
		if(!StringUtils.isEmpty(bankId)){
			detachedCriteria.add(Restrictions.eq("bank_id",bankId));
		}
		if(!StringUtils.isEmpty(bankName)){
			detachedCriteria.add(Restrictions.like("bank_name",bankName,MatchMode.ANYWHERE));
		}
		bankDao.findPageByDetachedCriteria(detachedCriteria,bankForm);
		return bankForm;
	}
	public void save(Bank bank){
		bankDao.save(bank);
	}
	public void update(Bank bank){
		bankDao.merge(bank);
	}
	public Bank queryById(String id){
		return bankDao.get(Bank.class, id);
	}
	public boolean existsId(String id){
		if(bankDao.findAllByCriteria(Bank.class, Restrictions.eq("bank_id", id)).size()>0){
			return true;
		}
		return false;
	}
	public boolean existsName(String name){
		if(bankDao.findAllByCriteria(Bank.class, Restrictions.eq("bank_name", name)).size()>0){
			return true;
		}
		return false;
	}
}
