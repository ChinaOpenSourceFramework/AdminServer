package com.liqiwei.soft.adminserver.common.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;
import org.springframework.stereotype.Component;

@Component
public class SimpleShiroFilter extends AuthorizationFilter {

	@Override
	protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue)
			throws Exception {

//        Subject subject = getSubject(request, response);
//        String[] perms = (String[]) mappedValue;
//        boolean isPermitted = true;
//        if (perms != null && perms.length > 0) {
//            if (perms.length == 1) {
//                if (!subject.isPermitted(perms[0])) {
//                    isPermitted = false;
//                }
//            } else {
//                if (!subject.isPermittedAll(perms)) {
//                    isPermitted = false;
//                }
//            }
//        }
//        

        Subject subject = getSubject(request, response);
        HttpServletRequest req = (HttpServletRequest) request;  
        String perm = req.getServletPath();
        
        boolean isPermitted = true;
        if (perm != null && (!subject.isPermitted(perm))) {
           isPermitted = false;
        }
        return isPermitted;
	}

}
