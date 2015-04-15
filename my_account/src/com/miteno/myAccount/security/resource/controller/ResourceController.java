package com.miteno.myAccount.security.resource.controller;

import java.lang.reflect.InvocationTargetException;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.PropertyAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingErrorProcessor;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.common.webui.tree.TreeService;
import com.miteno.myAccount.security.resource.entity.Resource;
import com.miteno.myAccount.security.resource.service.ResourceService;



@Controller
@RequestMapping("/resource")
public class ResourceController {
	@javax.annotation.Resource
	private HibernateDao<Resource,String> resourceDao;
	@javax.annotation.Resource
	private ResourceService resourceService;
	@javax.annotation.Resource
	private TreeService treeService;
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder){
		webDataBinder.setBindingErrorProcessor(new BindingErrorProcessor() {
			
			public void processPropertyAccessException(PropertyAccessException exception,
					BindingResult result) {
				result.addError(new FieldError(exception.getValue().toString(), exception.getPropertyName(), "类型转换错误"));
			}
			
			public void processMissingFieldError(String arg0, BindingResult arg1) {
				System.out.println("=====");
			}
		});
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String list(Model model){
		String tree = treeService.buildTree(resourceService.getResourceTreeList()).toString();
		model.addAttribute("tree",tree);
		return "resource/list";
	}
	
	@RequestMapping(value="view",method=RequestMethod.GET)
	public String view(@RequestParam String id,Model model){
		model.addAttribute("resource",resourceService.getResourceById(id));
		return "resource/view";		
	}
	@RequestMapping(value="new",method=RequestMethod.GET)
	public String newResource(@RequestParam String pid,Model model){
		Resource resource = new Resource();
		resource.setParent(resourceService.getResourceById(pid));		
		model.addAttribute("resource",resource);
		return "resource/edit";		
	}
	@RequestMapping(value="new",method=RequestMethod.POST)
	public String save(@Validated Resource resource,BindingResult result){
		if(result.hasErrors()){
			return "resource/edit";
		}
		resourceDao.save(resource);
		return "redirect:";
	}
	@RequestMapping(value="edit",method=RequestMethod.GET)
	public String edit(@RequestParam String id,Model model){
		model.addAttribute("resource",resourceService.getResourceById(id));
		return "resource/edit";
	}
	@RequestMapping(value="edit",method=RequestMethod.POST)
	public String update(@Validated Resource resource,BindingResult result) throws IllegalAccessException, InvocationTargetException{
		if(result.hasErrors()){
			return "resource/edit";
		}
		Resource r = resourceDao.get(Resource.class, resource.getId());
		BeanUtils.copyProperties(resource, r);
		
		resourceDao.update(r);
		return "redirect:view?id="+resource.getId();
	}
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public String delete(@RequestParam String id){
		resourceDao.delete(resourceDao.get(Resource.class,id));
		return "redirect:";
	}
}
