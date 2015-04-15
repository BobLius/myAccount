/**   
* 文件名：LogService.java   
*   
* 版本信息：   
* 日期：2014-1-13   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.myAccount.security.log.service;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.miteno.common.dao.hibernate.HibernateDao;
import com.miteno.myAccount.security.log.entity.Log;
import com.miteno.myAccount.security.log.form.LogForm;

/**   
 *    
 * 项目名称：bms   
 * 类名称：LogService   
 * 类描述：   操作员日志查看、查询的服务类
 * 创建人：lzh   
 * 创建时间：2014-1-13 下午5:39:42   
 * 修改人：lzh   
 * 修改时间：2014-1-13 下午5:39:42   
 * 修改备注：   
 * @version    
 *    
 */
@Service
public class LogService {
	/**   
	* logDao: 日志数据访问层对象
	*   
	* @since Ver 1.1   
	*/   
	@Resource
	private HibernateDao<Log,String> logDao;
	
	public LogForm search(LogForm form){
		
		DetachedCriteria detachedCriteria = DetachedCriteria.forClass(Log.class);
		String name = form.getName();
		String user_id = form.getUser_id();
		String startDateTime = form.getStartDateTime();
		String endDateTime = form.getEndDateTime();
		
		if(StringUtils.isNotEmpty(name)){
			detachedCriteria.add(Restrictions.like("name", name, MatchMode.ANYWHERE));
		}
		if(StringUtils.isNotEmpty(user_id)){
			detachedCriteria.add(Restrictions.eq("actorId", user_id));
		}
		if (StringUtils.isNotEmpty(startDateTime)) {
			detachedCriteria.add(Restrictions.sqlRestriction("timestamp >= to_date(" + startDateTime + ", 'yyyy-mm-dd hh24:mi:ss')"));
		}
		if (StringUtils.isNotEmpty(endDateTime)) {
			detachedCriteria.add(Restrictions.sqlRestriction("timestamp <= to_date(" + endDateTime + ", 'yyyy-mm-dd hh24:mi:ss')"));
		}
		detachedCriteria.addOrder(Order.desc("timestamp"));
		logDao.findPageByDetachedCriteria(detachedCriteria, form);
		return form;
		
	}
	/**
	*   
	* debug(debug级别日志记录)   
	* @param log 日志对象
	* 	  
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public void debug(Log log){
		log.setLog_level(Log.EventLevel.DEBUG);
		log.setTimestamp(new Date());
		logDao.save(log);
	}
	/**
	 * 
	  
	* info(info级别的日志记录)  	  
	* @param log 日志对象
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public void info(Log log){
		log.setLog_level(Log.EventLevel.INFO);
		log.setTimestamp(new Date());
		logDao.save(log);
	}
	/**
	 * 
	  
	* warn(warn级别的日志记录)   
	  
	* @param log 日志对象
	  
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public void warn(Log log){
		log.setLog_level(Log.EventLevel.WARN);
		log.setTimestamp(new Date());
		logDao.save(log);
	}
	/**
	 * 
	  
	* error(error级别的日志记录)   
	  
	* @param log 日志对象
	  
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public void error(Log log){
		log.setLog_level(Log.EventLevel.ERROR);
		log.setTimestamp(new Date());
		logDao.save(log);
	}
	/**
	 * 
	  
	* fatal(这里用一句话描述这个方法的作用)   
	  
	* @param log 日志对象
	  
	* @since  CodingExample　Ver(编码范例查看) 1.1
	 */
	public void fatal(Log log){
		log.setLog_level(Log.EventLevel.FATAL);
		log.setTimestamp(new Date());
		logDao.save(log);
	}
}
