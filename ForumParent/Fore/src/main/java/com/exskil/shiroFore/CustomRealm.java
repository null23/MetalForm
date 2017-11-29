package com.exskil.shiroFore;

import com.exskil.po.Operation;
import com.exskil.po.User;
import com.exskil.service.PermissionService;
import com.exskil.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class CustomRealm extends AuthorizingRealm {

	@Autowired
	private UserService userService;

	@Autowired
	private PermissionService permissionService;

	// 设置realm的名称
	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}

	//realm的认证方法，从数据库查询用户信息
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		System.out.println("认证");
		/**
		 * 		AuthenticationToken接口只有两个方法：getPrincipal()和getCredentials()
		 * 		UsernamePasswordToken是其实现类
		 */

		//手动输入token的用户信息
//		UsernamePasswordToken upToken = new UsernamePasswordToken();
//		upToken.setUsername("");
//		upToken.setPassword(new char[0]);
//		upToken.getPrincipal();

		//第一步，从token中取出用户信息(shiro拦截器自动写入用户信息)
		String userCode = (String) token.getPrincipal();
		User user=null;
		try {
			user=userService.findUserByLoginName(userCode);
			if(user==null){
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String password=user.getPassword();

		//this.getName()用来获取realm的名称
		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(user,
				password, this.getName());
		return simpleAuthenticationInfo;
	}

	// 用于授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		//获取当前认证通过之后的用户
		User user = (User) principals.getPrimaryPrincipal();

		//String集合类型的权限列表
		List<String> pmList = new ArrayList<String>();

		List<Operation> operations = permissionService.listOperations(user);
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		for(Operation op:operations){
			System.out.println("权限名称：" + op.getUrl());
			pmList.add(op.getUrl());
		}

		simpleAuthorizationInfo.addStringPermissions(pmList);
		return simpleAuthorizationInfo;
	}

	//清除缓存
	public void clearCached() {
		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
		super.clearCache(principals);
	}
}
