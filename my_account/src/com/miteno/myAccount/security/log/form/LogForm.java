/**   
* 文件名：LogForm.java   
*   
* 版本信息：   
* 日期：2014-1-13   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.myAccount.security.log.form;

import com.miteno.myAccount.security.log.entity.Log;
import com.miteno.common.dao.Page;

/**   
 *    
 * 项目名称：tms   
 * 类名称：LogForm   
 * 类描述：   用于操作员操作日志查询管理的表单值对象类
 * 创建人：tao   
 * 创建时间：2014-1-13 下午5:41:43   
 * 修改人：tao   
 * 修改时间：2014-1-13 下午5:41:43   
 * 修改备注：   
 * @version    
 *    
 */
public class LogForm extends Page<Log>{
	//操作员名字
	private String username;
	//操作员编号
	private String user_id;	
	//机构编号
	private String inst_id;
	//机构名称 
	private String inst_name;
	//事件类型
	private String eventType;
	//事件级别
	private String log_level;
	//操作
	private String action;
	//事件名称
	private String name;
	//开始时间
	private String startDateTime;
	//结束时间
	private String endDateTime;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getInst_id() {
		return inst_id;
	}
	public void setInst_id(String inst_id) {
		this.inst_id = inst_id;
	}
	
	public String getInst_name() {
		return inst_name;
	}
	public void setInst_name(String inst_name) {
		this.inst_name = inst_name;
	}
	public String getEventType() {
		return eventType;
	}
	public void setEventType(String eventType) {
		this.eventType = eventType;
	}
	public String getLog_level() {
		return log_level;
	}
	public void setLog_level(String log_level) {
		this.log_level = log_level;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStartDateTime() {
		return startDateTime;
	}
	public void setStartDateTime(String startDateTime) {
		this.startDateTime = startDateTime;
	}
	public String getEndDateTime() {
		return endDateTime;
	}
	public void setEndDateTime(String endDateTime) {
		this.endDateTime = endDateTime;
	}
}
