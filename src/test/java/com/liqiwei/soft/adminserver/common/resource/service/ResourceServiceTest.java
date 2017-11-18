package com.liqiwei.soft.adminserver.common.resource.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.liqiwei.soft.adminserver.BaseTest;
import com.liqiwei.soft.adminserver.common.resource.dao.SysResourcesMapper;
import com.liqiwei.soft.adminserver.common.util.CreateMenuUtil;

public class ResourceServiceTest  extends BaseTest{

	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private SysResourcesMapper sysResourcesMapper;
	
	@Test
	public void testResourceTreeJson() {
		System.out.println(this.resourceService.resourceTreeJson());
	}

	
	@Test
	public void testCreateMenuUtil() {
		CreateMenuUtil cmu = new CreateMenuUtil(this.sysResourcesMapper.selectAllResource(null));
		String result = cmu.initBaseHtml();
		System.out.println(result);
	}
	
}


