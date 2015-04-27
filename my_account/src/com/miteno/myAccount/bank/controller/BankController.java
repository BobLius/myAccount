package com.miteno.myAccount.bank.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.bank.entity.Bank;
import com.miteno.myAccount.bank.form.BankForm;
import com.miteno.myAccount.bank.service.BankService;


@Controller
@RequestMapping("/bank")
public class BankController {

	@Resource
	private BankService bankService;
	@Resource
	private HibernateDao<Bank,String> bankDao;
	
	@RequestMapping(value = "list")
	public String list(BankForm bankForm, Model model){
		model.addAttribute("form", bankService.search(bankForm));
		return "bank/list";
	}
	
	@RequestMapping(value = "add", method = GET)
	public String add(Model model, HttpServletRequest req){
		model.addAttribute("bank", new Bank());
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "bank/edit";
	}
	
	@RequestMapping(value = "add", method = POST)
	public String add(@Validated Bank bank,String referer, Model model) {
		bankService.save(bank);
		return "redirect:" + referer;
	}
	
	@RequestMapping(value = "edit", method = GET)
	public String edit(@RequestParam String id, HttpServletRequest req,	Model model){
		Bank bank = bankService.queryById(id);
		model.addAttribute("bank", bank);
		
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "bank/edit";
	}

	@RequestMapping(value = "edit", method = POST)
	public String edit(Bank bank,String referer,Model model){
		bankService.update(bank);
		return "redirect:" + referer;
	}
	
	@RequestMapping(value="autoCompleteBank",method=RequestMethod.GET)
	@ResponseBody
	public StringBuffer actComplete2(String q,String limit,String timestamp) throws UnsupportedEncodingException {
		BankForm bankForm = new BankForm();
		q=new String(q.getBytes("iso8859-1"),"UTF-8");
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Bank.class);
		detachedCriteria.add(Restrictions.like("bank_id",q,MatchMode.START));
		try {
			bankDao.findPageByDetachedCriteria(detachedCriteria,bankForm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Bank> bankList = bankForm.getData();

		StringBuffer str = new StringBuffer();
		str.append("[");
		for(int i=0;i<bankList.size();i++){
			String Cname = new String(bankList.get(i).getBank_name().getBytes("GBK"));
			if(i==0){
				str.append("{ name: \""+ Cname+"\", to:\""+bankList.get(i).getBank_id()+"\"}");
			}else if(i==bankList.size()-1){
				str.append(",{ name: \""+ Cname+"\", to:\""+bankList.get(i).getBank_id()+"\"}");
			}else{
				str.append(",{ name: \""+ Cname+"\", to:\""+bankList.get(i).getBank_id()+"\"}");
			}
		}
		str.append("]");
		return str;
	}
	@RequestMapping(value = "existsId")
	@ResponseBody
	public boolean existsId(@RequestParam String bank_id, String id) throws UnsupportedEncodingException{
		return bankService.existsId(bank_id);
	}
	@RequestMapping(value = "existsName")
	@ResponseBody
	public boolean existsUsername(@RequestParam String bank_name, String id) throws UnsupportedEncodingException{
		String newName = URLDecoder.decode(bank_name, "UTF-8");
		if (StringUtils.isEmpty(id)) {
			return bankService.existsName(newName);
		} else {
			Bank dbUser = bankService.queryById(id);
			String dbname = dbUser.getBank_name();
			if (!dbname.equals(newName)) {
				// 进行新名字校验,防止有重名的角色
				return bankService.existsName(newName);
			} else {
				return false;
			}
		}
	}
}
