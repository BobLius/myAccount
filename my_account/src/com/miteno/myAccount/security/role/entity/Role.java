package com.miteno.myAccount.security.role.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.GenericGenerator;

import com.miteno.myAccount.security.resource.entity.Resource;
import com.miteno.myAccount.security.user.entity.User;

@Entity(name="role")
public class Role implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2326988150385037222L;
	@Id
	@GeneratedValue(generator="hibernate-uuid")
    @GenericGenerator(name = "hibernate-uuid", strategy = "uuid")
	private String id;
	private String name;
	@ManyToMany(mappedBy="role")
	private Set<User> user = new HashSet<User>(0);
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="role_resource",
			joinColumns={@JoinColumn(name="roles_id",referencedColumnName="id")},
			inverseJoinColumns={@JoinColumn(name="resources_id",referencedColumnName="id")})
	private Set<Resource> resources = new HashSet<Resource>(0);
	
	private Date create_dt;
	private String c_operator_id;
	private Date last_upd_dt;
	private String u_operator_id;
	/** default constructor */
	public Role() {
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Resource> getResources() {
		return resources;
	}

	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}

	public void setUser(Set<User> user) {
		this.user = user;
	}
	public Set<User> getUser() {
		return user;
	}
	@Override
	public String toString() {
		return id.toString();
	}
	@Override
	public int hashCode() {
		if(id == null)
			return 0;
		return id.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		if(id == null )
			return false;
		Role r = (Role) obj;
		return id.equals(r.id);
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
	
	
}