package com.miteno.myAccount.security.springsecurity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.criterion.Restrictions;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.miteno.myAccount.security.exception.UserNotFoundException;
import com.miteno.myAccount.security.resource.entity.Resource;
import com.miteno.myAccount.security.role.entity.Role;
import com.miteno.myAccount.security.user.entity.User;
import com.miteno.myAccount.security.user.service.UserService;
import com.miteno.common.dao.hibernate.HibernateDao;

/**
 * 根据spring security 接口，实现自己的用户详情
 * 
 * @ClassName: CustomUserDetailsServiceImpl
 * @author 李真河
 */
@Service("customUserDetailsService")
public class CustomUserDetailsServiceImpl implements UserDetailsService {

	/**
	 * @Fields serialVersionUID : TODO（用一句话描述这个变量表示什么）.
	 */
	@SuppressWarnings("unused")
	private static final long serialVersionUID = 1L;
	
	@javax.annotation.Resource
	private UserService userService;
	@javax.annotation.Resource
	private HibernateDao<Resource, String> resourceDao;

	/*
	 * 根据用户名判断是否存在 <p>Title: loadUserByUsername</p> <p>Description: </p>
	 * 
	 * @param arg0
	 * 
	 * @return
	 * 
	 * @throws UsernameNotFoundException
	 * 
	 * @see org.springframework.security.core.userdetails.UserDetailsService#
	 * loadUserByUsername(java.lang.String)
	 */
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		User user;
		try {
			user = userService.getUserByUsername(username);
		} catch (UserNotFoundException e) {
			throw new UsernameNotFoundException("用户" + username + "不存在");
		}

		Collection<GrantedAuthority> grantedAuths = obtionGrantedAuthorities(user);
		boolean enabled = user.getEnabled() == 1;
		boolean accountNonExpired = true;
		boolean credentialsNonExpired = !this.checkAccountExpired(user);
		boolean accountNonLocked = user.getEnabled() == 1;
		// 这里的密码，由于使用了CAS,使用的是Ticket机制,密码已经没有作用，随意一个字符串就可以
		org.springframework.security.core.userdetails.User userdetail = new org.springframework.security.core.userdetails.User(
				user.getUsername(), "00000", enabled, accountNonExpired,
				credentialsNonExpired, accountNonLocked, grantedAuths);
		return userdetail;
	}

	/**
	 * 
	 * 取得用户对应的权限对象permission,并把permission的记录编号，也是数据库的主键 permisson的id放置进去
	 * 
	 * @see CustomAccessDecisionManager#decide(org.springframework.security.core.Authentication,
	 *      Object, Collection)
	 * @param user
	 *            管理平台的用户
	 * @return 该用户拥有的权限记录编号集合
	 * @since 0.1
	 */
	private Set<GrantedAuthority> obtionGrantedAuthorities(
			User user) {
		Set<GrantedAuthority> authSet = new HashSet<GrantedAuthority>();
		List<Resource> resources = new ArrayList<Resource>();
		Set<Role> roles = user.getRole();
		// 如果是admin,直接分配所有权限
		if ("admin".equals(user.getRealname())) {
			resources = resourceDao.findAllByCriteria(Resource.class,Restrictions.eq("resources_type", "0"));
			for (Resource res : resources) {
				authSet.add(new SimpleGrantedAuthority(res.getId() + ""));
			}
			return authSet;
		}

		for (Role role : roles) {
			Set<Resource> tempRes = role.getResources();
			for (Resource res : tempRes) {
				resources.add(res);
			}
		}
		for (Resource res : resources) {
			authSet.add(new SimpleGrantedAuthority(res.getId() + ""));
		}
		return authSet;
	}

	/**
	 * 
	 * checkAccountExpired 检查账户是否过期
	 * 
	 * @param user
	 * @return true：过期 ；false:未过期
	 * @since 0.1
	 */
	private boolean checkAccountExpired(
			User user) {
		//TODO 检查启用上次修改密码日期时间距离现在有多长时间，如果超出指定时间范围，返回用户密码已过期检查为true
		return false;

	}

}
