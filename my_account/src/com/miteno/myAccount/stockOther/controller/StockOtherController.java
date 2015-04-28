package com.miteno.myAccount.stockOther.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.miteno.myAccount.stockOther.entity.StockOther;
import com.miteno.myAccount.stockOther.form.StockOtherForm;
import com.miteno.myAccount.stockOther.service.StockOtherService;

@Controller
@RequestMapping("/stockOther")
public class StockOtherController {

	@Resource
	private StockOtherService stockOtherService;
	
	@RequestMapping(value = "list")
	public String list(StockOtherForm stockOtherForm, Model model){
		model.addAttribute("form", stockOtherService.search(stockOtherForm));
		return "stockOther/list";
	}
	
	@RequestMapping(value = "add", method = GET)
	public String add(Model model, HttpServletRequest req){
		model.addAttribute("stockOther", new StockOther());
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "stockOther/edit";
	}
	
	@RequestMapping(value = "add", method = POST)
	public String add(@Validated StockOther stockOther,String referer, Model model) {
		stockOtherService.save(stockOther);
		return "redirect:" + referer;
	}
	
	@RequestMapping(value = "edit", method = GET)
	public String edit(@RequestParam String id, HttpServletRequest req,	Model model){
		StockOther stockOther = stockOtherService.queryById(id);
		model.addAttribute("stockOther", stockOther);
		
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "stockOther/edit";
	}

	@RequestMapping(value = "edit", method = POST)
	public String edit(StockOther stockOther,String referer,Model model){
		stockOtherService.update(stockOther);
		return "redirect:" + referer;
	}
	
	@RequestMapping(value = "delete")
	public String delete(@RequestParam String id, HttpServletRequest req){
		stockOtherService.delete(id);
		String url = req.getHeader("referer");
		return "redirect:" + url;
	}
	
	@RequestMapping(value = "record")
	public String record(String id, Model model){
		stockOtherService.record(id);
		return "redirect:list";
	}
}
