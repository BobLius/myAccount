package com.miteno.myAccount.security.role.service;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.myAccount.security.exception.RoleNotFoundException;
import com.miteno.myAccount.security.role.entity.Role;
import com.miteno.myAccount.security.role.form.RoleForm;
import com.miteno.myAccount.security.user.entity.User;
import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.common.webui.jqgrid.Serializer;



@Service("roleService")
public class RoleService {
	@Resource
	private HibernateDao<Role,String> roleDao;
	@Resource
	private HibernateDao<User, String > userDao;
	public void save(Role role){
		role.setC_operator_id(userDao.get(User.class, "100000").getUsername());
		role.setCreate_dt(new Date());
		roleDao.save(role);
	}
	public void update(Role role) throws RoleNotFoundException{
		role.setLast_upd_dt(new Date());
		role.setU_operator_id(userDao.get(User.class, "100000").getUsername());
		Role dbRole = this.getRoleByRoleId(role.getId());
		role.setCreate_dt(dbRole.getCreate_dt());
		role.setC_operator_id(dbRole.getC_operator_id());
		roleDao.merge(role);
	}
	public void deleteRoleByRoleId(String id) throws RoleNotFoundException{
		Role role= this.getRoleByRoleId(id);
		roleDao.delete(role);
	}
	public Role getRoleByRoleId(String id) throws RoleNotFoundException{
		Role role = roleDao.get(Role.class,id);
		if(role != null)
			return role;
		else 
			throw new RoleNotFoundException("role with the id ["+ id +"] not found!");
	}
	public boolean existsRoleName(String roleName){
		if(roleDao.findAllByCriteria(Role.class,Restrictions.eq("name", roleName)).size()>0){
			return true;
		}
		return false;
	}
	
	
	
	public RoleForm search(RoleForm roleForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(Role.class);
		detachedCriteria.addOrder(Order.asc("name"));
		String userName = userDao.get(User.class, "100000").getUsername();
		if(!userName.equals("100000")){
			detachedCriteria.add(Restrictions.eq("c_operator_id", userName));
		}
		if (roleForm.getRoleName() != null) {
			detachedCriteria.add(Restrictions.like("name",
					roleForm.getRoleName(), MatchMode.ANYWHERE));
		}
		roleDao.findPageByDetachedCriteriaProjection(detachedCriteria, roleForm);
		return roleForm;
	}

	public List<String> getResourceIds(String id) {
		List<String> ids = new ArrayList<String>();
		Set<com.miteno.myAccount.security.resource.entity.Resource> resources = roleDao
				.get(Role.class, id).getResources();
		for (com.miteno.myAccount.security.resource.entity.Resource resource : resources) {
			ids.add(resource.getId().toString());
		}
		return ids;
	}
	public Map<String,Object> queryJsonByForm(RoleForm roleForm) throws IllegalArgumentException, IntrospectionException, IllegalAccessException, InvocationTargetException{
		
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Role.class);
		
		String roleName = roleForm.getRoleName();
		String userName = userDao.get(User.class, "100000").getUsername();
		if(!userName.equals("100000")){
			detachedCriteria.add(Restrictions.eq("c_operator_id", userName));
		}
		if(StringUtils.isNotEmpty(roleName)){
			detachedCriteria.add(Restrictions.like("name", roleName,MatchMode.ANYWHERE));
		}
		roleDao.findPageByDetachedCriteria(detachedCriteria, roleForm);
		Map<String,Object> map = new HashMap<String,Object>();
		Serializer<Role> ser= new Serializer<Role>();
		map = ser.page2Json(roleForm, "id","name");
		return map;
	}
}
