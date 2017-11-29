package com.exskil.interceptor;

import com.exskil.mapper.*;
import com.exskil.po.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by LENOVO on 2017/5/30.
 */
public class OperationInterceptor implements HandlerInterceptor {

//    @Autowired
//    private PermissionMapper permissionMapper;
//
//    @Autowired
//    private OperationMapper operationMapper;
//
//    @Autowired
//    private Permission_OperationMapper permission_operationMapper;
//
//    @Autowired
//    private User_RoleMapper user_roleMapper;
//
//    @Autowired
//    private Role_PermissionMapper role_permissionMapper;

    //返回值: true请求继续运行  false请求终止
    //Object:请求的控制器的实例,可以通过此实例获取要传递给控制器的一些数据
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
//        //获取当前url请求路径
//        String url = httpServletRequest.getRequestURI();
//
//        //根据Session获取当前用户操作v
//        HttpSession session = httpServletRequest.getSession();
//        if(session.getAttribute("operations") != null){
//            List<Operation> operations = (List<Operation>) session.getAttribute("operations");
//            for(Operation op:operations){
//                System.out.println("拦截url是:" + op.getUrl());
//            }
//            for(Operation op:operations){
//                if(url.contains(op.getUrl())){
//                    httpServletResponse.sendRedirect("../error/nopermission.action");
//                    return false;
//                }
//            }
//        }else{
//            //获取当前用户User
//            User user = null;
//            Subject subject= SecurityUtils.getSubject();
//            if(subject!=null){
//                user=(User) subject.getPrincipal();
//            }
//
//            if(user != null){
//                //获取当前user的User_Role集合
//                User_RoleExample user_roleExample = new User_RoleExample();
//                User_RoleExample.Criteria user_roleCirteria = user_roleExample.createCriteria();
//                user_roleCirteria.andUidEqualTo(user.getId());
//                List<User_Role> user_roles = user_roleMapper.selectByExample(user_roleExample);
//
//                List<Permission> permissions = new ArrayList<>();
//                //根据rid集合遍历
//                for(User_Role user_role:user_roles){
//                    int rid = user_role.getRid();
//                    Role_PermissionExample role_permissionExample = new Role_PermissionExample();
//                    Role_PermissionExample.Criteria role_permissionCriteria = role_permissionExample.createCriteria();
//                    role_permissionCriteria.andRidEqualTo(rid);
//                    List<Role_Permission> role_permissions = role_permissionMapper.selectByExample(role_permissionExample);
//
//                    //根据pid集合取得permissions
//                    for(Role_Permission role_permission:role_permissions){
//                        int pid = role_permission.getPid();
//                        //通过权限类型获取权限id，这里权限类型是操作，因此查询operation类型的pid
//                        Permission permission = permissionMapper.selectByPrimaryKey(pid);
//                        permissions.add(permission);
//                    }
//                }
//
//
//
//                //遍历Permission，获得Permission_Operation集合
//                List<Operation> operations = new ArrayList<>();
//                for(Permission p:permissions){
//                    int pid = p.getId();
//                    //查询操作id
//                    Permission_OperationExample permission_operationExample = new Permission_OperationExample();
//                    Permission_OperationExample.Criteria criteria = permission_operationExample.createCriteria();
//                    criteria.andPidEqualTo(pid);
//                    List<Permission_Operation> permission_operations = permission_operationMapper.selectByExample(permission_operationExample);
//
//                    //遍历Permission_Operation，获得Operation集合
//                    for(Permission_Operation permission_operation:permission_operations){
//                        int oid = permission_operation.getOid();
//
//                        Operation operation = operationMapper.selectByPrimaryKey(oid);
//                        operations.add(operation);
//                    }
//                }
//                session.setAttribute("operations",operations);
//            }
//        }
        return true;
    }

    //ModelAndView:控制视图的跳转，若不重新设置ViewName，则默认跳转至请求控制器对应的视图
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

//        HttpSession session = httpServletRequest.getSession();
//        //把菜单放入mv
//        if(session.getAttribute("menus") != null){
//            List<Menu> menus = (List<Menu>) session.getAttribute("menus");
//            modelAndView.addObject("menus",menus);
//        }
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}
