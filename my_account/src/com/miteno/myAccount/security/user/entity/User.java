package com.miteno.myAccount.security.user.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.GenericGenerator;

import com.fasterxml.jackson.annotation.JsonFilter;
import com.miteno.myAccount.security.role.entity.Role;

@Entity(name="user")
@JsonFilter("userFilter")
public class User implements java.io.Serializable{

	/**   
	* serialVersionUID:序列化标识用于判断实体类是否发生过改变    
	*   
	* @since Ver 1.1   
	*/   
	
	private static final long serialVersionUID = 6869029100320618414L;

	@Id
	@GeneratedValue(generator="hibernate-uuid")
    @GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	private String id;	
	
	/**   
	* username:用户登录名，即在登录页面要输入的登录用的用户名或用户编号   
	* 修改 日期 2014年01月20日 14:01  
	* @since Ver 1.1   
	*/   
	private String username;	
	/**   
	* realname:用户真实姓名   
	* 添加 日期 2014年01月20日 14:00 
	* @since Ver 1.1   
	*/   
	private String realname;
	private String dept;	
	// 默认值 1 表示启用
	private Integer enabled =1;
	private String phone;
	private String mobile;
	private String email;
	private String job;
	private Integer errorCnt;

	private String branch_inst_id;
	private String isdelete="0";
	private Date create_dt;
	private String c_operator_id;
	private Date last_upd_dt;
	private String u_operator_id;
	private String user_type;
	private String inst;
	
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@ManyToMany
	@JoinTable(name="users_role",
			joinColumns = { @JoinColumn(name="users_id") }, 
			inverseJoinColumns = { @JoinColumn(name="roles_id") }
			)
	private Set<Role> role = new HashSet<Role>(0);
	
	/** default constructor */
	public User() {
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getEnabled() {
		return enabled;
	}
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}
	public Set<Role> getRole() {
		return role;
	}
	public void setRole(Set<Role> role) {
		this.role = role;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}

	public Integer getErrorCnt() {
		return errorCnt;
	}
	public void setErrorCnt(Integer errorCnt) {
		this.errorCnt = errorCnt;
	}
	public int getErrCnt() {
		return errorCnt;
	}
	public void setErrCnt(int cnt) {
		setErrorCnt(cnt);
		
	}
	public boolean getEnable() {
		return enabled.equals("1");
	}
	public void setEnabled(boolean enabled) {
		setEnabled(enabled?1:0);		
	}

	public Date getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(Date create_dt) {
		this.create_dt = create_dt;
	}
	public String getC_operator_id() {
		return c_operator_id;
	}
	public void setC_operator_id(String c_operator_id) {
		this.c_operator_id = c_operator_id;
	}
	public Date getLast_upd_dt() {
		return last_upd_dt;
	}
	public void setLast_upd_dt(Date last_upd_dt) {
		this.last_upd_dt = last_upd_dt;
	}
	public String getU_operator_id() {
		return u_operator_id;
	}
	public void setU_operator_id(String u_operator_id) {
		this.u_operator_id = u_operator_id;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getBranch_inst_id() {
		return branch_inst_id;
	}
	public void setBranch_inst_id(String branch_inst_id) {
		this.branch_inst_id = branch_inst_id;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getInst() {
		return inst;
	}
	public void setInst(String inst) {
		this.inst = inst;
	}
}