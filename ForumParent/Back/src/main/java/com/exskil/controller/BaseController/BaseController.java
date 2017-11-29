package com.exskil.controller.BaseController;

import com.exskil.po.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

/**
 * Created by LENOVO on 2017/5/10.
 */
public class BaseController {
    public User getCurrentUser(){
        Subject subject= SecurityUtils.getSubject();
        if(subject!=null){
            User user=(User) subject.getPrincipal();
            return user;
        }
        return null;
    }
}
