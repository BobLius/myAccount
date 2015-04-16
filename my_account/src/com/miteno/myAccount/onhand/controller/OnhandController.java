package com.miteno.myAccount.onhand.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.miteno.myAccount.onhand.form.OnhandForm;
import com.miteno.myAccount.onhand.service.OnhandService;

@Controller
@RequestMapping("/onhand")
public class OnhandController {

	@Resource
	private OnhandService onhandService;
	
	@RequestMapping(value = "list")
	public String list(OnhandForm onhandForm, Model model){
		model.addAttribute("form", onhandService.search(onhandForm));
		return "onhand/list";
	}
}
