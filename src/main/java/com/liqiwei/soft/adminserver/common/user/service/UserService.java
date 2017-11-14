package com.liqiwei.soft.adminserver.common.user.service;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.user.model.SysUsers;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

public interface UserService {

	SysUsers selectByUserId (Integer userId);
	
	PageInfo<SysUsers> selectAllUser (SysUsers sysUsers,PageParamUtil pageParam);
	
	int deleteByUserId(Integer userId);
	
	int insert(SysUsers sysUsers);
	
	int updateByUserId(SysUsers sysUsers);
}
