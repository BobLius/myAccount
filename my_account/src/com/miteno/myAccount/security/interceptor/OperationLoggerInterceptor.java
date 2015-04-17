/**   
* 文件名：OperationLoggerInterceptor.java   
*   
* 版本信息：   
* 日期：2014-1-17   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.myAccount.security.interceptor;

import java.util.Date;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.security.log.entity.Log;
import com.miteno.myAccount.security.log.service.LogService;
import com.miteno.myAccount.security.resource.entity.Resource;
import com.miteno.myAccount.security.resource.service.ResourceService;
import com.miteno.myAccount.security.user.entity.User;

/**   
 *    
 * 项目名称：bms   
 * 类名称：OperationLoggerInterceptor   
 * 类描述：   
 * 创建人：lzh   
 * 创建时间：2014-1-17 下午4:00:52   
 * 修改人：lzh   
 * 修改时间：2014-1-17 下午4:00:52   
 * 修改备注：   
 * @version    
 *    
 */
public class OperationLoggerInterceptor extends HandlerInterceptorAdapter{
//	private final static Logger logger = LoggerFactory.getLogger(OperationLoggerInterceptor.class);
	@javax.annotation.Resource
	private ResourceService resourceService;
	
	@javax.annotation.Resource
	private LogService logService;
	
	@javax.annotation.Resource
	private HibernateDao<User,String> userDao;
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception{
		
			
		/* 取请求参数键值 */	
		@SuppressWarnings("rawtypes")
		Map map= request.getParameterMap();
		@SuppressWarnings({ "rawtypes" })
		Set<Map.Entry> keyValues = map.entrySet();
		StringBuffer keyValueStrBuffer = new StringBuffer();
		for(Map.Entry<String,String[]> keyValue:keyValues){
			StringBuffer value = new StringBuffer();
			for(String str:keyValue.getValue()){
				value.append(str+",");
			}
			String valueStr = StringUtils.chop(value.toString());
			if(valueStr.length()>0)
				keyValueStrBuffer.append(keyValue.getKey()+"="+valueStr+"<br/>");
		}
		String keyValueStr = StringUtils.chop(keyValueStrBuffer.toString());
		
		/* 获取请求的URI,去掉工程名 ，取得最终的permission表中定义的URL,根据URL获取permission对象，从中再获取日志级别，操作名称 */
		String requestURI = request.getRequestURI();
		String context = request.getContextPath();
		requestURI = requestURI.replace(context,"");
			Resource resource;
			try {
				resource = resourceService.getResourceByUrl(requestURI);
			
			Short level = resource.getLog_level();
			
			
			if( level != null && level != -1 ){// -1 表示不记录日志
			//	if(!(level >= 1 && request.getMethod().equals("GET"))){//针对WARN类型
					Log log  = new Log();
					log.setAction(resource.getName());
					log.setActorId(userDao.get(User.class, "100000").getUsername());
					log.setDetail("来源IP和端口:  "+ request.getRemoteAddr()+" : "+request.getRemotePort()+(StringUtils.isEmpty(keyValueStr)?"":"<br/>内容:<br/>"+keyValueStr));
					log.setEventType(Log.EventType.SYSTEM);
					log.setName(StringUtils.isEmpty(resource.getEvent_name())?resource.getName():resource.getEvent_name());
					log.setResult(Log.Result.SUCCESS);
					log.setSessionId(request.getSession().getId());
					log.setTimestamp(new Date());
					log.setUrl(requestURI);
					log.setLog_level(level+0);
					logService.info(log);			
			//	}
			}
			
			} catch (Exception e) {
//				logger.error("URL:"+requestURI+"未找到！",e);
			}
	
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		return super.preHandle(request, response, handler);
	}
}
