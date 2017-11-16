package com.liqiwei.soft.adminserver.common.role.model;

public class SysRoles {

    private Integer roleId;

    private String roleName;

    private String description;

    private Boolean locked;

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
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Boolean getLocked() {
        return locked;
    }

    public void setLocked(Boolean locked) {
        this.locked = locked;
    }

	@Override
	public String toString() {
		return "SysRoles [roleId=" + roleId + ", roleName=" + roleName + ", description=" + description + ", locked="
				+ locked + "]";
	}
    
    
}