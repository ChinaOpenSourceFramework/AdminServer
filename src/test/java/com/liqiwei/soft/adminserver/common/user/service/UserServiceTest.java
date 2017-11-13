package com.liqiwei.soft.adminserver.common.user.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.liqiwei.soft.adminserver.BaseTest;
import com.liqiwei.soft.adminserver.common.user.model.SysUsers;

public class UserServiceTest extends BaseTest{

	@Autowired
	private UserService userService;
	
	@Test
	public void testSelectByUserId() {
		System.out.println("aaaaaaaaaaa");
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
		sysUsers.setUserId(3);
		sysUsers.setUserName("");
		List<SysUsers> abc = this.userService.selectAllUser(sysUsers);
		System.out.println(abc.size());
	}
}
