package com.liqiwei.soft.adminserver.common.shiro.realm;

import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.liqiwei.soft.adminserver.common.user.model.SysUsers;
import com.liqiwei.soft.adminserver.common.user.service.UserService;

public class UserRealm extends AuthorizingRealm {
	
	@Autowired
	private UserService userService;
	
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		SysUsers user = (SysUsers) principalCollection.getPrimaryPrincipal() ;
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo() ;
        Set<String> roles = this.userService.findRolesByUsername(user.getUserName()) ;
        Set<String> permissions = this.userService.findPermissionsByUsername(user.getUserName()) ;
        authorizationInfo.addRoles(roles);
        /**
         * 登录成功添加  / 权限
         * 去除数据库中 空字符串  # 字符串
         * 在权限字符串前面添加 "/" 兼容验证
         */
        authorizationInfo.addStringPermission("/");
        for (String p : permissions) {
			if(p.trim().isEmpty()||p.equals("#"))continue;
			authorizationInfo.addStringPermission("/"+p);
		}
		return authorizationInfo;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		//获取用户账号
        String username = token.getPrincipal().toString();
        SysUsers user = this.userService.findUserByUsername(username);
        if(user == null) {
            throw new UnknownAccountException();//没找到帐号
        }
      //将查询到的用户账号和密码存放到 authenticationInfo用于后面的权限判断。第三个参数传入realName。
        AuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user, //用户名
                user.getPassword(),
                ByteSource.Util.bytes(user.getCredentialsSalt()),//salt=username+salt
                getName()  //realm name
                );
        return authenticationInfo ;
	}

}
