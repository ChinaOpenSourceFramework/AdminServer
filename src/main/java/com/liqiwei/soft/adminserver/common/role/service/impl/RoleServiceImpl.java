package com.liqiwei.soft.adminserver.common.role.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.resource.dao.SysResourcesMapper;
import com.liqiwei.soft.adminserver.common.resource.model.ResourceTreeModel;
import com.liqiwei.soft.adminserver.common.resource.model.SysResources;
import com.liqiwei.soft.adminserver.common.role.dao.SysRolesMapper;
import com.liqiwei.soft.adminserver.common.role.model.SysRoles;
import com.liqiwei.soft.adminserver.common.role.service.RoleService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

@Service(value="roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private SysRolesMapper sysRolesMapper;
	@Autowired
	private SysResourcesMapper sysResourcesMapper;
	
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

	@Override
	public String findRoleResourceByRoleId(Integer roleId) {
		List<ResourceTreeModel> rtml = new ArrayList<>();
		List<SysResources> sysResourceList = this.sysResourcesMapper.selectAllResource(new SysResources());
		//查找角色权限
		List<Integer> roleResources =this.sysRolesMapper.findRoleResourcesByRoleId(roleId);
		for (SysResources sysResources : sysResourceList) {
			ResourceTreeModel rtm = new ResourceTreeModel();
			rtm.setId(sysResources.getResId());
			rtm.setpId(sysResources.getpResId());
			rtm.setName(sysResources.getResName());
			rtm.setChecked(roleResources.contains(sysResources.getResId()));
			rtml.add(rtm);
		}
		return JSON.toJSONString(rtml);
	}

	@Override
	public void saveRoleResourceId(Integer roleId, String resourceIds) {
		//先删除角色和权限之间关系
		this.sysRolesMapper.deleteRoleResourceByRoleId(roleId);
		//如果是空或是,则不添加
		if(!(resourceIds.trim().isEmpty() || resourceIds.trim().equals(","))){
			String[] resourceList = resourceIds.split(",");
			//添加角色和权限之间关系
			this.sysRolesMapper.addRoleResource(roleId,resourceList);
		}
	}

}
