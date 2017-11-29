package com.exskil.controller;

import com.exskil.po.Top;
import com.exskil.service.TopService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by LENOVO on 2017/6/21.
 */
//@Controller
//@RequestMapping("top")
//public class TopController {
//    @Autowired
//    private TopService topService;
//
//    @RequiresPermissions("post")
//    @RequestMapping("listtoppost")
//    private ModelAndView listtoppost(){
//        System.out.println("进入" + topService);
//        ModelAndView mv = new ModelAndView();
//        List<Top> topPosts = topService.listTopPost();
//        System.out.println("topPosts: " + topPosts.size());
//        mv.addObject("topPosts",topPosts);
//        mv.setViewName("top/listtoppost");
//        return mv;
//    }
//}
