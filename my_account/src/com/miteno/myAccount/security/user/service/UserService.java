package com.miteno.myAccount.security.user.service;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.security.exception.UserNotFoundException;
import com.miteno.myAccount.security.user.entity.User;
import com.miteno.myAccount.security.user.form.UserForm;

@Service("userService")
public class UserService {
	@Resource
	private HibernateDao<User,String> userDao;
	/**
	 * 
	  
	* save(保存一个新增的用户到数据库)   
	  
	* 使用该方法不用关注用户的新增时间、操作员，本方法都已经包含   
	  
	* @param user
	  
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public void save(User user){
		user.setCreate_dt(new Date());
		user.setC_operator_id(userDao.get(User.class, "100000").getUsername());
		userDao.save(user);
	}
	public void update(User user){
		user.setLast_upd_dt(new Date());
		user.setU_operator_id(userDao.get(User.class, "100000").getUsername());
		userDao.merge(user);
	}
	public void delete(String userId) throws UserNotFoundException{
		User user = this.getUserByUserId(userId);
		userDao.delete(user);
	}
	
	public User getUserByUserId(String id) throws UserNotFoundException{
		User user = userDao.get(User.class, id);
		if(user!=null){
			return user;
		}else{
			throw new UserNotFoundException("user with id "+ id +" not found");
		}		
	}
	public User getUserByUsername(String username) throws UserNotFoundException{
		User user = userDao.findUniqueByCriteria(User.class,Restrictions.eq("username", username));
		if(user!=null){
			return user;
		}else{
			throw new UserNotFoundException("user with name "+ username+" not found");
		}		
	}
	
	public boolean existsUsername(String username){
		if(userDao.findAllByCriteria(User.class, Restrictions.eq("username", username)).size()>0){
			return true;
		}
		return false;
	}
	public UserForm search(UserForm userForm) {
		DetachedCriteria detachedCriteria = DetachedCriteria
				.forClass(User.class);
		String roleId = userForm.getRoleId();
		String id = userForm.getId();
		String username = userForm.getUsername();
		Integer enabled = userForm.getEnabled();
		String dept = userForm.getDept();		
		String job=userForm.getJob();
		detachedCriteria.addOrder(Order.asc("id"));
		String userName=userDao.get(User.class, "100000").getUsername();
		String inst=userDao.get(User.class, "100000").getInst();
		if(!userName.equals("100000")&&StringUtils.isNotEmpty(inst)){
			detachedCriteria.add(Restrictions.eq("inst",
					inst));
		}
		if (roleId != null && !"".equals(roleId))
			detachedCriteria.createAlias("roles", "r").add(
					Restrictions.eq("r.id", roleId));
		if (id != null &&!"".equals(id))
			detachedCriteria.add(Restrictions.eq("id",
					id));
		if(username!=null && !"".equals(username))
			detachedCriteria.add(Restrictions.like("username",
					username,MatchMode.ANYWHERE));
		if(enabled!=null && !"".equals(enabled))
			detachedCriteria.add(Restrictions.eq("enabled", enabled));
		
		if(dept != null && !"".equals(dept))
			detachedCriteria.add(Restrictions.like("dept", dept,MatchMode.ANYWHERE));
		
		if(!StringUtils.isEmpty(job)){
			detachedCriteria.add(Restrictions.like("job",job,MatchMode.ANYWHERE));
		}
		detachedCriteria.add(Restrictions.ne("username", "100000"));
		userDao.findPageByDetachedCriteria(detachedCriteria,
				userForm);
		return userForm;
	}
	
}
