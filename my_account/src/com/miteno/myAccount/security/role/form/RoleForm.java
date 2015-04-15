package com.miteno.myAccount.security.role.form;

import com.miteno.myAccount.security.role.entity.Role;
import com.miteno.common.dao.Page;

public class RoleForm extends Page<Role>{
	private String roleName;

	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}
