package com.liqiwei.soft.adminserver.common.resource.service.impl;

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
import com.liqiwei.soft.adminserver.common.resource.service.ResourceService;
import com.liqiwei.soft.adminserver.common.shiro.ShiroUser;
import com.liqiwei.soft.adminserver.common.util.CreateMenuUtil;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

@Service(value="resourceService")
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	private SysResourcesMapper sysResourcesMapper; 
	
	@Override
	public SysResources selectByResId(Integer resId) {
		return this.sysResourcesMapper.selectByResId(resId);
	}

	@Override
	public PageInfo<SysResources> selectAllResource(SysResources sysResources, PageParamUtil pageParam) {
		//分页查询
		PageHelper.startPage(pageParam.getPageNum(),pageParam.getPageSize());
		List<SysResources> sysResourceList = this.sysResourcesMapper.selectAllResource(sysResources);
		return new PageInfo<SysResources>(sysResourceList);
	}

	@Override
	public int deleteByResId(Integer resId) {
		return this.sysResourcesMapper.deleteByResId(resId);
	}

	@Override
	public int insert(SysResources sysResources) {
		sysResources.setLocked(false);
		return this.sysResourcesMapper.insert(sysResources);
	}

	@Override
	public int updateByResId(SysResources sysResources) {
		return this.sysResourcesMapper.updateByResId(sysResources);
	}

	@Override
	public String resourceTreeJson() {
		List<ResourceTreeModel> rtml = new ArrayList<>();
		List<SysResources> sysResourceList = this.sysResourcesMapper.selectAllResource(new SysResources());
		for (SysResources sysResources : sysResourceList) {
			ResourceTreeModel rtm = new ResourceTreeModel();
			rtm.setId(sysResources.getResId());
			rtm.setpId(sysResources.getpResId());
			rtm.setName(sysResources.getResName());
			rtml.add(rtm);
		}
		return JSON.toJSONString(rtml);
	}

	@Override
	public String SysMenuJson() {
		CreateMenuUtil cmu = new CreateMenuUtil(this.sysResourcesMapper.selectMenuResourceByUserId(ShiroUser.getUserId()));
		return cmu.initBaseHtml();
	}

}
