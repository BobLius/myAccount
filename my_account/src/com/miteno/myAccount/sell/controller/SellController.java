package com.miteno.myAccount.sell.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.miteno.myAccount.sell.form.SellForm;
import com.miteno.myAccount.sell.service.SellService;

@Controller
@RequestMapping("/sell")
public class SellController {

	@Resource
	private SellService sellService;
	
	@RequestMapping(value = "list")
	public String list(SellForm sellForm, Model model){
		model.addAttribute("form", sellService.search(sellForm));
		return "sell/list";
	}
}
