package com.exskil.controller;

import com.exskil.controller.BaseController.BaseController;
import com.exskil.po.Menu;
import com.exskil.po.News;
import com.exskil.po.Post;
import com.exskil.service.MenuService;
import com.exskil.service.NewsService;
import com.exskil.service.PostService;
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
    private NewsService newsService;

    @Autowired
    private PostService postService;

    @RequestMapping("index")
    public Object index(HttpSession httpSession) throws Exception{
        ModelAndView modelAndView=new ModelAndView();
        httpSession.setAttribute("id",this.getCurrentUser().getId());
        modelAndView.setViewName("redirect:../post/listpost.action");
        return modelAndView;
    }

    @RequestMapping("main")
    public ModelAndView main() throws Exception {
        ModelAndView mv = new ModelAndView();

        List<News> news = newsService.listNewsMain();
        mv.addObject("news",news);
        List<Post> posts = postService.listHotPost();
        mv.addObject("posts",posts);

        mv.setViewName("main/index");
        return mv;
    }
}
