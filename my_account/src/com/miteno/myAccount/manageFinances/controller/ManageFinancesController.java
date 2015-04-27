package com.miteno.myAccount.manageFinances.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miteno.myAccount.manageFinances.entity.ManageFinances;
import com.miteno.myAccount.manageFinances.form.ManageFinancesForm;
import com.miteno.myAccount.manageFinances.service.ManageFinancesService;

@Controller
@RequestMapping("/manageFinances")
public class ManageFinancesController {

	@Resource
	private ManageFinancesService manageFinancesService;
	
	@RequestMapping(value = "list")
	public String list(ManageFinancesForm manageFinancesForm, Model model){
		model.addAttribute("form", manageFinancesService.search(manageFinancesForm));
		model.addAttribute("total",manageFinancesService.record());
		return "manageFinances/list";
	}
	
	@RequestMapping(value = "add", method = GET)
	public String add(Model model, HttpServletRequest req){
		model.addAttribute("manageFinances", new ManageFinances());
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "manageFinances/edit";
	}
	@RequestMapping(value = "add", method = POST)
	public String add(@Validated ManageFinances manageFinances,String referer, Model model) {
		manageFinancesService.save(manageFinances);
		return "redirect:" + referer;
	}
	@RequestMapping(value = "edit", method = GET)
	public String edit(@RequestParam String id, HttpServletRequest req,Model model){
		String url = req.getHeader("referer");
		ManageFinances manageFinances = manageFinancesService.queryById(id);
		model.addAttribute("manageFinances", manageFinances);
		model.addAttribute("referer", url);
		return "manageFinances/edit";
	}

	@RequestMapping(value = "edit", method = POST)
	public String edit(ManageFinances manageFinances,String referer,	Model model){
		manageFinancesService.update(manageFinances);
		return "redirect:" + referer;
	}
	@RequestMapping(value = "delete")
	public String delete(@RequestParam String id, HttpServletRequest req){
		manageFinancesService.delete(id);
		String url = req.getHeader("referer");
		return "redirect:" + url;
	}
	
	@RequestMapping(value = "existsName")
	@ResponseBody
	public boolean existsUsername(@RequestParam String name, String id) throws UnsupportedEncodingException{
		String newName = URLDecoder.decode(name, "UTF-8");
		if (StringUtils.isEmpty(id)) {
			return manageFinancesService.existsName(newName);
		} else {
			ManageFinances dbUser = manageFinancesService.queryById(id);
			String dbname = dbUser.getName();
			if (!dbname.equals(newName)) {
				// 进行新名字校验,防止有重名的角色
				return manageFinancesService.existsName(newName);
			} else {
				return false;
			}
		}
	}
}
