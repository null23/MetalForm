package com.exskil.service.impl;

import com.exskil.mapper.MenuMapper;
import com.exskil.mapper.Permission_MenuMapper;
import com.exskil.mapper.Role_PermissionMapper;
import com.exskil.mapper.User_RoleMapper;
import com.exskil.po.*;
import com.exskil.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by LENOVO on 2017/5/29.
 */
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private User_RoleMapper user_roleMapper;

    @Autowired
    private Role_PermissionMapper role_permissionMapper;

    @Autowired
    private Permission_MenuMapper permission_menuMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> getMenu(User user) {
        List<Menu> menuList = new ArrayList<Menu>();

        //查询roleid集合
        User_RoleExample user_roleExample = new User_RoleExample();
        User_RoleExample.Criteria user_roleExampleCriteria = user_roleExample.createCriteria();
        user_roleExampleCriteria.andUidEqualTo(user.getId());
//        User_Role user_role = user_roleMapper.selectByExample(user_roleExample).get(0);
        List<User_Role> user_roles = user_roleMapper.selectByExample(user_roleExample);

        //遍历rid集合，查询pid集合
        for(User_Role ur:user_roles){
            int rid = ur.getRid();
            //查询权限id
            Role_PermissionExample role_permissionExample = new Role_PermissionExample();
            Role_PermissionExample.Criteria role_permissionExampleCriteria = role_permissionExample.createCriteria();
            role_permissionExampleCriteria.andRidEqualTo(rid);
//            Role_Permission role_permission = role_permissionMapper.selectByExample(role_permissionExample).get(0);
            List<Role_Permission> role_permissions =  role_permissionMapper.selectByExample(role_permissionExample);
            for(Role_Permission rp:role_permissions){
                int pid = rp.getPid();
                //查询菜单id
                Permission_MenuExample permission_menuExample = new Permission_MenuExample();
                Permission_MenuExample.Criteria permission_menuExampleCriteria = permission_menuExample.createCriteria();
                permission_menuExampleCriteria.andPidEqualTo(pid);
                List<Permission_Menu> permission_menus = permission_menuMapper.selectByExample(permission_menuExample);

                //遍历取得menuID
                for(Permission_Menu pm:permission_menus){
                    //查询主菜单
                    int menuID = pm.getMid();
                    Menu menu = menuMapper.selectByPrimaryKey(menuID);

                    //根据主菜单查询子菜单
                    MenuExample menuExample = new MenuExample();
                    MenuExample.Criteria menuCirteria = menuExample.createCriteria();
                    menuCirteria.andParentidEqualTo(menuID);
                    List<Menu> subMenus = menuMapper.selectByExample(menuExample);

                    //将子菜单装入父菜单
                    menu.setMenuList(subMenus);
                    //将父菜单添加至集合
                    menuList.add(menu);
                }
            }
        }
//        int rid = user_role.getRid();
        return menuList;
    }
}
