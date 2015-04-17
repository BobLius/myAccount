package com.miteno.myAccount.sell.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.miteno.myAccount.sell.entity.Sell;
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
	
	@RequestMapping(value = "add", method = GET)
	public String add(Model model, HttpServletRequest req){
		model.addAttribute("sell", new Sell());
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "sell/edit";
	}
	@RequestMapping(value = "add", method = POST)
	public String add(@Validated Sell sell,String referer, Model model) {
		sellService.save(sell);
		return "redirect:" + referer;
	}
	@RequestMapping(value = "edit", method = GET)
	public String edit(@RequestParam String id, HttpServletRequest req,Model model){
		String url = req.getHeader("referer");
		Sell sell = sellService.queryById(id);
		model.addAttribute("sell", sell);
		model.addAttribute("referer", url);
		return "sell/edit";
	}

	@RequestMapping(value = "edit", method = POST)
	public String edit(Sell sell,String referer,Model model){
		sellService.update(sell);
		return "redirect:" + referer;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam String id, HttpServletRequest req){
		sellService.delete(id);
		String url = req.getHeader("referer");
		return "redirect:" + url;
	}
	@RequestMapping(value = "record")
	public String record(String id, Model model,SellForm sellForm){
		String result = sellService.record(id);
		if(result.equals("1")){
			return "redirect:list";
		}else{
			model.addAttribute("sellResult","no");
			model.addAttribute("form", sellService.search(sellForm));
			return "sell/list";
		}
	}
}
