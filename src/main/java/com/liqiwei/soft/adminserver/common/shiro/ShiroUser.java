package com.liqiwei.soft.adminserver.common.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.liqiwei.soft.adminserver.common.user.model.SysUsers;

public class ShiroUser {
	
	public static SysUsers getUser(){
        Subject subject= SecurityUtils.getSubject();
        if(subject==null)
            return null;
        return (SysUsers) subject.getPrincipal();
    }
	
	public static Integer getUserId(){
		return getUser().getUserId();
	}
}
