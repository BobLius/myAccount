package com.miteno.myAccount.security.role.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.beans.IntrospectionException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLDecoder;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.propertyeditors.PropertiesEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miteno.common.webui.tree.TreeService;
import com.miteno.myAccount.security.exception.RoleNotFoundException;
import com.miteno.myAccount.security.resource.service.ResourceService;
import com.miteno.myAccount.security.role.entity.Role;
import com.miteno.myAccount.security.role.form.RoleForm;
import com.miteno.myAccount.security.role.service.RoleService;



@Controller
@RequestMapping(value="/role")
public class RoleController {
	@Resource
	private RoleService roleService;
	@Resource
	private TreeService treeService;
	@Resource
	private ResourceService resourceService;
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder){
		webDataBinder.registerCustomEditor(Set.class,"resources",new PropertiesEditor(){
			/* 数据类型转换 */
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				String[] ids = text.split(",");
				Set<com.miteno.myAccount.security.resource.entity.Resource> resources = new HashSet<com.miteno.myAccount.security.resource.entity.Resource>();
				com.miteno.myAccount.security.resource.entity.Resource resource = null;
				for(String id:ids){
					if("".equals(id))
						continue;
					resource = new com.miteno.myAccount.security.resource.entity.Resource();
					resource.setId(id);
					resources.add(resource);					
				}
				setValue(resources);
			}
		});
	}
	
	@RequestMapping
	public String list(RoleForm roleForm,Model model){		
		model.addAttribute("form", roleService.search(roleForm));
		return "role/list";
	}
	@RequestMapping(value="view",method=GET)
	public String view(@RequestParam String id,Model model) throws RoleNotFoundException{
		List<String> toCheckList = roleService.getResourceIds(id);
		String tree = treeService.buildCheckBoxTree(resourceService.getResourceTreeList(),toCheckList ).toString();
		model.addAttribute("tree",tree);
		model.addAttribute("role", roleService.getRoleByRoleId(id));
		return "role/view";		
	}
	@RequestMapping(value="new",method=GET)
	public String newRole(Model model,HttpServletRequest req){
		String tree = treeService.buildCheckBoxTree(resourceService.getResourceTreeList()).toString();
		model.addAttribute("tree", tree);
		model.addAttribute("role", new Role());
		String url = req.getHeader("referer");
		model.addAttribute("referer",url);
		return "role/edit";
	}
	@RequestMapping(value="new",method=POST)
	public String save(@Validated Role role,BindingResult result,Model model,String referer){
		if(roleService.existsRoleName(role.getName())){
			result.addError(new FieldError(role.getName(), "name", "角色名已存在!"));
		}
		if(result.hasErrors()){
			String tree = treeService.buildCheckBoxTree(resourceService.getResourceTreeList()).toString();
			model.addAttribute("tree", tree);
			return "role/edit";
		}
		roleService.save(role);
		
		return "redirect:"+referer;
	}
	@RequestMapping(value="edit",method=GET)
	public String edit(@RequestParam String id,Model model,HttpServletRequest req) throws RoleNotFoundException{
		List<String> toCheckList = roleService.getResourceIds(id);
		String tree = treeService.buildCheckBoxTree(resourceService.getResourceTreeList(),toCheckList ).toString();
		model.addAttribute("tree",tree);
		model.addAttribute("role",roleService.getRoleByRoleId(id));
		String url = req.getHeader("referer");
		model.addAttribute("referer",url);
		return "role/edit";
	}
	
	@RequestMapping(value="edit",method=POST)
	public String update(@Validated Role role,BindingResult result,String referer,Model model) throws RoleNotFoundException{
		String roleName = role.getName();
		Role dbRole = roleService.getRoleByRoleId(role.getId());
		/* 如果名字与原记录对应的角色名字 不 一样 */
		if(!dbRole.getName().equals(roleName)){
			/* 进行新名字校验,防止有重名的角色  */
			if(roleService.existsRoleName(role.getName())){
				result.addError(new FieldError(role.getName(), "name", "角色名已存在!"));
			}else{
				dbRole.setName(roleName);
			}
		}
		if(result.hasErrors()){
			List<String> toCheckList = roleService.getResourceIds(role.getId());
			String tree = treeService.buildCheckBoxTree(resourceService.getResourceTreeList(),toCheckList ).toString();
			model.addAttribute("tree",tree);
			return "role/edit";
		}
		roleService.update(role);
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="delete")
	public String delete(@RequestParam String id,HttpServletRequest req) throws RoleNotFoundException{
		roleService.deleteRoleByRoleId(id);
		String url=req.getHeader("referer");
		return "redirect:"+url;
	}

	@RequestMapping(value = "existsRoleName",method=RequestMethod.POST)
	@ResponseBody
	public boolean validator(@RequestParam String id, @RequestParam String name) throws UnsupportedEncodingException {
		String newName = URLDecoder.decode(name, "UTF-8");
		if (StringUtils.isEmpty(id)) {
			return roleService.existsRoleName(newName);
		} else {
			Role dbRole;
			try {
				dbRole = roleService.getRoleByRoleId(id);
			} catch (RoleNotFoundException e) {
				return false;
			}
			String dbname = dbRole.getName();
			if (!dbname.equals(newName)) {
				// 进行新名字校验,防止有重名的角色
				return roleService.existsRoleName(newName);
			} else {
				return false;
			}
		}
	}
	@RequestMapping(value="q")
	@ResponseBody
	public Map<String,Object> query(RoleForm roleForm) throws IllegalArgumentException, IntrospectionException, IllegalAccessException, InvocationTargetException{
		return roleService.queryJsonByForm(roleForm);
	}
	
}
