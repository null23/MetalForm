package com.exskil.controller;

import com.exskil.po.User;
import com.exskil.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import util.MD5Util;

/**
 * Created by LENOVO on 2017/6/20.
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public String login()throws Exception{
        return "user/login";
    }

    @RequestMapping("beforeregist")
    public String beforeregist() throws Exception{
        return "user/reg";
    }

    @RequestMapping("regist")
    public String regist(User user) throws Exception{
        System.out.println(user.getName());
        System.out.println(user.getPassword());
//        String password = MD5Util.EncoderByMd5(user.getPassword());
//        user.setPassword(password);
        userService.addUser(user);
        return "user/login";
    }

}
