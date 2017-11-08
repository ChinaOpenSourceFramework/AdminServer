package com.liqiwei.soft.adminserver.common.user.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.liqiwei.soft.adminserver.BaseTest;
import com.liqiwei.soft.adminserver.common.user.model.SysUsers;

public class SysUsersMapperTest extends BaseTest{

	@Autowired
	private SysUsersMapper sysUsersMapper;
	
	@Test
	public void testSelectByUserId() {
		this.sysUsersMapper.selectByUserId(3);
	}

	@Test
	public void testDeleteByUserId() {
	}

	@Test
	public void testInsert() {
		SysUsers sysUsers = new SysUsers();
		sysUsers.setDepartId(1);
		sysUsers.setLocked(false);
		sysUsers.setPassword("111111111111111");
		sysUsers.setRealName("eeeeeeeeeee");
		sysUsers.setSalt("salt");
		sysUsers.setUserEmail("123@qq.com");
		sysUsers.setUserName("eeee");
		sysUsers.setUserPhone("111111111111");
		sysUsers.setUserPhoto("dddddddd");
		sysUsers.setUserQq("222222222222");
		this.sysUsersMapper.insert(sysUsers);
	}

	@Test
	public void testUpdateByUserId() {
	}

}
