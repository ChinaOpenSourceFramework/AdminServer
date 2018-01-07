package com.liqiwei.soft.adminserver.common.user.dao;

import java.util.List;
import java.util.Set;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.liqiwei.soft.adminserver.common.user.model.SysUsers;

@Mapper
public interface SysUsersMapper {

	SysUsers selectByUserId (Integer userId);
	
	List<SysUsers> selectAllUser (SysUsers sysUsers);
	
	int deleteByUserId(Integer userId);
	
	int insert(SysUsers sysUsers);
	
	int updateByUserId(SysUsers sysUsers);

	List<Integer> findUserRolesByUserId(Integer userId);

	void deleteUserRoleByUserId(Integer userId);

	void addUserRole(@Param("userId")Integer userId, @Param("roleIds")String... roleIds);

	Set<String> findRolesByUsername(String username);

	Set<String> findPermissionsByUsername(String username);

	SysUsers findUserByUsername(String username);
}
