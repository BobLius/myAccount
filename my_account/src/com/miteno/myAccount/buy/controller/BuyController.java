package com.miteno.myAccount.buy.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.miteno.myAccount.buy.entity.Buy;
import com.miteno.myAccount.buy.form.BuyForm;
import com.miteno.myAccount.buy.service.BuyService;

@Controller
@RequestMapping("/buy")
public class BuyController {

	@Resource
	private BuyService buyService;
	
	@RequestMapping(value = "list")
	public String list(BuyForm buyForm, Model model){
		model.addAttribute("form", buyService.search(buyForm));
		return "buy/list";
	}
	
	@RequestMapping(value = "add", method = GET)
	public String add(Model model, HttpServletRequest req){
		model.addAttribute("buy", new Buy());
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "buy/edit";
	}
	@RequestMapping(value = "add", method = POST)
	public String add(@Validated Buy buy,String referer, Model model) {
		buyService.save(buy);
		return "redirect:" + referer;
	}
	@RequestMapping(value = "edit", method = GET)
	public String edit(@RequestParam String id, HttpServletRequest req,Model model){
		String url = req.getHeader("referer");
		Buy buy = buyService.queryById(id);
		model.addAttribute("buy", buy);
		model.addAttribute("referer", url);
		return "buy/edit";
	}

	@RequestMapping(value = "edit", method = POST)
	public String edit(Buy buy,String referer,	Model model){
		buyService.update(buy);
		return "redirect:" + referer;
	}
	@RequestMapping(value = "delete")
	public String delete(@RequestParam String id, HttpServletRequest req){
		buyService.delete(id);
		String url = req.getHeader("referer");
		return "redirect:" + url;
	}
	
	@RequestMapping(value = "record")
	public String record(String id, Model model){
		buyService.record(id);
		return "redirect:list";
	}
	
}
