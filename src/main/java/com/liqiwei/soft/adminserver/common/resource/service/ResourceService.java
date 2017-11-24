package com.liqiwei.soft.adminserver.common.resource.service;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.resource.model.SysResources;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;

public interface ResourceService {
	
	SysResources selectByResId(Integer resId);
	
	PageInfo<SysResources> selectAllResource (SysResources sysResources,PageParamUtil pageParam);
	
	int deleteByResId(Integer resId);

    int insert(SysResources sysResources);

    int updateByResId(SysResources sysResources);
    
    String resourceTreeJson();
    
    String SysMenuJson();
}
