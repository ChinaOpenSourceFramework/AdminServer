package com.liqiwei.soft.adminserver.common.user.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.liqiwei.soft.adminserver.BaseTest;

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

}
