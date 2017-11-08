package com.liqiwei.soft.adminserver.common.user.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liqiwei.soft.adminserver.common.user.model.SysUsers;
import com.liqiwei.soft.adminserver.common.user.service.UserService;

@Controller
@RequestMapping(value="/common/user")
public class UserController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	/**
	 * 用户列表页
	 * @return
	 */
	@RequestMapping(value="/userList", method = RequestMethod.GET)
	public String userList(Locale locale, Model model) {
		LOGGER.info("进入用户列表页");
		List<SysUsers> sysUsersList = this.userService.selectAllUser();
		model.addAttribute("sysUsersList", sysUsersList);
		LOGGER.info("用户列表页返回结果");
		return "common/user/userList";
	}
	
	
	
}
