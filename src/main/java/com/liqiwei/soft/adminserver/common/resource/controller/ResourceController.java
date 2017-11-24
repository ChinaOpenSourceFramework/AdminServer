package com.liqiwei.soft.adminserver.common.resource.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.liqiwei.soft.adminserver.common.resource.model.SysResources;
import com.liqiwei.soft.adminserver.common.resource.service.ResourceService;
import com.liqiwei.soft.adminserver.common.util.PageParamUtil;
import com.liqiwei.soft.adminserver.common.util.PageViewUtil;

@Controller
@RequestMapping(value="/common/resource")
public class ResourceController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ResourceController.class);
	
	@Autowired
	private ResourceService resourceService; 
	
	/**
	 * 资源列表页
	 * @return
	 */
	@RequestMapping(value="/resourceList", method = RequestMethod.GET)
	public String resourceList(SysResources sysResources, Model model,PageParamUtil pageParam) {
		LOGGER.info("进入角色列表页");
		PageInfo<SysResources> sysResourcesListPage = this.resourceService.selectAllResource(sysResources, pageParam);
		model.addAttribute("sysResourcesListPage", sysResourcesListPage);
		model.addAttribute("sysResources", sysResources);
		model.addAttribute("resourceTreeJson", this.resourceService.resourceTreeJson());
		//设置分页参数
		PageViewUtil.setViewParam(model,sysResourcesListPage);
		return "common/resource/resourceList";
	}
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	@RequestMapping(value="/addResourcesPage", method = RequestMethod.GET)
	public String addResourcesPage(){		
		return "common/resource/addResource";
	}
	

	/**
	 * 添加资源
	 * @param sysResources
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/addResources", method = RequestMethod.POST)
	public String addResources(SysResources sysResources){
		this.resourceService.insert(sysResources);
		return "success";
	}
	
	/**
	 * 跳转到修改页面
	 * @return
	 */
	@RequestMapping(value="/updateResourcesPage", method = RequestMethod.GET)
	public String updateResourcesPage(Integer resId, Model model){
		SysResources sysResources = this.resourceService.selectByResId(resId);
		model.addAttribute("sysResources",sysResources);
		return "common/resource/updateResource";
	}
	
	/**
	 * 修改资源
	 * @param sysResources
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateResources", method = RequestMethod.POST)
	public String updateResources(SysResources sysResources){
		this.resourceService.updateByResId(sysResources);
		return "success";
	}
	/**
	 * 删除角色
	 * @param resId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deleteResources", method = RequestMethod.POST)
	public String deleteResources(Integer resId){
		this.resourceService.deleteByResId(resId);
		return "success";
	}
	
	
}
