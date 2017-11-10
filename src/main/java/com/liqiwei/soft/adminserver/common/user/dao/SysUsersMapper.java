package com.liqiwei.soft.adminserver.common.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liqiwei.soft.adminserver.common.user.model.SysUsers;

@Mapper
public interface SysUsersMapper {

	SysUsers selectByUserId (Integer userId);
	
	List<SysUsers> selectAllUser ();
	
	int deleteByUserId(Integer userId);
	
	int insert(SysUsers sysUsers);
	
	int updateByUserId(SysUsers sysUsers);
}
