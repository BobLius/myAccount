package com.miteno.myAccount.bankSave.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.miteno.myAccount.bankSave.entity.BankSave;
import com.miteno.myAccount.bankSave.form.BankSaveForm;
import com.miteno.myAccount.bankSave.service.BankSaveService;


@Controller
@RequestMapping("/bankSave")
public class BankSaveController {
	@Resource
	private BankSaveService bankSaveService;
	
	@RequestMapping(value = "list")
	public String list(BankSaveForm bankSaveForm, Model model){
		model.addAttribute("form", bankSaveService.search(bankSaveForm));
		model.addAttribute("total",bankSaveService.record());
		return "bankSave/list";
	}
	
	@RequestMapping(value = "add", method = GET)
	public String add(Model model, HttpServletRequest req){
		model.addAttribute("bankSave", new BankSave());
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "bankSave/edit";
	}
	@RequestMapping(value = "add", method = POST)
	public String add(@Validated BankSave bankSave,String referer, Model model) {
		bankSaveService.save(bankSave);
		return "redirect:" + referer;
	}
	@RequestMapping(value = "edit", method = GET)
	public String edit(@RequestParam String id, HttpServletRequest req,Model model){
		String url = req.getHeader("referer");
		BankSave bankSave = bankSaveService.queryById(id);
		model.addAttribute("bankSave", bankSave);
		model.addAttribute("referer", url);
		return "bankSave/edit";
	}

	@RequestMapping(value = "edit", method = POST)
	public String edit(BankSave bankSave,String referer,	Model model){
		bankSaveService.update(bankSave);
		return "redirect:" + referer;
	}
	@RequestMapping(value = "delete")
	public String delete(@RequestParam String id, HttpServletRequest req){
		bankSaveService.delete(id);
		String url = req.getHeader("referer");
		return "redirect:" + url;
	}
	
}
