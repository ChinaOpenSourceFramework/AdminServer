package com.liqiwei.soft.adminserver.common.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.user.dao.SysUsersMapper;
import com.liqiwei.soft.adminserver.common.user.model.SysUsers;
import com.liqiwei.soft.adminserver.common.user.service.UserService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private SysUsersMapper sysUsersMapper;

	@Override
	public SysUsers selectByUserId(Integer userId) {
		return this.sysUsersMapper.selectByUserId(userId);
	}

	@Override
	public int deleteByUserId(Integer userId) {
		return this.sysUsersMapper.deleteByUserId(userId);
	}

	@Override
	public int insert(SysUsers sysUsers) {
		sysUsers.setLocked(false);
		return this.sysUsersMapper.insert(sysUsers);
	}

	@Override
	public int updateByUserId(SysUsers sysUsers) {
		return this.sysUsersMapper.updateByUserId(sysUsers);
	}

	@Override
	public PageInfo<SysUsers> selectAllUser(SysUsers sysUsers,PageParamUtil pageParam) {
		  //分页查询
		PageHelper.startPage(pageParam.getPageNum(),pageParam.getPageSize());	
		List<SysUsers> sysUserList = this.sysUsersMapper.selectAllUser(sysUsers);
		return new PageInfo<SysUsers>(sysUserList);
	}
	
	
}
