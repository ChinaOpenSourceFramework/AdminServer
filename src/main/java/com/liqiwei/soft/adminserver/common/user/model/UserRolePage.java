package com.liqiwei.soft.adminserver.common.user.model;

public class UserRolePage {

    private Integer roleId;

    private String roleName;
    
    private Boolean own;

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Boolean getOwn() {
		return own;
	}

	public void setOwn(Boolean own) {
		this.own = own;
	}
    
    
}
