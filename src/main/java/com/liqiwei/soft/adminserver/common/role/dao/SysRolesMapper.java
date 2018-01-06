package com.liqiwei.soft.adminserver.common.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liqiwei.soft.adminserver.common.role.model.SysRoles;

@Mapper
public interface SysRolesMapper {

	SysRoles selectByRoleId(Integer roleId);

	List<SysRoles> selectAllRole (SysRoles sysRoles);
	
	int deleteByRoleId(Integer roleId);
	
    int insert(SysRoles sysRoles);

    int updateBySysRoleId(SysRoles sysRoles);
    
    List<Integer> findRoleResourcesByRoleId(Integer roleId);
    
	void deleteRoleResourceByRoleId(Integer roleId);

	void addRoleResource(@Param("roleId")Integer roleId, @Param("resourceIds")String... resourceIds);
}