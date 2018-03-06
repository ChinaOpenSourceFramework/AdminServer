package com.liqiwei.soft.adminserver.common.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.controller.BaseResponse;
import com.liqiwei.soft.adminserver.common.user.model.SysUsers;
import com.liqiwei.soft.adminserver.common.user.service.UserService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;
import com.liqiwei.soft.adminserver.common.util.PageViewUtil;

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
	public String userList(SysUsers sysUsers, Model model,PageParamUtil pageParam) {
		LOGGER.info("进入用户列表页");
		PageInfo<SysUsers> sysUsersListPage = this.userService.selectAllUser(sysUsers,pageParam);
		model.addAttribute("sysUsersListPage", sysUsersListPage);
		model.addAttribute("sysUsers", sysUsers);
		//设置分页参数
		PageViewUtil.setViewParam(model,sysUsersListPage);
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
		return BaseResponse.successJson();
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
		return BaseResponse.successJson();
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
		return BaseResponse.successJson();
	}
	/**
	 * 跳转用户角色设置界面
	 * @param sysUsers
	 * @return
	 */
	@RequestMapping(value="/setUserRolePage", method = RequestMethod.GET)
	public String setUserRolePage(Integer userId, Model model){
		model.addAttribute("userId", userId);
		model.addAttribute("myRoles", this.userService.findUserRolesByUserId(userId));
		return "common/user/setUserRole";
	}
	
	/**
	 * 保存用户和角色之间的关系
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/saveUserRole", method = RequestMethod.POST)
	public String saveUserRole(Integer userId,String roleIds){
		this.userService.saveUserRole(userId,roleIds);
		return BaseResponse.successJson();
	}
	
	
	/**
	 * 查看个人信息
	 * @return
	 */
	@RequestMapping(value="/showUserInfo", method = RequestMethod.GET)
	public String showUserInfo(){
		return "user";
	}
}
