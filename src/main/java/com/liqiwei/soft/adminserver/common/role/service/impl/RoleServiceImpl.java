package com.liqiwei.soft.adminserver.common.role.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.role.dao.SysRolesMapper;
import com.liqiwei.soft.adminserver.common.role.model.SysRoles;
import com.liqiwei.soft.adminserver.common.role.service.RoleService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

@Service(value="roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private SysRolesMapper sysRolesMapper;
	
	@Override
	public SysRoles selectByRoleId(Integer roleId) {
		return this.sysRolesMapper.selectByRoleId(roleId);
	}

	@Override
	public PageInfo<SysRoles> selectAllRole(SysRoles sysRoles,PageParamUtil pageParam) {
		//分页查询
		PageHelper.startPage(pageParam.getPageNum(),pageParam.getPageSize());	
		List<SysRoles> sysRoleList = this.sysRolesMapper.selectAllRole(sysRoles);
		return new PageInfo<SysRoles>(sysRoleList);
	}

	@Override
	public int deleteByRoleId(Integer roleId) {
		return this.sysRolesMapper.deleteByRoleId(roleId);
	}

	@Override
	public int insert(SysRoles sysRoles) {
		sysRoles.setLocked(false);
		return this.sysRolesMapper.insert(sysRoles);
	}

	@Override
	public int updateBySysRoleId(SysRoles sysRoles) {
		return this.sysRolesMapper.updateBySysRoleId(sysRoles);
	}

	@Override
	public List<SysRoles> selectAllRoleList(SysRoles sysRoles) {
		return  this.sysRolesMapper.selectAllRole(sysRoles);
	}

}
