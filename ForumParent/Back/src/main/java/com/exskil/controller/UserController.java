package com.exskil.controller;

import com.exskil.po.Gag;
import com.exskil.po.User;
import com.exskil.service.GagService;
import com.exskil.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by LENOVO on 2017/5/10.
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private GagService gagService;

    @RequestMapping("login")
    public String login()throws Exception{
        return "user/login";
    }

    @RequestMapping("beforeregist")
    public String beforeregist() throws Exception{
        return "user/regist";
    }

    @RequestMapping("regist")
    public String regist(User user) throws Exception{
        userService.addUser(user);
        return "user/login";
    }

    @RequiresPermissions("user")
    @RequestMapping("v")
    public ModelAndView listuser(@RequestParam(value="pageNum",required=false, defaultValue="1")Integer pageNum){
        ModelAndView mv = new ModelAndView();
        PageHelper.startPage(pageNum, 10);
        List<User> list = userService.listUser();
        PageInfo<User> pagehelper = new PageInfo<User>(list);

        mv.addObject("pagehelper",pagehelper);
        mv.setViewName("user/list");
        return mv;
    }

    @RequiresPermissions("user")
    @RequestMapping("addgag")
    public String addgag(Integer uid){
        Gag gag = new Gag();
        gag.setUserID(uid);
        gagService.insert(gag);
        return "redirect:listgag.action";
    }

    @RequiresPermissions("user")
    @RequestMapping("listgag")
    public ModelAndView listgag(@RequestParam(value="pageNum",required=false, defaultValue="1")Integer pageNum){
        PageHelper.startPage(pageNum, 10);
        ModelAndView mv = new ModelAndView();

        List<Gag> list = gagService.listGag();
        PageInfo<Gag> pagehelper = new PageInfo<Gag>(list);
        mv.addObject("pagehelper", pagehelper);
        mv.setViewName("user/gaglist");

        return mv;
    }

    @RequiresPermissions("user")
    @RequestMapping("updategag")
    public String updategag(Integer gid){
        gagService.updateGagByUser(gid);

        return "redirect:listgag.action";
    }
}