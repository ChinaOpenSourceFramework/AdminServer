package com.liqiwei.soft.adminserver.common.user.service;

import java.util.List;

import com.liqiwei.soft.adminserver.common.user.model.SysUsers;

public interface UserService {

	List<SysUsers> selectByUserId (Integer userId);
	
	List<SysUsers> selectAllUser ();
	
	int deleteByUserId(Integer userId);
	
	int insert(SysUsers sysUsers);
	
	int updateByUserId(SysUsers sysUsers);
}
