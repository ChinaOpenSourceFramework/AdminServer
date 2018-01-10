package com.liqiwei.soft.adminserver.common.login;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Locale;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.liqiwei.soft.adminserver.common.resource.service.ResourceService;
import com.liqiwei.soft.adminserver.common.shiro.ShiroUser;
import com.liqiwei.soft.adminserver.common.util.ValidateCode;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private ResourceService resourceService; 
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("sysMenuJson", this.resourceService.SysMenuJson());
		model.addAttribute("user", ShiroUser.getUser());
		return "home";
	}
	
	@RequestMapping(value = "/unauth", method = RequestMethod.GET)
	public String unauth() {
		return "unauth";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/*", method = RequestMethod.GET)
	public String patternUrl() {
		Subject user = SecurityUtils.getSubject();
		if(user.isAuthenticated()){
			return "redirect:/";
		}else{
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = "/redirecturl" , method = RequestMethod.GET)
	public String redirectUrl(@RequestParam String url){
		System.out.println("Redirect Url "+url);
		return url;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String logindata(HttpServletRequest request,String loginName ,String password ,String validateCode , Model model) {
		String sessionValidateCode = (String) request.getSession().getAttribute("validateCode");
		if(!validateCode.equals(sessionValidateCode)) {
			return "redirect:/login";
		}
		
		Subject user = SecurityUtils.getSubject();
	    UsernamePasswordToken token = new UsernamePasswordToken(loginName,password);
        try
        {
            // 会调用 shiroDbRealm 的认证方法
            user.login(token);
            model.addAttribute("user",SecurityUtils.getSubject());
        }
        catch (Exception e)
        {
            logger.error(e.getMessage(), e);
            return "redirect:/login";
        }
		return "redirect:/";
	}
	
	/** 
    * user logout
    */  
    @RequestMapping(value="/logout",method=RequestMethod.GET)  
    public String logout(){  
         SecurityUtils.getSubject().logout();  
         return "redirect:/login";  
    }  

    
    /**
     * 生成验证码
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/validateCode",method=RequestMethod.GET)
    public void validateCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setHeader("Cache-Control", "no-cache");
        String verifyCode = ValidateCode.generateTextCode(ValidateCode.TYPE_NUM_ONLY, 4, null);
        request.getSession().setAttribute("validateCode", verifyCode);
        response.setContentType("image/jpeg");
        BufferedImage bim = ValidateCode.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);
        ImageIO.write(bim, "JPEG", response.getOutputStream());
    }
}
