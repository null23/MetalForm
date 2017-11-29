package com.exskil.controller;

import com.exskil.po.Role;
import com.exskil.po.User;
import com.exskil.po.User_Role;
import com.exskil.service.PermissionService;
import com.exskil.service.RoleService;
import com.exskil.service.UserService;
import com.exskil.service.User_RoleService;
import com.exskil.shiro.CustomRealm;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by LENOVO on 2017/5/31.
 */
@Controller
@RequestMapping("permission")
public class PermissionController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @Autowired
    private User_RoleService user_roleService;

    @Autowired
    private CustomRealm customRealm;

    @RequiresPermissions("permission")
    @RequestMapping("listpermission")
    public String listPermission(){
        return "permission/listpermission";
    }

    @RequiresPermissions("permission")
    @RequestMapping("before_addpermission")
    public ModelAndView before_addpermission(){
        ModelAndView mv = new ModelAndView();
        List<Role> roles = roleService.listRoles();
        mv.addObject("rolelist",roles);
        mv.setViewName("permission/addpermission");

        return mv;
    }

    @RequiresPermissions("permission")
    @RequestMapping(value="addpermission",method = RequestMethod.POST)
    public String addpermission(String username, Integer roleID, ServletResponse response) throws Exception {
        System.out.println("addpermission");
        System.out.println("findUserByLoginName:" + userService.findUserByLoginName(username));
        User user = userService.findUserByLoginName(username);
        if( user == null){
//            return "permission/before_addpermission";
            Map map = new HashMap();
            map.put("data","usererror");
            JSONObject jsonObject = JSONObject.fromObject(map);

//            return jsonObject.toString();
            response.getWriter().write(jsonObject.toString());
            return "showpermission.action";
        }else{
            User_Role user_role = new User_Role();
            user_role.setRid(roleID);
            user_role.setUid(user.getId());
            user_roleService.addUser_Role(user_role);

            //修改权限之后清除缓存
            customRealm.clearCached();
//            return "permission/listpermission";

            Map map = new HashMap();
            map.put("data","success");
            JSONObject jsonObject = JSONObject.fromObject(map);
//            return jsonObject.toString();
            response.getWriter().write(jsonObject.toString());
            return "redirect:showpermission.action";
        }
    }

    @RequiresPermissions("permission")
    @RequestMapping("showpermission")
    public ModelAndView showpermission(){
        ModelAndView mv = new ModelAndView();
        List<User_Role> user_roles = user_roleService.listUser_Role();
        List<User> users = new ArrayList<User>();
        for(User_Role user_role:user_roles){
            int uid = user_role.getUid();
            int rid = user_role.getRid();
            User user = userService.getUserByID(uid);
            Role role = roleService.getRoleByID(rid);

            user.setRole(role);
            users.add(user);
        }
        mv.addObject("users",users);
        mv.setViewName("permission/showpermission");
        return mv;
    }
}
