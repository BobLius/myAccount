package com.miteno.myAccount.security.springsecurity;

import java.util.Collection;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

/**
 * 
 * 项目名称：activiti5.3   
 * 类名称：CustomAccessDecisionManager   
 * 类描述：   实现判断spring security中用户是否有权限访问资源的接口
 * 创建人：lzh   
 * 创建时间：2013-5-29 下午3:59:20   
 * 修改人：lzh   
 * 修改时间：2013-5-29 下午3:59:20   
 * 修改备注：   
 * @version 0.1
 */
@Component
public class CustomAccessDecisionManager implements AccessDecisionManager {
	Logger log = Logger.getLogger(getClass());
	public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes) throws AccessDeniedException, InsufficientAuthenticationException {
		if(configAttributes == null) {
			return;
		}
		Iterator<ConfigAttribute> iterator = configAttributes.iterator();
		while(iterator.hasNext()) {
			ConfigAttribute configAttribute = iterator.next();
			String needPermission = configAttribute.getAttribute();
			log.info("需要的权限是："+needPermission);
			//用户所拥有的权限authentication
			for(GrantedAuthority ga : authentication.getAuthorities()) {
				if(needPermission.equals(ga.getAuthority())) {
					return;
				}
			}
		}
		//原来 Spring Security的做法是判断如果 auth 是 anonymousrUser 则直接跳转登录,因为这个工程中用到的iframe 如果直接跳转 target_frame页面
		//会无法显示左侧菜单
		if("anonymousUser".equals(authentication.getPrincipal())){
			SecurityContextHolder.getContext().setAuthentication(null);
		}
		throw new AccessDeniedException(" 没有权限访问！");
	}

	public boolean supports(ConfigAttribute attribute) {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return true;
	}
	
}
