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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping(value="/addUserPage", method = RequestMethod.GET)
	public String addUserPage(){
		return "common/user/addUser";
	}
	
	/**
	 * 添加用户
	 * @param sysUsers
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addUser", method = RequestMethod.POST)
	public String addUser(SysUsers sysUsers){
		this.userService.insert(sysUsers);
		return "success";
	}
	
	/**
	 * 跳转到修改页面
	 * @return
	 */
	@RequestMapping(value="/updateUserPage", method = RequestMethod.GET)
	public String updateUserPage(Integer userId, Model model){
		SysUsers sysUsers = this.userService.selectByUserId(userId);
		model.addAttribute("sysUsers",sysUsers);
		return "common/user/updateUser";
	}
	/**
	 * 修改用户
	 * @param sysUsers
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateUser", method = RequestMethod.POST)
	public String updateUser(SysUsers sysUsers){
		this.userService.updateByUserId(sysUsers);
		return "success";
	}
	/**
	 * 删除用户
	 * @param userId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteUser", method = RequestMethod.POST)
	public String deleteUser(Integer userId){
		this.userService.deleteByUserId(userId);
		return "success";
	}
}
