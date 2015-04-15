package com.miteno.myAccount.security.springsecurity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.security.resource.entity.Resource;

/**
 * 
 * 项目名称：activiti5.3   
 * 类名称：CustomSecurityMetadataSource   
 * 类描述：   实现spring security 中加载资源定义的实现，即告诉spring security 如何标识个性化系统中的资源定义，此处，
 * 创建人：lzh   
 * 创建时间：2013-5-29 下午4:08:31   
 * 修改人：lzh   
 * 修改时间：2013-5-29 下午4:08:31   
 * 修改备注：   
 * @version
 */
@Component
public class CustomSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
	@javax.annotation.Resource
	private HibernateDao<Resource,String> resourceDao;
	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
		

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

	public boolean supports(Class<?> clazz) {
		return true;
	}
	//加载所有资源与权限的关系，spring securiyt初始过程中只加载一次
	private void loadResourceDefine() {
		if(resourceMap == null) {
			resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
			List<Resource> resources = this.resourceDao.findAllByCriteria(Resource.class);
			ConfigAttribute configAttribute = null;
			for (Resource r : resources) {
				Collection<ConfigAttribute> configAttributes = new ArrayList<ConfigAttribute>();
				configAttribute = new SecurityConfig(r.getId()+"");
				configAttributes.add(configAttribute);
				resourceMap.put(r.getUrl(), configAttributes);
			}
		}
		
	}
	/**
	 * 根据之前 {@link #loadResourceDefine()} 已经加载的权限与访问资源之间的对应关系，此处根据资源访问标识返回对应的权限标识
	 * @see org.springframework.security.access.SecurityMetadataSource#getAttributes(java.lang.Object)
	 */
	public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
		//请求的URL
		String requestUrl = ((FilterInvocation) object).getRequestUrl();
		
		if(resourceMap == null || resourceMap.isEmpty()) {
			loadResourceDefine();
		}
		//对URL进行截取如果有 ? 取 ?之前 的url
		int pos = requestUrl.indexOf('?');
		if(pos != -1)
			requestUrl = requestUrl.substring(0, pos);
		return resourceMap.get(requestUrl);
	}

}