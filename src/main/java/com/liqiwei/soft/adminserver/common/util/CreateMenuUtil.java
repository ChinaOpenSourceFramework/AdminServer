package com.liqiwei.soft.adminserver.common.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liqiwei.soft.adminserver.common.resource.model.SysResources;

public class CreateMenuUtil {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(CreateMenuUtil.class);
	
	private static int ROOTID = 1;

	 StringBuffer sb = new StringBuffer();

	 List<SysResources> resList ;
	 List<SysResources> resList0 ;
	 List<SysResources> resList1 ;
	 List<SysResources> resList2 ;

	public CreateMenuUtil(List<SysResources> resList) {
		this.resList = resList;
	}
	
	public String initBaseHtml(){
		LOGGER.debug("------------------------------ 开始生成页面   ------------------------------");
		sb.append("<ul class=\"sidebar-nav-level0\">");
		
		//先按pid 后按sort
		Collections.sort(resList, new Comparator<SysResources>() {

			@Override
			public int compare(SysResources arg0, SysResources arg1) {
				if(arg0 == null || arg1 == null || arg0.getResSort() == null || arg1.getResSort() == null){
					return 1;
				}
				int level = arg0.getResLevel()-arg1.getResLevel();
				if(level == 0){
					return arg0.getResSort()-arg1.getResSort();
				}
				return level;
			}
		});
		
		resList0 = new  ArrayList<SysResources>();
		for (SysResources sysResources : resList) {
			if(sysResources.getpResId() == ROOTID){
				resList0.add(sysResources);
			}
		}
		createFirstHtml();
		sb.append("</ul>");
		LOGGER.debug("------------------------------ 生成页面结束   ------------------------------");
		LOGGER.debug("页面数据 {}",sb.toString());
		return sb.toString();
	}
	
	void createFirstHtml(){
		for (SysResources sysResources0 : resList0) {
			int resId  = sysResources0.getResId();
			sb.append(resourceLi(sysResources0,1));
			//添加第二次数据
			resList1 = new  ArrayList<SysResources>();
			for (SysResources sysResources1: resList) {
				if(sysResources1.getpResId() == resId){
					resList1.add(sysResources1);
				}
			}
			if(!resList1.isEmpty()){
				createTwoHtml();
			}
			sb.append("</li>");
		}
	}
	
	
	void createTwoHtml(){
		sb.append("<ul class=\"sidebar-nav-level2\">");
		for (SysResources sysResources1 : resList1) {
			sb.append(resourceLi(sysResources1,3));
			//添加第三次数据
			int resId1  = sysResources1.getResId();
			resList2 = new  ArrayList<SysResources>();
			for (SysResources sysResources2 : resList) {
				if(sysResources2.getpResId() == resId1){
					resList2.add(sysResources2);
				}
			}
			if(!resList2.isEmpty()){
				createThreeHtml();
			}
			sb.append("</li>");
		}
		sb.append("</ul>");
	}
	
	void createThreeHtml(){
		sb.append("<ul class=\"sidebar-nav-level4\">");
		for(SysResources sysResources2 :resList2){
			sb.append(resourceLi(sysResources2,5));
		}
		sb.append("</ul>");
	}
	
	StringBuffer resourceLi(SysResources sr ,int cssNumber){
		StringBuffer sbl = new StringBuffer();
		sbl.append("<li class=\"sidebar-nav-level").append(cssNumber).append("\">");
		
		if(sr.getResValue()==null || sr.getResValue().length()==0 || sr.getResValue().equals("#")){
			sbl.append("<a href=\"").append("#\">");
		} else {
			sbl.append("<a href=\"javascript:ajaxContent('").append(sr.getResValue()).append("')\">");
		}
		
		if(sr.getResIcon() == null || sr.getResIcon().length() == 0){
			sbl.append("<i class=\"fa fa-user-cogs\"></i>");
		}else {
			sbl.append("<i class=\"").append(sr.getResIcon()).append("\"></i>");
		}
		
		sbl.append("<span>").append(sr.getResName()).append("</span>");
		sbl.append("</a>");
		
		if(cssNumber == 5){
			sbl.append("</li>");
		}
		
		return sbl;
	}
}
