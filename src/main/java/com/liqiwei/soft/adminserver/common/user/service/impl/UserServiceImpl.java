package com.liqiwei.soft.adminserver.common.user.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.role.model.SysRoles;
import com.liqiwei.soft.adminserver.common.role.service.RoleService;
import com.liqiwei.soft.adminserver.common.user.dao.SysUsersMapper;
import com.liqiwei.soft.adminserver.common.user.model.SysUsers;
import com.liqiwei.soft.adminserver.common.user.model.UserRolePage;
import com.liqiwei.soft.adminserver.common.user.service.UserService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

@Service(value="userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private SysUsersMapper sysUsersMapper;
	
	@Autowired
	private RoleService roleService;

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

	@Override
	public List<UserRolePage> findUserRolesByUserId(Integer userId) {
		List<UserRolePage> userRoleList = new ArrayList<UserRolePage>();
		//定义返回
		UserRolePage userRolePage ;
		//查找所有role
		List<SysRoles> roles = roleService.selectAllRoleList(null);
		//查找用户role
		List<Integer> myRole = this.sysUsersMapper.findUserRolesByUserId(userId);
		
		for (SysRoles sysRole : roles) {
			 userRolePage = new UserRolePage();
			 userRolePage.setRoleId(sysRole.getRoleId());
			 userRolePage.setRoleName(sysRole.getRoleName());
			 //如果包含就说明已经有权限了
			 userRolePage.setOwn(myRole.contains(sysRole.getRoleId()));
			 userRoleList.add(userRolePage);
		}
		return userRoleList;
	}

	@Override
	public void saveUserRole(Integer userId, String roleIds) {
		//先删除用户和角色关系
		this.sysUsersMapper.deleteUserRoleByUserId(userId);
		//如果是空或是,则不添加
		if(!(roleIds.trim().isEmpty() || roleIds.trim().equals(","))){
			String[] roleList = roleIds.split(",");
			//添加用户和角色关系
			this.sysUsersMapper.addUserRole(userId,roleList);
		}
	}
	
	
}
