package com.miteno.myAccount.index.controller;


import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.auth.AuthenticationException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miteno.myAccount.security.resource.entity.Resource;
import com.miteno.myAccount.security.resource.service.ResourceService;
import com.miteno.myAccount.security.user.entity.User;
import com.miteno.common.dao.hibernate.HibernateDao;




@Controller
@RequestMapping("/")
public class IndexController {
	@javax.annotation.Resource
	private ResourceService resourceService;
	@javax.annotation.Resource
	private HibernateDao<Resource,String> resourceDao;
	@javax.annotation.Resource
	private HibernateDao<User,String> userDao;
	
	@RequestMapping(method=RequestMethod.GET)
	public String welcome(Model model){
		try {
			User user = userDao.get(User.class, "100000");
			model.addAttribute("user", user);		
			List<Resource> resources = resourceDao.findAllByCriteria(Resource.class,Restrictions.eq("level", (short)1));
			String user_type = user.getUser_type();
			Collections.sort(resources);
			model.addAttribute("resources",resources);
			model.addAttribute("user_type",user_type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}
	@RequestMapping(value="menu",method=RequestMethod.GET)
	public String menu(Model model){
		model.addAttribute("resources",resourceService.getAllMenus());
		return "menu";
	}
	public ResourceService getResourceService() {
		return resourceService;
	}
	public void setResourceService(ResourceService resourceService) {
		this.resourceService = resourceService;
	}
	@RequestMapping(value="checkIsLogin")
	@ResponseBody
	public boolean isLogin(HttpSession session){
		if(userDao.get(User.class, "100000") == null){
			session.setAttribute("SPRING_SECURITY_LAST_EXCEPTION", new AuthenticationException("�û�δ��¼"));
			return false;
		}
		return true;
	}
}
