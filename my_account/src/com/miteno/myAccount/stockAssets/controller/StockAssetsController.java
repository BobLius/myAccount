package com.miteno.myAccount.stockAssets.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.miteno.myAccount.stockAssets.entity.StockAssets;
import com.miteno.myAccount.stockAssets.service.StockAssetsService;

@Controller
@RequestMapping("/stockAssets")
public class StockAssetsController {

	@Resource
	private StockAssetsService stockAssetsService;
	
	@RequestMapping(value = "list")
	public String view(Model model){
		StockAssets stockAssets = stockAssetsService.getStockAssets();
		model.addAttribute("stockAssets", stockAssets);
		return "stockAssets/list";
	}
	
	@RequestMapping(value = "editPrincipal", method = GET)
	public String editPrincipal(String principal,Model model, HttpServletRequest req){
		StockAssets stockAssets = stockAssetsService.getStockAssets();
		stockAssets.setPrincipal(Double.valueOf(principal));
		model.addAttribute("stockAssets", stockAssets);
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "stockAssets/principal";
	}
	
	@RequestMapping(value = "editPrincipal", method = POST)
	public String editPrincipal(StockAssets stockAssets,String principal,String referer, Model model) {
		String principalSpile = principal.split(",")[1];
		stockAssets.setPrincipal(Double.valueOf(principalSpile));
		stockAssetsService.savePrincipal(stockAssets);
		return "redirect:" + referer;
	}
}
