package com.miteno.myAccount.brokerage.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.miteno.myAccount.brokerage.entity.Brokerage;
import com.miteno.myAccount.brokerage.form.BrokerageForm;
import com.miteno.myAccount.brokerage.service.BrokerageService;

@Controller
@RequestMapping("/brokerage")
public class BrokerageController {

	@Resource
	private BrokerageService brokerageService;
	
	@RequestMapping(value = "list")
	public String list(BrokerageForm brokerageForm, Model model){
		model.addAttribute("form", brokerageService.search(brokerageForm));
		return "brokerage/list";
	}
	
	@RequestMapping(value = "add", method = GET)
	public String add(Model model, HttpServletRequest req){
		model.addAttribute("brokerage", new Brokerage());
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "brokerage/edit";
	}
	
	@RequestMapping(value = "add", method = POST)
	public String add(@Validated Brokerage brokerage,String referer, Model model) {
		brokerageService.save(brokerage);
		return "redirect:" + referer;
	}
	
	@RequestMapping(value = "edit", method = GET)
	public String edit(@RequestParam String id, HttpServletRequest req,	Model model){
		Brokerage brokerage = brokerageService.queryById(id);
		model.addAttribute("brokerage", brokerage);
		
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "brokerage/edit";
	}

	@RequestMapping(value = "edit", method = POST)
	public String edit(Brokerage brokerage,String referer,Model model){
		brokerageService.update(brokerage);
		return "redirect:" + referer;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam String id, HttpServletRequest req){
		brokerageService.delete(id);
		String url = req.getHeader("referer");
		return "redirect:" + url;
	}
}
