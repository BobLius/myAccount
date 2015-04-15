package com.miteno.myAccount.security.resource.entity;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import com.miteno.myAccount.security.role.entity.Role;


@Entity
@Table(name="resources")
public class Resource implements java.io.Serializable,Comparable<Resource>{
	public final static String MENU = "0";
	public final static String BUTTON = "1";
	private static final long serialVersionUID = 1316646639638059394L;
	@Id
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	private String id;
	@Pattern(regexp="^/.+",message="路径必须以 / 开头")
	private String url;
	@Column(name="menu_level")
	@Range(min=0,max=3,message="必须是 0~3 的数字")
	private Short level;
	@Column(name="menu_order")
	@Range(min=0,max=2000,message="必须是0~2000的数字")
	private Short priority;
	@Digits(integer=1,fraction=0)
	private String type = "1";
	@NotEmpty(message="权限名称不能为空")
	@Size(max=30,message="最大长度不能超过30个字节")
	private String name;
	@Size(max=200,message="备注最大长度不能超过200个字节")
	private String event_name;
	@Range(min=-1,max=4,message="请指定正确的日志输出级别")
	private Short log_level;
	@ManyToMany(mappedBy="resources",fetch=FetchType.LAZY)
	private Set<Role> roles;
	/* mappedBy 必须配置,以防关联关系丢失  */
	@OneToMany(fetch=FetchType.LAZY,mappedBy="parent")
	private List<Resource> children;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="pid")
	private Resource parent;
	
	private Date create_dt;
	private String c_operator_id;
	private Date last_upd_dt;
	private String u_operator_id;
	private String resources_type;
	private String synonyms;

	public Resource getParent() {
		return parent;
	}

	public void setParent(Resource parent) {
		this.parent = parent;
	}

	public List<Resource> getChildren() {
		if(children != null)
			Collections.sort(children);
		return children;
	}

	public void setChildren(List<Resource> children) {
		this.children = children;
	}

	/** default constructor */
	public Resource() {
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	public Short getPriority() {
		return priority;
	}

	public void setPriority(Short priority) {
		this.priority = priority;
	}

	public void setLevel(Short level) {
		this.level = level;
	}

	public void setLog_level(Short log_level) {
		this.log_level = log_level;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEvent_name() {
		return event_name;
	}

	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}

	public Short getLevel() {
		return level;
	}

	public Short getLog_level() {
		return log_level;
	}

	public int compareTo(Resource resource){
		if(priority==null||resource==null||resource.priority==null){
			return 0;
		}
		return priority-resource.priority;
	}

	public String getLogDetail() {
		return id.toString();
	}

	@Override
	public String toString() {
		return id.toString();
	}

	@Override
	public int hashCode() {
		int result = 37;
		if(id!=null)
			result = result*id.hashCode();
		return  result;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj == this)
			return true;
		if(obj == null)
			return false;
		if(!(obj instanceof Resource))
			return false;
		Resource p = (Resource) obj;
		return p.id.equals(id);
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

	public String getResources_type() {
		return resources_type;
	}

	public void setResources_type(String resources_type) {
		this.resources_type = resources_type;
	}

	public String getSynonyms() {
		return synonyms;
	}

	public void setSynonyms(String synonyms) {
		this.synonyms = synonyms;
	}

}