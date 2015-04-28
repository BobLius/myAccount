package com.miteno.myAccount.myAssets.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.miteno.myAccount.myAssets.form.MyAssetsForm;
import com.miteno.myAccount.myAssets.service.MyAssetsService;

@Controller
@RequestMapping("/myAssets")
public class MyAssetsController {

	@Resource
	private MyAssetsService myAssetsService;
	
	@RequestMapping(value = "list")
	public String list(MyAssetsForm myAssetsForm, Model model){
		model.addAttribute("form", myAssetsService.search(myAssetsForm));
		return "myAssets/list";
	}
	@RequestMapping(value = "add", method = GET)
	public String add(Model model, HttpServletRequest req){
		myAssetsService.save();
		String url = req.getHeader("referer");
		return "redirect:" + url;
	}
	@RequestMapping(value = "delete")
	public String delete(@RequestParam String id, HttpServletRequest req){
		myAssetsService.delete(id);
		String url = req.getHeader("referer");
		return "redirect:" + url;
	}
}
