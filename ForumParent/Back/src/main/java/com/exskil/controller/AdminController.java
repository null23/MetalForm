package com.exskil.controller;

import com.exskil.controller.BaseController.BaseController;
import com.exskil.po.Menu;
import com.exskil.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by LENOVO on 2017/5/10.
 */
@Controller
@RequestMapping("admin")
public class AdminController extends BaseController{

    @Autowired
    private MenuService menuService;

    @RequestMapping("index")
    public Object index(HttpSession httpSession) throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        List<Menu> menus = menuService.getMenu(this.getCurrentUser());
        httpSession.setAttribute("id",this.getCurrentUser().getId());
        modelAndView.setViewName("admin/main");
        modelAndView.addObject("menus",menus);
        httpSession.setAttribute("menus", menus);
        return modelAndView;
    }
}
