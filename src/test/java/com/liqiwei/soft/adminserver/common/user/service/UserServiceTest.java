package com.liqiwei.soft.adminserver.common.user.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.BaseTest;
import com.liqiwei.soft.adminserver.common.user.model.SysUsers;
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
}
