package com.liqiwei.soft.adminserver.common.user.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.BaseTest;
import com.liqiwei.soft.adminserver.common.user.model.SysUsers;
import com.liqiwei.soft.adminserver.common.user.model.UserRolePage;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

public class UserServiceTest extends BaseTest{

	@Autowired
	private UserService userService;
	
	@Test
	public void testSelectByUserId() {
		this.userService.selectByUserId(1);
	}

	@Test
	public void testDeleteByUserId() {
	}

	@Test
	public void testInsert() {
	}

	@Test
	public void testUpdateByUserId() {
	}

	@Test
	public void testSelectAllUser(){
		SysUsers sysUsers = new SysUsers();
//		sysUsers.setUserId(3);
		sysUsers.setUserName("");
		PageParamUtil pageParam = new PageParamUtil();
		PageInfo<SysUsers> p = this.userService.selectAllUser(sysUsers,pageParam);
		List<SysUsers> s = p.getList();
		for (SysUsers sysUsers2 : s) {
			System.out.println(sysUsers2.getUserName());
		}
		System.out.println(s.size());
	}
	
	@Test
	public void testFindUserRolesByUserId(){
	List<UserRolePage> a = 	userService.findUserRolesByUserId(3);
	System.out.println(a.size());
	}
	
	@Test
	public void testSaveUserRole(){
		Integer userId = 3;
		String roleIds = "1,2,3,";

		//如果是空或是,则不添加
		if(!(roleIds.trim().isEmpty() || roleIds.trim().equals(","))){
			String[] roleList = roleIds.split(",");
			System.out.println(roleList.length);
			userService.saveUserRole(userId, roleIds);
		}
		
	}
}
