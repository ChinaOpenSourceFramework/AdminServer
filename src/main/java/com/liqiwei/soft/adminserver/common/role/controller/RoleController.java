package com.liqiwei.soft.adminserver.common.role.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.role.model.SysRoles;
import com.liqiwei.soft.adminserver.common.role.service.RoleService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;
import com.liqiwei.soft.adminserver.common.util.PageViewUtil;

@Controller
@RequestMapping(value="/common/role")
public class RoleController {

	private static final Logger LOGGER = LoggerFactory.getLogger(RoleController.class);
	
	@Autowired
	private RoleService roleService;
	
	/**
	 * 角色列表页
	 * @return
	 */
	@RequestMapping(value="/roleList", method = RequestMethod.GET)
	public String userList(SysRoles sysRoles, Model model,PageParamUtil pageParam) {
		LOGGER.info("进入角色列表页");
		PageInfo<SysRoles> sysRoleListPage = this.roleService.selectAllRole(sysRoles,pageParam);
		model.addAttribute("sysRoleListPage", sysRoleListPage);
		model.addAttribute("sysRoles", sysRoles);
		//设置分页参数
		PageViewUtil.setViewParam(model,sysRoleListPage);
		return "common/role/roleList";
	}
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping(value="/addRolePage", method = RequestMethod.GET)
	public String addRolePage(){		
		return "common/role/addRole";
	}
	
	/**
	 * 添加角色
	 * @param sysRoles
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addRole", method = RequestMethod.POST)
	public String addUser(SysRoles sysRoles){
		this.roleService.insert(sysRoles);
		return "success";
	}
	
	/**
	 * 跳转到修改页面
	 * @return
	 */
	@RequestMapping(value="/updateRolePage", method = RequestMethod.GET)
	public String updateRolePage(Integer roleId, Model model){
		SysRoles sysRoles = this.roleService.selectByRoleId(roleId);
		model.addAttribute("sysRoles",sysRoles);
		return "common/role/updateRole";
	}
	/**
	 * 修改角色
	 * @param sysRoles
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateRole", method = RequestMethod.POST)
	public String updateRole(SysRoles sysRoles){
		this.roleService.updateBySysRoleId(sysRoles);
		return "success";
	}
	/**
	 * 删除角色
	 * @param roleId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteRole", method = RequestMethod.POST)
	public String deleteRole(Integer roleId){
		this.roleService.deleteByRoleId(roleId);
		return "success";
	}
	
	/**
	 * 跳转角色权限设置界面
	 * @param sysUsers
	 * @return
	 */
	@RequestMapping(value="/setRoleResourcePage", method = RequestMethod.GET)
	public String setRoleResourcePage(Integer roleId, Model model){
		model.addAttribute("roleId", roleId);
		model.addAttribute("resourceTreeJson", this.roleService.findRoleResourceByRoleId(roleId));
		return "common/role/setRoleResource";
	}
	
	
	/**
	 * 保存角色和权限之间的关系
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/saveRoleResourceId", method = RequestMethod.POST)
	public String saveRoleResourceId(Integer roleId,String resourceIds){
		this.roleService.saveRoleResourceId(roleId,resourceIds);
		return "success";
	}
}
