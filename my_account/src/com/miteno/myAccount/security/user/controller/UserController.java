package com.miteno.myAccount.security.user.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.propertyeditors.PropertiesEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.security.exception.UserNotFoundException;
import com.miteno.myAccount.security.role.entity.Role;
import com.miteno.myAccount.security.user.entity.User;
import com.miteno.myAccount.security.user.form.UserForm;
import com.miteno.myAccount.security.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	@Resource
	private HibernateDao<Role, String> roleDao;
	@Resource
	private HibernateDao<User, String> userDao;

	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(Set.class, "roles",
				new PropertiesEditor() {
					@Override
					public void setAsText(String text)
							throws IllegalArgumentException {
						String[] ids = text.split(",");
						Set<Role> roles = new HashSet<Role>();
						Role role = null;
						for (String id : ids) {
							role = new Role();
							if ("".equals(id))
								continue;
							role.setId(id);
							roles.add(role);
						}
						setValue(roles);
					}
				});
	}

	@RequestMapping
	public String list(UserForm userForm, Model model) {
		model.addAttribute("form", userService.search(userForm));
		model.addAttribute("roles", roleDao.findAllByCriteria(Role.class));
		return "user/list";
	}

	@RequestMapping(value = "view")
	public String view(@RequestParam String id, Model model)
			throws UserNotFoundException {
		User user = userService.getUserByUserId(id);
		model.addAttribute("user", user);
		/*
		 * UserDataLevel userDataLevel =user.getUserDataLevel(); // String
		 * datalevel_name = user.getUserDataLevel().getDatalevel_name();
		 * model.addAttribute("userDataLevel", userDataLevel);
		 */
		return "user/view";
	}

	@RequestMapping(value = "add", method = GET)
	public String toAdd(Model model, HttpServletRequest req) {
		model.addAttribute("user", new User());
		model.addAttribute("unSelectedServer", "请选择数据级别");
		String url = req.getHeader("referer");
		model.addAttribute("referer", url);
		return "user/edit";
	}

	@RequestMapping(value = "add", method = POST)
	public String add(@Validated User user, BindingResult result,
			String referer, Model model, String datalevel_id) {
		userService.save(user);
		return "redirect:" + referer;
	}

	@RequestMapping(value = "edit", method = GET)
	public String toEdit(@RequestParam String id, HttpServletRequest req,
			Model model) throws UserNotFoundException {
		String url = req.getHeader("referer");
		// model.addAttribute("user", userService.getUserByUserId(id));
		User user = userService.getUserByUserId(id);
		model.addAttribute("user", user);
		model.addAttribute("referer", url);
		return "user/edit";
	}

	@RequestMapping(value = "edit", method = POST)
	public String edit(User user, BindingResult result, String referer,
			Model model, String datalevel_id) throws UserNotFoundException {
		User dbUser = userService.getUserByUserId(user.getId());
		/* 不允许修改内置管理员姓名，该姓名用于区分权限 */
		if ("admin".equals(dbUser.getUsername()))
			user.setUsername("admin");
		userService.update(user);
		return "redirect:" + referer;
	}

	@RequestMapping(value = "delete")
	public String delete(@RequestParam String id, HttpServletRequest req)
			throws UserNotFoundException {
		User user = userService.getUserByUserId(id);
		/* 不允许删除 内置超级管理员 admin */
		if (user != null && !"admin".equals(user.getUsername())) {
			userService.delete(id);
		}
		String url = req.getHeader("referer");
		return "redirect:" + url;
	}

	@RequestMapping(value = "existsUsername")
	@ResponseBody
	public boolean existsUsername(@RequestParam String username, String id)
			throws UserNotFoundException, UnsupportedEncodingException {
		String newName = URLDecoder.decode(username, "UTF-8");
		if (StringUtils.isEmpty(id)) {
			return userService.existsUsername(newName);
		} else {
			User dbUser = userService.getUserByUserId(id);
			String dbname = dbUser.getUsername();
			if (!dbname.equals(username)) {
				// 进行新名字校验,防止有重名的角色
				return userService.existsUsername(newName);
			} else {
				return false;
			}
		}
	}

	@RequestMapping(value = "glance")
	public String glance(@RequestParam String id, Model model) {
		model.addAttribute(
				"user",
				userDao.findUniqueByCriteria(User.class,
						Restrictions.eq("username", id)));
		return "user/glance";
	}

}
