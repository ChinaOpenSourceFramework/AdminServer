package com.liqiwei.soft.adminserver.common.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liqiwei.soft.adminserver.common.role.model.SysRoles;

@Mapper
public interface SysRolesMapper {

	SysRoles selectByRoleId(Integer roleId);

	List<SysRoles> selectAllRole (SysRoles sysRoles);
	
	int deleteByRoleId(Integer roleId);
	
    int insert(SysRoles sysRoles);

    int updateBySysRoleId(SysRoles sysRoles);
}