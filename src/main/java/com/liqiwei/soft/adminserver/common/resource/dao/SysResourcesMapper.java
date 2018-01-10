package com.liqiwei.soft.adminserver.common.resource.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liqiwei.soft.adminserver.common.resource.model.SysResources;

@Mapper
public interface SysResourcesMapper {

	SysResources selectByResId(Integer resId);

	List<SysResources> selectAllResource (SysResources sysResources);
	
	int deleteByResId(Integer resId);

    int insert(SysResources sysResources);

    int updateByResId(SysResources sysResources);
    
    List<SysResources> selectMenuResourceByUserId (Integer userId);
}