package com.exskil.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 
 * <p>Title: CustomFormAuthenticationFilter</p>
 * <p>Description:自定义FormAuthenticationFilter，认证之前实现 验证码校验 </p>
 * <p>Company: www.itcast.com</p> 
 * @author	传智.燕青
 * @date	2015-3-25下午4:53:15
 * @version 1.0
 */
public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {

	//原FormAuthenticationFilter的认证方法
	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {


		return super.onAccessDenied(request, response);
	}
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token,
                                     Subject subject, ServletRequest request, ServletResponse response)
					throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write("success");
		return false;
	}

	@Override
	protected boolean onLoginFailure(AuthenticationToken token,
                                     AuthenticationException e, ServletRequest request,
                                     ServletResponse response) {
		try {
			String message = e.getClass().getSimpleName();
			if ("IncorrectCredentialsException".equals(message)) {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("pwderror");
			} else if ("UnknownAccountException".equals(message)) {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("usererror");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("unknowerror");
			}
		} catch (Exception e2) {
			e.printStackTrace();
		}
		return false;
	}
}
