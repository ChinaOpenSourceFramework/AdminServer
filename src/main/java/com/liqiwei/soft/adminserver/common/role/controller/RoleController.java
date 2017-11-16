package com.liqiwei.soft.adminserver.common.role.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	
	
}
