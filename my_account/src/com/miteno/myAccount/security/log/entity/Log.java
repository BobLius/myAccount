/**   
* 文件名：Log.java   
*   
* 版本信息：   
* 日期：2014-1-13   
* Copyright 移动信息 2014    
* 版权所有   
*   
*/
package com.miteno.myAccount.security.log.entity;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.miteno.myAccount.security.user.entity.User;

/**   
 *    
 * 项目名称：bms   
 * 类名称：Log   
 * 类描述：   用于记录操作员操作日志的流水表
 * 创建人：tao  
 * 创建时间：2014-1-13 下午5:28:42   
 * 修改人：tao   
 * 修改时间：2014-1-13 下午5:28:42   
 * 修改备注：   
 * @version    
 *    
 */
@Entity
@Table(name="log")
public class Log implements java.io.Serializable {
	/**   
	* serialVersionUID:TODO（用一句话描述这个变量表示什么）   
	*   
	* @since Ver 1.1   
	*/   
	
	private static final long serialVersionUID = 1L;
	public final static class Result{
		public final static Integer SUCCESS = 0;
		public final static Integer FAIL = 1; 
	}
	public final static class EventLevel {
		public final static Integer DEBUG = 0;
		public final static Integer INFO = 1;
		public final static Integer WARN = 2;
		public final static Integer FATAL = 3;
		public final static Integer ERROR = 4;
	}
	public final static class EventType {
		/*系统登录*/
		public final static Integer SECURITY = 0;
		/*系统数据维护，如用户角色等修改*/
		public final static Integer SYSTEM = 1;
		/*业务数据的维护*/
		public final static Integer BUSINESS = 2;
	}

	/**
	 * 用32个字符长的UUID做主键
	 */
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	//事件级别
	private Integer log_level;
	//事件日期时间
	private Date timestamp;	
	//会话编号
	@Column(name="session_id")
	private String sessionId;
	@Column(name="actor_id")
	private String actorId;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="actor_id",insertable=false,updatable=false)
	private User actor;
	//请求的 URL地址 例如  /user/view
	private String url;
	//事件类型 ：系统登录， 系统数据维护，业务数据保维护
	@Column(name="event_type")
	private Integer eventType;
	//操作  例如： 增加 删除 修改  提交 审核 
	private String action;
	//事件名称 增加商户 删除商户 提交商户删除请求  审核商户删除
	private String name;	
	//所操作的对象 例如: 商户、 发卡机构、收单机构、终端
	@Column(name="entity_class")
	private String entityClass;
	//操作的结果 0：成功  1：失败
	private Integer result;
	//操作的细节描述 例如 ：id:1000001,name:燕莎MALL,xxx:xxx,.....
//	@Lob
	@Basic(fetch=FetchType.LAZY,optional=true)
	@Column(columnDefinition="clob",nullable=true)
	private String detail;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public User getActor() {
		return actor;
	}
	public void setActor(User actor) {
		this.actor = actor;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getEventType() {
		return eventType;
	}
	public void setEventType(Integer eventType) {
		this.eventType = eventType;
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

	public String getEntityClass() {
		return entityClass;
	}
	public void setEntityClass(String entityClass) {
		this.entityClass = entityClass;
	}
	public Integer getResult() {
		return result;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public Integer getLog_level() {
		return log_level;
	}
	public void setLog_level(Integer log_level) {
		this.log_level = log_level;
	}
	public String getActorId() {
		return actorId;
	}
	public void setActorId(String actorId) {
		this.actorId = actorId;
	}

	
}
