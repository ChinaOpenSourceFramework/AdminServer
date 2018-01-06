package com.liqiwei.soft.adminserver.common.role.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.role.model.SysRoles;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

public interface RoleService {
	
	SysRoles selectByRoleId(Integer roleId);

	PageInfo<SysRoles> selectAllRole (SysRoles sysRoles,PageParamUtil pageParam);
	
	int deleteByRoleId(Integer roleId);
	
    int insert(SysRoles sysRoles);

    int updateBySysRoleId(SysRoles sysRoles);
    
    List<SysRoles> selectAllRoleList (SysRoles sysRoles);

	String findRoleResourceByRoleId(Integer roleId);

	void saveRoleResourceId(Integer roleId, String resourceIds);
}
